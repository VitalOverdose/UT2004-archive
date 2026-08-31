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

// Toolbox config — passed through to VTools on spawn
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
reliable if (Role == ROLE_Authority)
             TeleportFX;
}

function PostBeginPlay()
{
    // Spawn and configure the shared toolbox
    VTools                             = Spawn( class'VOD_VehicleToolbox' );
    VTools.BotLockDuration             = BotLockDuration;
    VTools.ReScanDelay                 = ReScanDelay;
    VTools.DestinationTag              = DestinationTag;
    VTools.bDirectional                = bDirectional;
    VTools.bScanDestinations           = bScanDestinations;
    VTools.AmbientEmitterPool          = AmbientEmitterPool;
    VTools.TeleportEmitterPool_Vehicle = TeleportEmitterPool_Vehicle;
    VTools.TeleportEmitterPool_Self    = TeleportEmitterPool_Self;

    VTools.ScanTeleportDestinations();                                          // Scan for destinations

    if ( AmbientEmitterPool.Length > 0 )                                        // Spawn ambient FX on the teleporter
         SpawnRndEmitter( Self, AmbientEmitterPool );
}

function Touch( Actor Other )
{                                                                               //  Log("TOUCHED");

if ( Other.IsA('Vehicle')==false )
     return;

if ( Vehicle(Other).Driver == None && !bAllowTeleportEmptyVehicles )
     return;

PreTeleportVehicle ( Vehicle(Other) );
}

simulated function PreTeleportVehicle( Vehicle VehicleRef )
{
    local EPhysics  VehiclePhysics;
    local Actor     TeleportDestination;
    local Rotator   VehicleRotation;
    local Vector    BoostVelocity;

    TeleportDestination = VTools.PickRandomDestination( VehicleRef.default.CollisionRadius );                // Find a clear destination

    if ( TeleportDestination == None )
        return;                                                                                            // All destinations blocked

    VehiclePhysics           = VehicleRef.Physics;
    VehicleRotation          = VehicleRef.Rotation;

    BoostVelocity            = (VehicleRef.Velocity << VehicleRotation);                                       // capture source relative motion as velocity is relative to the to the world
    BoostVelocity            = BoostVelocity * VelocityMuliplier;                                     // apply the multiplier for a boost
                                                                                                          // Freeze, move, orient
    TeleportVehicle (VehicleRef, TeleportDestination,  VehiclePhysics ,VehicleRotation , BoostVelocity);
}

simulated function TeleportVehicle( Vehicle VehicleRef, Actor TeleportDestination,  EPhysics VehiclePhysics, Rotator VehicleRotation, vector BoostVelocity)
{
    VehicleRef.SetPhysics( PHYS_None );
    VehicleRef.SetLocation( TeleportDestination.Location );
    PostVehicleTeleport( VehicleRef, TeleportDestination, VehicleRotation, VehiclePhysics, BoostVelocity );
}

simulated function PostVehicleTeleport( Vehicle VehicleRef, Actor TeleportDestination, rotator VehicleRotation,  EPhysics VehiclePhysics, vector BoostVelocity )
{
   log ("==== Current Vehicle rotation: "$ VehicleRef.Rotation);
   log ("==== Current Exit rotation: "$ TeleportDestination.Rotation);

   VehicleRotation = TeleportDestination.Rotation;                             // Set Orientation
   VehicleRef.SetRotation( VehicleRotation );                                  // Set Orientation
   VehicleRef.Controller.SetRotation( VehicleRotation );                       // Set controler rotation which also sets the view rotation

   VehicleRef.SetPhysics( VehiclePhysics );                                    // Restore Vehicle
   VehicleRef.Controller.MoveTimer = -1.0;                                     // Force Bots to recompute paths in new location
   VehicleRef.SetMoveTarget( self );                                           // nudges the AI to recalc pathing relative to the teleporter actor.
   VehicleBoost(VehicleRef,TeleportDestination, BoostVelocity);                                    // Kick the vehicle
   VTools.StabiliseAircraft( VehicleRef );                                     // Keep aircraft upright
   VTools.LockDriverInVehicle( ONSVehicle(VehicleRef) );                       // Lock driver in during teleport

   TeleportFX(VehicleRef, TeleportDestination);
}

Simulated function  VehicleBoost( Vehicle VehiclRef,Actor TeleportDestination, vector BoostVelocity )
{



  // VehiclRef.KAddImpulse( BoostVelocity >> VehiclRef.Rotation, PointOfBoostForce >> VehiclRef.Rotation ) ;
   VehiclRef.KAddImpulse( BoostVelocity >> TeleportDestination.rotation, PointOfBoostForce >> VehiclRef.Rotation ) ;

}

simulated function TeleportFX( Vehicle VehicleRef, Actor TeleportDestination) // FX and sound
{

  if ( TeleportEmitterPool_Vehicle.Length > 0 )
       SpawnRndEmitter( VehicleRef, TeleportEmitterPool_Vehicle  );             // Fx for Vehicle

  if ( TeleportEmitterPool_Self.Length > 0 )                                    // Fx for Teleport desination
       SpawnRndEmitter( self, TeleportEmitterPool_Self );

  if ( TeleportSound != None )                                                  // Sound fx
       PlaySound( TeleportSound );
}

simulated function SpawnRndEmitter( Actor ActorRef, array<class<Emitter> > EmitterList)
{
    local class<Emitter>  RandomEmitter;
    local Emitter         SpawnedEmitter;
    local int             RandomIndex;

    RandomIndex    = Rand( EmitterList.Length );
    RandomEmitter  = EmitterList[RandomIndex];

    SpawnedEmitter = Spawn( RandomEmitter, Self,, ActorRef.Location );

    if ( bAttachVehicleFXOnExit != false && SpawnedEmitter != None && ActorRef != None )
         SpawnedEmitter.SetBase( ActorRef );
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
    // bDirectional=false   not needed
    }
