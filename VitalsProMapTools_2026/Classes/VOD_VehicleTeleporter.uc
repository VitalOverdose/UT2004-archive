//=============================================================================
// VehicleTeleporter By Vitaloverdose
// Teleports vehicles that touch it to random destination points
// Uses VitalsVehicleToolbox for BotLock, FX, impulse, and nav checking
//=============================================================================

class VOD_VehicleTeleporter extends VOD_Triggers
    placeable;

var VOD_VehicleToolbox              VTools;

var() bool                          bAllowTeleportEmptyVehicles;
var() Sound                         TeleportSound;

// Toolbox config - passed through to VTools on spawn
var() float                         BotLockDuration;
var() float                         ReScanDelay;
var() name                          DestinationTag;
var() bool                          bUseDirectionalImpulse;
var() bool                          bScanDestinations;
var() float                         VelocityMuliplier;
var() array<class<Emitter> >        AmbientEmitterPool;
var() array<class<Emitter> >        TeleportEmitterPool_Self;
var() array<class<Emitter> >        TeleportEmitterPool_Vehicle;
var() bool                          bAttachVehicleFXOnExit;
var() vector                        PointOfBoostForce;

replication
{
    reliable if ( Role == ROLE_Authority )
        TeleportFX;
}

function PostBeginPlay()
{
    // Spawn and configure the shared toolbox
    VTools                             = Spawn( class'VOD_VehicleToolbox' );
    VTools.BotLockDuration             = BotLockDuration;
    VTools.ReScanDelay                 = ReScanDelay;
    VTools.DestinationTag              = DestinationTag;
    VTools.bScanDestinations           = bScanDestinations;
    VTools.AmbientEmitterPool          = AmbientEmitterPool;
    VTools.TeleportEmitterPool_Vehicle = TeleportEmitterPool_Vehicle;
    VTools.TeleportEmitterPool_Self    = TeleportEmitterPool_Self;

    VTools.ScanTeleportDestinations();                                          // Scan for destinations

    if ( AmbientEmitterPool.Length > 0 )                                        // Spawn ambient FX on the teleporter
        VTools.SpawnRndEmitter( Location, AmbientEmitterPool, Self );
}

function Touch( Actor Other )
{
    if ( Other.IsA('Vehicle') == false )
        return;

    if ( Vehicle(Other).Driver == None && !bAllowTeleportEmptyVehicles )
        return;

    PreTeleportVehicle( Vehicle(Other) );
}

simulated function PreTeleportVehicle( Vehicle VehicleRef )
{
    local EPhysics  VehiclePhysics;
    local Actor     TeleportDestination;
    local Rotator   VehicleRotation;
    local Vector    BoostVelocity;

    TeleportDestination = VTools.PickRandomDestination( VehicleRef.default.CollisionRadius );

    if ( TeleportDestination == None )
        return;                                                                  // All destinations blocked

    VehiclePhysics  = VehicleRef.Physics;
    VehicleRotation = VehicleRef.Rotation;

    BoostVelocity   = (VehicleRef.Velocity << VehicleRotation);                 // Capture source-relative motion
    BoostVelocity   = BoostVelocity * VelocityMuliplier;                        // Apply multiplier

    TeleportVehicle( VehicleRef, TeleportDestination, VehiclePhysics, VehicleRotation, BoostVelocity );
}

simulated function TeleportVehicle( Vehicle VehicleRef, Actor TeleportDestination, EPhysics VehiclePhysics, Rotator VehicleRotation, Vector BoostVelocity )
{
    VehicleRef.SetPhysics( PHYS_None );
    VehicleRef.SetLocation( TeleportDestination.Location );
    PostVehicleTeleport( VehicleRef, TeleportDestination, VehicleRotation, VehiclePhysics, BoostVelocity );
}

simulated function PostVehicleTeleport( Vehicle VehicleRef, Actor TeleportDestination, Rotator VehicleRotation, EPhysics VehiclePhysics, Vector BoostVelocity )
{
    log( "==== Current Vehicle rotation: " $ VehicleRef.Rotation );
    log( "==== Current Exit rotation: "   $ TeleportDestination.Rotation );

    VehicleRotation = TeleportDestination.Rotation;
    VehicleRef.SetRotation( VehicleRotation );                                  // Set orientation
    VehicleRef.Controller.SetRotation( VehicleRotation );                       // Set controller/view rotation

    VehicleRef.SetPhysics( VehiclePhysics );                                    // Restore physics
    VehicleRef.Controller.MoveTimer = -1.0;                                     // Force bot to recompute paths
    VehicleRef.SetMoveTarget( Self );                                           // Nudge AI to recalc pathing

    VTools.LockDriverInVehicle( ONSVehicle(VehicleRef) );                       // Lock driver before boost
    VehicleBoost( VehicleRef, TeleportDestination, BoostVelocity );             // Kick the vehicle
    VTools.StabiliseAircraft( VehicleRef );                                     // Keep aircraft upright

    TeleportFX( VehicleRef, TeleportDestination );
}

simulated function VehicleBoost( Vehicle VehicleRef, Actor TeleportDestination, Vector BoostVelocity )
{
    VehicleRef.KAddImpulse( BoostVelocity >> TeleportDestination.Rotation, PointOfBoostForce >> VehicleRef.Rotation );
}

simulated function TeleportFX( Vehicle VehicleRef, Actor TeleportDestination )
{
    if ( TeleportEmitterPool_Vehicle.Length > 0 )
        VTools.SpawnRndEmitter( VehicleRef.Location, TeleportEmitterPool_Vehicle, VehicleRef );

    if ( TeleportEmitterPool_Self.Length > 0 )
        VTools.SpawnRndEmitter( Location, TeleportEmitterPool_Self, self );

    if ( TeleportSound != None )
        PlaySound( TeleportSound );
}

defaultproperties
{
    bAllowTeleportEmptyVehicles=false
    bScanDestinations=true
    bAttachVehicleFXOnExit=false
    BotLockDuration=2.0
    ReScanDelay=30.0
    DestinationTag="TeleportExit"
    VelocityMuliplier=500
}
