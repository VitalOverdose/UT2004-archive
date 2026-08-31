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
Var() Vect                          VelocityMuliplier;
var() array<class<Emitter> >        AmbientEmitterPool;
var() array<class<Emitter> >        TeleportEmitterPool_Self;
var() array<class<Emitter> >        TeleportEmitterPool_Vehicle;
var() bool                          bAttachVehicleFXOnExit;


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
                                                                                Log("VTools spawned: " $ VTools);
                                                                                Log("Found destinations: " $ VTools.TeleportDestinations.Length);
}

function Touch( Actor Other )
{                                                                                 Log("TOUCHED");

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
    BoostVelocity            = VehicleRef.Velocity * 500;

    //VTools.AppliedBoostForce = TeleportingVehicle.Velocity * 500;                                                                                                                                                        // Freeze, move, orient
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

     //                                     // Set Orientation
     VehicleRotation = TeleportDestination.Rotation;
     VehicleRef.SetRotation( VehicleRotation );

    //VehicleRotation.Yaw = VehicleRef.Rotation.Yaw + TeleportDestination.Rotation.Yaw - Self.Rotation.Yaw;
    VehicleRef.Controller.SetRotation( VehicleRotation );

    VehicleRef.SetPhysics( VehiclePhysics );                                                     // Restore Vehicle
    VehicleRef.Controller.MoveTimer = -1.0;
    VehicleRef.SetMoveTarget( self );
    VecBoost(VehicleRef,BoostVelocity)



    // VTools.StabiliseAircraft( TeleportingVehicle );                                           // Keep aircraft upright
    // VecBoost( ONSVehicle(TeleportingVehicle), self );                                         // Apply exit boost
    // VTools.LockDriverInVehicle( ONSVehicle(TeleportingVehicle) );                             // Lock driver in during teleport

 TeleportFX(VehicleRef, TeleportDestination);
}

Simulated function  VehicleBoost( OnsVehicle VehiclRef, vector BoostVelocity )
{

   Local Vector PointOfBoostForce;  // if not set defaults to(0,0,0)  ie. the center of the vec.
   local Actor  RotationRelation;

   RotationRelation   = self ;

   VehiclRef.KAddImpulse( BoostVelocity >> RotationRelation.Rotation, PointOfBoostForce >> RotationRelation.Rotation ) ;

// EnterVecRec( VehiclRef );
}


 simulated function TeleportFX( Vehicle VehicleRef, Actor TeleportDestination)                      // FX and sound
 {

  if ( TeleportEmitterPool_Vehicle.Length > 0 )
       SpawnRndEmitter( VehicleRef, TeleportEmitterPool_Vehicle  );       // Fx for Vehicle

  if ( TeleportEmitterPool_Self.Length > 0 )
       SpawnRndEmitter( self, TeleportEmitterPool_Self );

  if ( TeleportSound != None )
       PlaySound( TeleportSound );
 }

//=============================================================================
// FX System
//=============================================================================

simulated function Emitter SpawnRndEmitter( Actor ActorRef, array<class<Emitter> > EmitterList)
{
    local class<Emitter>  RandomEmitter;
    local Emitter         SpawnedEmitter;
    local int             RandomIndex;

    RandomIndex    = Rand( EmitterList.Length );
    RandomEmitter  = EmitterList[RandomIndex];

    SpawnedEmitter = Spawn( RandomEmitter, Self,, ActorRef.Location );

    if ( bAttachVehicleFXOnExit != false && SpawnedEmitter == None && ActorRef != None )
         SpawnedEmitter.SetBase( ActorRef );
}

defaultproperties
{

    bAllowTeleportEmptyVehicles=false
    bScanDestinations=true
    bDirectional=false
    bAttachVehicleFXOnExit=false
    BotLockDuration=2.0
    ReScanDelay=30.0
    DestinationTag='TP'
    VelocityMuliplier=500
}
