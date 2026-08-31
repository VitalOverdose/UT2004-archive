//=============================================================================
// VitalsVehicleToolbox By Vitaloverdose
// Spawnable helper class providing shared vehicle systems:
//   - BotLock: temporarily locks drivers into vehicles
//   - FX: spawn random emitters from pools
//   - Impulse: apply boost forces to vehicles
//   - Nav: check if a location is blocked
//   - Destinations: scan and pick teleport destinations
//
// Usage: any class can spawn this and call its functions
//   VTools = Spawn( class'VitalsVehicleToolbox' );
//   VTools.LockDriverInVehicle( SomeVehicle );
//=============================================================================

class VOD_VehicleToolbox extends Actor;

//-----------------------------------------------------------------------------
// BotLock System
//-----------------------------------------------------------------------------

struct LockedVehicleInfo
{
    var ONSVehicle  LockedVehicleRef;
    var float       RemainingLockTime;
    var bool        bReadyToUnlock;
};

var array<LockedVehicleInfo>        LockedVehicles;
var bool                            bTrackingLockedVehicles;
var() float                         BotLockDuration;
var() float                         TimerFrequency;

//-----------------------------------------------------------------------------
// Destination System
//-----------------------------------------------------------------------------

var array<Actor>                    TeleportDestinations;
var() Name                          DestinationTag;
var() bool                          bScanDestinations;
var() float                         ReScanDelay;
var float                           NextRescan;

//-----------------------------------------------------------------------------
// Impulse System
//-----------------------------------------------------------------------------

var Vector                          AppliedBoostForce;
var() bool                          bUseDirectionalImpulse;

//-----------------------------------------------------------------------------
// FX System
//-----------------------------------------------------------------------------

var() array<class<Emitter> >        AmbientEmitterPool;
var() array<class<Emitter> >        VehicleTagEmitterPool;
var() array<class<Emitter> >        TeleportEmitterPool_Vehicle;
var() array<class<Emitter> >        TeleportEmitterPool_Self;

//=============================================================================
// BotLock
//=============================================================================

function LockDriverInVehicle( ONSVehicle TargetVehicle )
{
    local LockedVehicleInfo NewEntry;

    if ( TargetVehicle == None )
        return;

    TargetVehicle.bDriverCannotLeaveVehicle = true;

    NewEntry.LockedVehicleRef  = TargetVehicle;
    NewEntry.RemainingLockTime = BotLockDuration;
    NewEntry.bReadyToUnlock = TargetVehicle.IsA('ONSChopperCraft') ||
                              TargetVehicle.IsA('ONSHoverCraft')   ||
                              TargetVehicle.IsA('ONSPlaneCraft');

    LockedVehicles[LockedVehicles.Length] = NewEntry;

    if ( !bTrackingLockedVehicles )
    {
        bTrackingLockedVehicles = true;
        SetTimer( TimerFrequency, true );
    }
}

function bool CheckGrounded( ONSVehicle TargetVehicle )
{
    local int i;

    if ( TargetVehicle == None )
        return true;

    for ( i = 0; i < TargetVehicle.Wheels.Length; i++ )
    {
        if ( TargetVehicle.Wheels[i].bWheelOnGround == false )
        {
            if ( VSize( TargetVehicle.Velocity ) < 10.0 )                         // Not grounded - but if not moving either, assume stuck in scenery
                return true;
            return false;
        }
    }
    return true;
}

function Timer()
{
    local int Counter;

    // BotLock: wait for grounded, then count down release delay
    for ( Counter = LockedVehicles.Length - 1; Counter >= 0; Counter-- )
    {
        if ( !LockedVehicles[Counter].bReadyToUnlock )
        {
            // Phase 1: waiting for vehicle to land
            if ( CheckGrounded( LockedVehicles[Counter].LockedVehicleRef ) )
            {
                LockedVehicles[Counter].bReadyToUnlock    = true;
                LockedVehicles[Counter].RemainingLockTime = BotLockDuration;
            }
        }
        else
        {
            // Phase 2: grounded, counting down settle delay
            LockedVehicles[Counter].RemainingLockTime -= TimerFrequency;

            if ( LockedVehicles[Counter].RemainingLockTime <= 0 )
            {
                if ( LockedVehicles[Counter].LockedVehicleRef != None )
                    LockedVehicles[Counter].LockedVehicleRef.bDriverCannotLeaveVehicle = false;

                LockedVehicles.Remove( Counter, 1 );
            }
        }
    }

    // Handle periodic destination rescanning
    if ( bScanDestinations && ReScanDelay > 0 )
    {
        NextRescan -= TimerFrequency;

        if ( NextRescan <= 0 )
        {
            ScanTeleportDestinations();
            NextRescan = ReScanDelay;
        }
    }

    // Stop timer if nothing left to do
    if ( LockedVehicles.Length == 0 && !bScanDestinations )
    {
        bTrackingLockedVehicles = false;
        SetTimer( 0, false );
    }
}

