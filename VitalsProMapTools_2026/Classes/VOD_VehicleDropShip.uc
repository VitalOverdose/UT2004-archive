class VOD_VehicleDropShip extends VOD_DropShip;

var () Bool                               bEject_If_Inverted;                 // (could be fun..)
var () float                              fMaxDistanceDownToCheck;
var () float                              MinGroundClearance;
var () float                              scanrange;
var () Array < vector >		              TraceOffsets;
var    array < onsvehicle >               cargorec;
var () bool                               bSeekFlyingEscorts;
var () Bool                               bSeekEscorts;
var () bool                               bOnTheGround;
var () sound                              LandedSound;
var () sound                              Takeoffsound;
var () ephysics                           BackUpphysics;
var () float                              PilotZoneForward;   // distance from centre forward for pilot entry (cargo wall)
var () float                              PilotZoneDoorDepth; // how far back from cargo wall the door extends into bay
var () float                              MinFlightAltitude;  // minimum height before full flight unlocks

// ========================================================================================
// ORIGINAL PHYSICS BACKUP
// These store the vehicle's true live physics settings before parked mode overrides them.
// ========================================================================================

// ========================================================================================
// PARKED PHYSICS BACKUP
// Store only the values we know we can actually read and restore safely.
// ========================================================================================

var bool  bParkedPhysicsCaptured;

var float SavedGravScale;
var float SavedLinearDamping;
var float SavedAngularDamping;
var bool  SavedStayUpright;

 replication {reliable
            if (bNetDirty  &&  role == role_authority)
                bOnTheGround;
           }

 simulated function PostBeginPlay()
 {
  local rotator bonerot;

  log(self$"postbeginplay has been called");

 CaptureParkedPhysics();                                                     // capture all physics values

  bonerot=getbonerotation( 'middle_middle_weapon');
  //bonerot.yaw += rotation.yaw+32768;
  SetBoneRotation( 'middle_middle_weapon', bonerot );
  SetBoneRotation( 'Left_Front_weapon', bonerot );
  SetBoneRotation( 'Right_Front_weapon', bonerot );
  SetBoneRotation( 'left_middle_weapon', bonerot );
  SetBoneRotation( 'right_middle_weapon', bonerot );
  SetBoneRotation( 'Right_rear_weapon', bonerot );
  SetBoneRotation( 'Left_rear_weapon', bonerot );
 }


 // ========================================================================================
// ========================================================================================
// CAPTUREPARKEDPHYSICS()
// Save the original values that our parked-state setter calls are about to override.
// ========================================================================================

// ========================================================================================
// CAPTUREPARKEDPHYSICS()
// Save the original live values before parked mode overrides them.
// ========================================================================================

simulated function CaptureParkedPhysics()
{
    if (bParkedPhysicsCaptured)
    {
        return;
    }

    SavedGravScale      = KarmaParams(KParams).KActorGravScale;
    SavedLinearDamping  = KarmaParams(KParams).KLinearDamping;
    SavedAngularDamping = KarmaParams(KParams).KAngularDamping;
  //  SavedStayUpright    = KarmaParams(KParams).bKStayUpright;
    bParkedPhysicsCaptured = true;

    log("CaptureParkedPhysics(): values captured");
}


// ========================================================================================
// RESTOREPARKEDPHYSICS()
// Restore only the values we actually captured.
// ========================================================================================

