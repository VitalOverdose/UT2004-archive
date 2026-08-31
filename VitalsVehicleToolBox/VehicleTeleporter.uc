//=============================================================================
// VehicleTeleporter By Vitaloverdose
// Teleports vehicles that touch it to random destination points
// Uses VitalsVehicleToolbox for BotLock, FX, impulse, and nav checking
//=============================================================================

class VODVehicleTeleporter extends VODTriggers
    placeable;

var VitalsVehicleToolbox            VTools;

var() bool                          bAllowTeleportEmptyVehicles;
var() Sound                         TeleportSound;

// Toolbox config — passed through to VTools on spawn
var() float                         BotLockDuration;
var() float                         ReScanDelay;
var() Name                          DestinationTag;
var() bool                          bDirectional;
var() bool                          bScanDestinations;
var() array<class<Emitter> >        AmbientEmitterPool;
var() array<class<Emitter> >        TeleportEmitterPool_Vehicle;
var() array<class<Emitter> >        TeleportEmitterPool_Self;

function PostBeginPlay()
{
    // Spawn and configure the shared toolbox
    VTools = Spawn( class'VitalsVehicleToolbox' );
    VTools.BotLockDuration   = BotLockDuration;
    VTools.ReScanDelay       = ReScanDelay;
    VTools.DestinationTag    = DestinationTag;
    VTools.bDirectional      = bDirectional;
    VTools.bScanDestinations = bScanDestinations;
    VTools.AmbientEmitterPool          = AmbientEmitterPool;
    VTools.TeleportEmitterPool_Vehicle = TeleportEmitterPool_Vehicle;
    VTools.TeleportEmitterPool_Self    = TeleportEmitterPool_Self;

    // Scan for destinations
    VTools.ScanTeleportDestinations();

    // Spawn ambient FX on the teleporter
    if ( AmbientEmitterPool.Length > 0 )
    {
        VTools.SpawnRndEmitter( Self.Location, AmbientEmitterPool, Self );
    }
}

function Touch( Actor Other )
{
    if ( Other.IsA('Vehicle') )
    {
        if ( Vehicle(Other).Driver == None && !bAllowTeleportEmptyVehicles )
        {
            return;
        }

        TeleportVehicle( Vehicle(Other) );
    }
}

simulated function TeleportVehicle( Vehicle TeleportingVehicle )
{
    local EPhysics  EntryPhysics;
    local Actor     ChosenDest;
    local Rotator   NewRotation;

    // Find a clear destination
    ChosenDest = VTools.PickRandomDestination( TeleportingVehicle.default.CollisionRadius );

    if ( ChosenDest == None )
        return; // All destinations blocked

    // Store entry state
    EntryPhysics = TeleportingVehicle.Physics;
    VTools.AppliedBoostForce = TeleportingVehicle.Velocity * 500;

    // Freeze, move, orient
    TeleportingVehicle.SetPhysics( PHYS_None );
    TeleportingVehicle.SetLocation( ChosenDest.Location );

    NewRotation     = TeleportingVehicle.Rotation;
    NewRotation.Yaw = ChosenDest.Rotation.Yaw
                      + TeleportingVehicle.Rotation.Yaw
                      - Self.Rotation.Yaw;

    PostVehicleTeleport( TeleportingVehicle, NewRotation, EntryPhysics );
}

simulated function PostVehicleTeleport( Vehicle TeleportingVehicle, Rotator NewRotation, EPhysics EntryPhysics )
{
    // Restore physics
    TeleportingVehicle.SetPhysics( EntryPhysics );
    TeleportingVehicle.Controller.MoveTimer = -1.0;
    TeleportingVehicle.SetMoveTarget( Self );
    TeleportingVehicle.Controller.SetRotation( NewRotation );
    TeleportingVehicle.SetRotation( NewRotation );

    // Keep aircraft upright
    VTools.StabiliseAircraft( TeleportingVehicle );

    // Apply exit boost
    VTools.ApplyVehicleImpulse( ONSVehicle(TeleportingVehicle), Self );

    // Lock driver in during teleport
    VTools.LockDriverInVehicle( ONSVehicle(TeleportingVehicle) );

    // FX and sound
    if ( TeleportEmitterPool_Vehicle.Length > 0 )
    {
        VTools.SpawnRndEmitter( TeleportingVehicle.Location, TeleportEmitterPool_Vehicle, TeleportingVehicle );
    }

    if ( TeleportEmitterPool_Self.Length > 0 )
    {
        VTools.SpawnRndEmitter( Self.Location, TeleportEmitterPool_Self, Self );
    }

    if ( TeleportSound != None )
    {
        PlaySound( TeleportSound );
    }
}

defaultproperties
{
    bAllowTeleportEmptyVehicles=false
    bScanDestinations=true
    bDirectional=false
    BotLockDuration=2.0
    ReScanDelay=30.0
    DestinationTag='TP'
}