//=============================================================================
// Destination System
//=============================================================================

simulated function ScanTeleportDestinations()
{
    local Actor FoundActor;

    TeleportDestinations.Length = 0;

    foreach AllActors( class'Actor', FoundActor, DestinationTag )
    {
        TeleportDestinations[TeleportDestinations.Length] = FoundActor;
    }
}

function Actor PickRandomDestination( float CollisionRadius )
{
    local array<Actor>  RemainingDestinations;
    local int           Counter;
    local int           RandomIndex;
    local Vector        TestLocation;

    // Copy the list so we can remove entries without affecting the master
    RemainingDestinations.Length = TeleportDestinations.Length;

    for ( Counter = 0; Counter < TeleportDestinations.Length; Counter++ )
    {
        RemainingDestinations[Counter] = TeleportDestinations[Counter];
    }

    // Try random destinations until we find one that isn't blocked
    while ( RemainingDestinations.Length > 0 )
    {
        RandomIndex  = Rand( RemainingDestinations.Length );
        TestLocation = RemainingDestinations[RandomIndex].Location;

        if ( !IsTeleportDestinationBlocked( CollisionRadius, TestLocation ) )
        {
            return RemainingDestinations[RandomIndex];
        }

        RemainingDestinations.Remove( RandomIndex, 1 );
    }

    return None;
}

function bool IsTeleportDestinationBlocked( float ScanRadius, Vector TestLocation )
{
    local Actor FoundActor;

    foreach RadiusActors( class'Actor', FoundActor, ScanRadius, TestLocation )
    {
        if ( FoundActor != Self && FoundActor.bCollideActors )
        {
            return true;
        }
    }

    return false;
}

//=============================================================================
// Impulse System
//=============================================================================

function ApplyVehicleImpulse( ONSVehicle TargetVehicle, Actor DirectionSource )
{
    local Vector PointOfForce;
    local Actor  RotRelation;

    if ( TargetVehicle == None )
        return;

    if ( bUseDirectionalImpulse && DirectionSource != None )
    {
        RotRelation = DirectionSource;
    }
    else
    {
        RotRelation = TargetVehicle;
    }

    TargetVehicle.KAddImpulse( AppliedBoostForce >> RotRelation.Rotation, PointOfForce >> RotRelation.Rotation );
}

function StabiliseAircraft( Vehicle VehiclePawn )
{
    if ( VehiclePawn.IsA('ONSChopperCraft') ||
         VehiclePawn.IsA('ONSHoverCraft')   ||
         VehiclePawn.IsA('ONSPlaneCraft') )
    {
        VehiclePawn.KSetStayUpright( true, true );
    }
}

//=============================================================================
// FX System
//=============================================================================

simulated function Emitter SpawnRndEmitter( Vector SpawnPos, array<class<Emitter> > EmitterPool, Actor HardAttachedTo )
{
    local int             RandomIndex;
    local class<Emitter>  ChosenClass;
    local Emitter         SpawnedEmitter;

    if ( EmitterPool.Length <= 0 )
        return None;

    RandomIndex  = Rand( EmitterPool.Length );
    ChosenClass  = EmitterPool[RandomIndex];

    SpawnedEmitter = Spawn( ChosenClass, Self,, SpawnPos, Rotation );

    if ( SpawnedEmitter != None )
       SpawnedEmitter.SetBase( HardAttachedTo );

    return SpawnedEmitter;
}

//=============================================================================
// Defaults
//=============================================================================

defaultproperties
{
    BotLockDuration=2.0
    TimerFrequency=1.0
    ReScanDelay=30.0
    DestinationTag='TP'
    bScanDestinations=true
    bUseDirectionalImpulse=false
    bHidden=true
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
}