simulated function RestoreParkedPhysics()
{
    if (!bParkedPhysicsCaptured)
    {
        return;
    }

    KSetActorGravScale(SavedGravScale);
    KSetDampingProps(SavedLinearDamping, SavedAngularDamping);
    log("RestoreParkedPhysics(): values restored");
}

 simulated function Capturevecs ()
 {
  local onsvehicle foundvec;
                                                                               log(self$"capturevecs was called");
  cargorec.length=0;
  foreach visiblecollidingactors(class'OnsVehicle',foundvec,Scanrange)
         {
                                                                               log("capturevecs:found a vec"$foundvec$". so thats "$cargorec.length$"found so far");
          if (( foundvec != self ) && (foundvec.bVehicleOnGround) && ( vsize( foundvec.velocity ) < 20))
             {
                                                                               log(foundvec$"will be made cargo");
              Addweight();
              cargorec.insert(0,1);
              cargorec[0]                           = foundvec;
              BackUpphysics                         = foundvec.physics;
              cargorec[0].bhardattach               = True;
              cargorec[0].SetPhysics(PHYS_None );                             // Remove the Physics from the Target Vehicle
              cargorec[0].Setbase(self );
              cargorec[0].bAllowViewChange          = bEject_If_Inverted;     // Sets inverted optiOns on the Vec
              cargorec[0].bDriverCannotLeaveVehicle = true;                   // Locks the vehicles until the flight is over
              cargorec[0].SetCollision( false , false , true );               // Switch off the collision on the Vehicle
             }
        }
  }

  simulated function EnlistEscorts()
  {
  local pawn foundpawn;
                                                                              // log("EnlistEscorts() has started");
  foreach visiblecollidingactors(class'pawn',foundpawn,Scanrange*2)
         {
                                                                              // log("EnlistEscorts(): found a pawn = "$foundpawn);
          if ((foundpawn.isa('xbot')&&(!foundpawn.IsHumanControlled()) &&
             (driver.controller.SameTeamAs(foundpawn.controller)) ))
             {
                                                                              // log("EnlistEscorts(): found It was an xbot +not human controlled = ");
             if (((bSeekFlyingEscorts) && foundpawn.IsA('onsraptor')) ||
                ((bSeekEscorts ) && (foundpawn.isa('onsattackcraft'))))
                {
                                                                              // log("EnlistEscorts(): it wa a bot controlled vec = ");
                  bot(foundpawn.controller).SetOrders('follow',Driver.Controller);
                }
             }
        }
 }

 simulated function ReleaseVehicles()
 {
  local int I;
                                                                              //    log("Time to release the cargo"$cargorec.length);
  if (cargorec.length > 0)
     {
                                                                              //   log("releasevecs():releasing"$cargorec[i]);
      for ( i=0 ; I< cargorec.length ; I++ )
          {
           cargorec[i].bHardattach              = false;
           cargorec[i].SetBase(None);                                         // Releasing Target Vec
           cargorec[i].SetPhysics(BackUpphysics);                             // Returns old physics
           cargorec[i].Setcollision(true , true , true);                      // Switches the collision back on.
           cargorec[i].bDriverCannotLeaveVehicle = False;                     // Unlocks the Vehicle
          }
      cargorec.length=0;
     }
  }

 simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> DamageType)
 {
  Momentum = Momentum*0.01;

  if (damage > Health)
      ReleaseVehicles();

  super.takedamage( Damage,  instigatedBy,  Hitlocation,  Momentum,  DamageType);
 }

 simulated function subweight()
 {
  local float Thegrav;
                                                                              // log("subweight()");
  thegrav=kgetactorgravscale() - (0.02*cargorec.length);
  ksetactorgravscale(thegrav);                                                // log("subweight:new weight is "$thegrav);
 }

 simulated function Addweight()
 {                                                                            //log("Addweight()");
  local float Thegrav;
  thegrav=kgetactorgravscale()+ 0.02;
  ksetactorgravscale(thegrav);
 }

simulated function LoudNoise(sound Sfx)
{
    // Only the server should generate the real AI/gameplay noise event.
    if (Role == ROLE_Authority)
    {
        MakeNoise(1.0);
    }

    // Only non-dedicated machines need to actually play the sound.
    if (Level.NetMode != NM_DedicatedServer)
    {
        PlaySound(Sfx);
    }
}


 simulated function Destroyed()
 {
                                                                              // log("Destroyed()");
  ReleaseVehicles();                                                              // log("Destroyed:ReleaseVecs()");
  VOD_DropShipFactory(Owner).Destroyed();                                        // log("informed "$owner$" im about to die");
  super.Destroyed();
 }

 // FIX: Removed runtime array insert — TraceOffsets is now fully defined in defaultproperties
 simulated  function bool CheckbOnTheGround()
 {
  local Vector TraceStart, TraceEnd,    HitLocation,HitNormal;
  Local float  Dist,       MarkerDist,  Total_DistanceDiff;
  Local int    I;
  local actor  HitActor;
                                                                              // log("CheckbOnTheGround()");
  for ( I = 0 ; I < TraceOffsets.length; I++)
      {
      TraceStart = Location + TraceOffsets[i];
      TraceEnd   = TraceStart - ( fMaxDistanceDownToCheck * Vect(0,0,1) );
      HitActor   = Trace(HitLocation , HitNormal , TraceEnd , TraceStart , true);
      Dist       = VSize(TraceStart-HitLocation);

      if ( I == 0 )
           MarkerDist = dist;
      else
      if ( HitActor != none )
           Total_DistanceDiff = MarkerDist - Dist;
      }


  if ( MarkerDist <= MinGroundClearance)
     {
                                                                              // log('CheckbOnTheGround:Ground clearence is good');
     if  (Total_DistanceDiff < 100)
         {
                                                                              // log(Self$"CheckbOnTheGround:Total diff on ground clearence was less than 100 - returning true");
          if ( VSize(velocity) < 10 )
             {
                                                                              // log ("CheckbOnTheGround():velocity is now correct to im  - returning true");
              return true;
             }
         }
     }
 else                                                                         // log ("CheckbOnTheGround:returning false");
 return false;
 }

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////auto simulated state FreeFall
auto simulated state FreeFall
{

 simulated function Timer()                                                   // perform a scan
  {                                                                           // log("=========state () FreeFall:Timer() started");
   bOnTheGround=CheckbOnTheGround();

   if  ( bOnTheGround == true )
       {
                                                                              // log("FreeFall:Timer:I am on the ground as bOnTheGround ="$bOnTheGround);
        if (landedsound!=None)
            LoudNoise(landedsound);

        GotoState('VehicleParked');                                           // log("FreeFall:Timer():GotoState('VehicleParked') was just called'");
        return;
       }
                                                                             // log("FreeFall:Timer():Im NOT on the ground this time'");
 SetTimer(0.1 , False);

 super.timer();
 }

Begin:
                                                                              // log("==========state FreeFall:state code has been called");
SetTimer(0.1  , False);
}

////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////// simulated state VehicleParked /

simulated state VehicleParked
{

simulated function BeginState()
{
   // CaptureParkedPhysics();                                                       log (" vehicle parked Begin state ");
   // KSetActorGravScale(2.0);                                                 // Make the craft feel heavier while parked.
   // KSetDampingProps(8.0, 8.0);                                              // Strongly resist linear sliding and angular wobble/spin.
   // KSetSkelVel(vect(0,0,0), vect(0,0,0), false);                            // Kill any carried motion as we enter the parked state.
}

simulated function EndState()
{                                                                              log (" vehicle parked end state ");
    RestoreParkedPhysics();
}


 simulated function bool TryToDrive(Pawn P)
 {
  local Vector LocalPos, X, Y, Z;
  local float  ForwardDist;
                                                                               log(" TryToDrive():an attempt to drive was made by"$p);
  GetAxes(Rotation, X, Y, Z);                                                  // Get the player's position in the dropship's local space
  LocalPos    = P.Location - Location;
  ForwardDist = LocalPos dot X;
                                                                               log("TryToDrive: ForwardDist="$ForwardDist$" PilotZoneForward="$PilotZoneForward);
  if ( ForwardDist >= (PilotZoneForward - PilotZoneDoorDepth) )                // Pilot entry zone: in front of cargo wall, OR in the thin door strip behind it
     {
                                                                               log("TryToDrive: Player is in pilot zone - allowing drive");
      return super.TryToDrive(P);
     }
                                                                               log("TryToDrive: Player is in cargo bay - rejecting drive");
  return false;
 }

 simulated function ClientKDriverEnter(PlayerController PC)
 {
  Capturevecs ();                                                              log("VehicleParked:ClientKDriverenter Capturevecs() - has been called and returned");
  enlistescorts();                                                             log("VehicleParked:ClientKDriverenter enlistescorts() - has been called and returned");
  GotoState ( 'ReadyToFly' );                                                  log("VehicleParked:ClientKDriverenter gotostate 'ReadyToFly' has been called");
 }

  simulated function KDriverEnter(pawn p)
 {
  Capturevecs ();                                                              log("VehicleParked:KDriverenter Capturevecs ()               has been called and returned");
  enlistescorts();                                                             log("VehicleParked:KDriverenter enlistescorts ()             has been called and returned");
  GotoState ( 'ReadyToFly' );                                                  log("VehicleParked:KDriverenter GotoState('ReadyToFly')      has been called and returned");
 }

Begin:
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////// state ReadyToFly

simulated state ReadyToFly
{

simulated function Tick(float DeltaTime)
{
 local Vector HitLocation, HitNormal;
 local Actor  HitActor;
 local float  Altitude;

 Throttle = 0;
 Steering = 0;

 // Check altitude
 HitActor = Trace(HitLocation, HitNormal, Location - (5000 * Vect(0,0,1)), Location, true);

 if (HitActor != None)
    {
     Altitude = VSize(Location - HitLocation);
    }

 if (Altitude > MinFlightAltitude)
    {
     GotoState('VehicleFlying');
    }

 Rise = Rise * 0.7;
 Super.Tick(DeltaTime);
}

 simulated function ClientKDriverLeave(PlayerController PC)                    // Player exits without taking off - release cargo and go back to parked
 {                                                                              // log("ReadyToFly:ClientKDriverLeave START");
  ReleaseVehicles();                                                               // log("ReadyToFly:ClientKDriverLeave releasevecs() called");
  SubWeight();                                                                 // log("ReadyToFly:ClientKDriverLeave subweight() called");
  GotoState('FreeFall');
  //GotoState('VehicleParked');                                                // log("ReadyToFly:ClientKDriverLeave GotoState('VehicleParked') called");
  super.clientkDriverleave(PC);
 }

 simulated event bool KDriverLeave( bool bForceLeave )
 {
                                                                               // log("ReadyToFly:KDriverLeave START");
  ReleaseVehicles();                                                               // log("ReadyToFly:KDriverLeave releasevecs() called");
  SubWeight();                                                                 // log("ReadyToFly:KDriverLeave subweight() called");
  GotoState('FreeFall');
  //GotoState('VehicleParked');                                                // log("ReadyToFly:KDriverLeave GotoState('VehicleParked') called");
  return super.kDriverleave(bForceLeave);
 }

Begin:
 Ksetactorgravscale(0.1);

if (takeoffsound!=None)
    loudnoise(takeoffsound);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////// state VehicleFlying

state VehicleFlying
{
 simulated function ClientKDriverLeave(PlayerController PC)
 {                                                                            // log("VehicleFlying:ClientKDriverLeave START");
  ReleaseVehicles();                                                              // log("VehicleFlying:ClientKDriverLeave releasevecs() called");
  SubWeight();                                                                // log("VehicleFlying:ClientKDriverLeave subweight() called");
  GotoState('FreeFall');                                                      // log("VehicleFlying:ClientKDriverLeave GotoState('FreeFall') called");
  super.clientkDriverleave(PC);
 }

 simulated event bool KDriverLeave( bool bForceLeave )
 {
  ReleaseVehicles();                                                              // log("VehicleFlying:KDriverLeave releasevecs() called");
  SubWeight();                                                                // log("VehicleFlying:KDriverLeave subweight() called");
  GotoState('FreeFall');                                                      // log("VehicleFlying:KDriverLeave GotoState('FreeFall') called");
  return super.kDriverleave(bForceLeave);
 }

begin:
                                                                               log("now in state VehicleFlying");
if (takeoffsound!=None)
    LoudNoise(takeoffsound);
}

defaultproperties
{
	bSeekFlyingEscorts=True
	bSeekEscorts=True
    bPathColliding=True

    fMaxDistanceDownToCheck=5000.000000
	MinGroundClearance=260.000000
	scanrange=1024.000000
	PilotZoneForward=480.000000
	PilotZoneDoorDepth=96 .000000

	TraceOffsets(0)=(X=0.000000,Y=0.000000,Z=0.000000)
	TraceOffsets(1)=(X=100.000000)
	TraceOffsets(2)=(X=-100.000000)
	TraceOffsets(3)=(Y=100.000000)
	TraceOffsets(4)=(Y=-100.000000)

	DriverWeapons(0)=(WeaponClass=Class'darkhover.Mortician_Head',WeaponBone="bn_middle_front_weapon")
	PassengerWeapons(0)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="_bn_Right_Front_Weapon")
	PassengerWeapons(1)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="bn_Left_Front_Weapon")
	PassengerWeapons(2)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="bn_Right_Middle_Weapon")
	PassengerWeapons(3)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="bn_Left_Middle_Weapon")
	PassengerWeapons(4)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="bn_Left_Rear_Weapon")
	PassengerWeapons(5)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="bn_Right_Rear_Weapon")
	VehicleMass=12.000000
	HealthMax=2000.000000
	Health=2000
	TPCamDistance=1400.000000

	MinFlightAltitude=700.000000

}
