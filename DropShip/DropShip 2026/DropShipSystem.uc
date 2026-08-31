Class DropShipSystem extends DarkDropShip;
 
var () Bool                               bEject_If_Inverted;                 // (could be fun..)
var () float                              fMaxDistanceDownToCheck;           // set at level stalz
var () float                              MinGroundClearance; // a numb slightly > than the distance of
                                                              // center point of the vec to the ground           
var () float                              scanrange;          // the size of the cargobay
var () Array < vector >                        TraceOffsets;       // the craft fires trace lines to the 
                                                              // ground to measure altitude and Tilt 
                                                              // during the gravitySucks state
var    array < onsvehicle >               cargorec;
var () bool                               bSeekFlyingEscorts;
var () Bool                               bSeekEscorts;
var () bool                               bontheground;
var () sound                              LandedSound;
var () sound                              Takeoffsound;
var () ephysics                           BackUpphysics;
 
 replication {
             reliable
             if (bNetDirty  &&  role == role_authority)
                 bontheground;
             }
 
 simulated function PostBeginPlay()
 {
  local rotator bonerot;
 
  log(self$"postbeginplay has been called");
  Ksetactorgravscale(0.1);
 
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
 
 simulated function capturevecs ()
 {
  local onsvehicle foundvec;
                                                                              // log(self$"capturevecs was called");
  cargorec.length=0;
  foreach visiblecollidingactors(class'OnsVehicle',foundvec,Scanrange)
         {
                                                                              // log("capturevecs:found a vec"$foundvec$". so thats "$cargorec.length$"found so far");
          if (( foundvec != self ) && (foundvec.bVehicleOnGround) && ( vsize( foundvec.velocity ) < 20))
             {
                                                                              // log(foundvec$"will be made cargo");
              Addweight();
              cargorec.insert(0,1);
              cargorec[0]                           = foundvec;
              BackUpphysics                         = foundvec.physics;
              cargorec[0].bhardattach               = True;
              cargorec[0].SetPhysics(PHYS_None );                             // Remove the Physics from the Target Vehicle
              cargorec[0].Setbase(self );
              cargorec[0].bAllowViewChange          = bEject_If_Inverted;     // Sets inverted optiOns on the Vec
              cargorec[0].bDriverCannotLeaveVehicle = true;                   // Locks the vehicles until the flight is over
              cargorec[0].setcollision( False , False , true );               // Switch off the collision on the Vehicle
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
 
 simulated function releasevecs()
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
           cargorec[i].setcollision(true , True , true);                      // Switches the collision back on.
           cargorec[i].bDriverCannotLeaveVehicle = False;                     // Unlocks the Vehicle
          }
      cargorec.length=0;
     }
  }
 
 simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> DamageType)
 {
  momentum = momentum*0.01;
  if (damage>Health)
      Releasevecs();
  super.takedamage( Damage,  instigatedBy,  Hitlocation,  Momentum,  DamageType);
 }
 
 simulated function subweight()
 {
  local float Thegrav;                                                        // log("subweight()");
  thegrav=kgetactorgravscale() - (0.02*cargorec.length);
  ksetactorgravscale(thegrav);                                                // log("subweight:new weight is "$thegrav);
 }
 
 simulated function Addweight()
 {                                                                            //log("Addweight()");
  local float Thegrav;
  thegrav=kgetactorgravscale()+ 0.02;
  ksetactorgravscale(thegrav);
 }
 
 simulated function loudnoise(sound sfx)
 {
                                                                              // log("loudnoise()");
  makenoise(1.0);
  playsound(sfx);
 }
 
 
 simulated function Destroyed()
 {
                                                                              // log("Destroyed()");
  ReleaseVecs();                                                              // log("Destroyed:ReleaseVecs()");
  DarkhoverSpawner(owner).Destroyed();                                        // log("informed "$owner$" im about to die");
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
          if ( vsize(velocity) < 10 )
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
///////////////////////////////////////////////////////////auto simulated state GravitySucks
auto simulated state GravitySucks
{
 
 simulated function Timer()                                                   // perform a scan
  {                                                                           // log("=========state () GravitySucks:Timer() started");
   bOnTheGround=CheckbOnTheGround();
   if  ( bOnTheGround == true )
       {
                                                                              // log("GravitySucks:Timer:I am on the ground as bOnTheGround ="$bOnTheGround);
        if (landedsound!=None)
            Loudnoise(landedsound);
        GotoState('VehicleParked');                                           // log("GravitySucks:Timer():GotoState('VehicleParked') was just called'");
        return;
       }                                                                      // log("GravitySucks:Timer():Im NOT on the ground this time'");
 SetTimer(0.1 , False);
 super.timer();
 }
 
Begin:
                                                                              // log("==========state GravitySucks:state code has been called");
SetTimer(0.1  , False);
}
 
////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////// simulated state VehicleParked /
 
simulated state VehicleParked
{
 
 simulated function bool TryToDrive(Pawn P)
 {
                                                                              // log(" TryToDrive():an attempt to drive was made by"$p);
  super.TryToDrive(P);
 }
 
 simulated function ClientKDriverEnter(PlayerController PC)
 {
                                                                              // log("VehicleParked:ClientKDriverenter START");
  Capturevecs ();                                                             // log("VehicleParked:ClientKDriverenter enlistescorts() - has been called and returned");
  enlistescorts();                                                            // log("VehicleParked:ClientKDriverenter enlistescorts() - has been called and returned");
  GotoState ( 'VehicleFlying' );                                              // log("VehicleParked:ClientKDriverenter gotostate 'VehicleFlying' has been called");
  super.ClientKDriverEnter( PC );
 }
 
  simulated function KDriverEnter(pawn p)
 {
                                                                              // log("VehicleParked:KDriverenter                              START");
  Capturevecs ();                                                             // log("VehicleParked:KDriverenter Capturevecs ()               has been called and returned");
  enlistescorts();                                                            // log("VehicleParked:KDriverenter enlistescorts ()             has been called and returned");
  GotoState ( 'VehicleFlying' );                                              // log("VehicleParked:KDriverenterGotoState ( 'VehicleFlying' ) has been called and returned");
  super.KDriverEnter( P );
 }
 
Begin:
                                                                              // log("now in state () VehicleParked start of state code");
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////// state VehicleFlying
 
state VehicleFlying
{
 simulated function ClientKDriverLeave(PlayerController PC)
 {                                                                            // log("VehicleFlying:ClientKDriverLeave releasevecs() has been called and returned ");
                                                                              // log("VehicleFlying:ClientKDriverLeave releasevecs() has been called and returned");
  releasevecs();                                                              // log("VehicleFlying:ClientKDriverLeave subweight()   has been called and returned");
  subweight();                                                                // log("VehicleFlying:ClientKDriverLeave goto state GravitySucks has been called ");
  GotoState('GravitySucks');
  super.clientkDriverleave(PC);
 }
 
 simulated event bool KDriverLeave( bool bForceLeave )
 {
                                                                              // log("VehicleFlying:KDriverLeave              * Started *");
  releasevecs();                                                              // log("VehicleFlying:KDriverLeave:releasevecs()              has been called and returned");
  subweight();                                                                // log("VehicleFlying:KDriverLeave:subweight()                has been called and returned");
  GotoState('GravitySucks');                                                  // log("VehicleFlying:KDriverLeave :GotoState('GravitySucks') has been called and returned");
  super.kDriverleave(bForceLeave);
 }
 
begin:
if (takeoffsound!=None)
    loudnoise(takeoffsound);
                                                                              // log("now in state VehicleFlying");
}
 
defaultproperties
{
     fMaxDistanceDownToCheck=5000.000000
     MinGroundClearance=260.000000
     scanrange=1024.000000
     TraceOffsets(0)=(X=0.000000,Y=0.000000,Z=0.000000)
     TraceOffsets(1)=(X=100.000000)
     TraceOffsets(2)=(X=-100.000000)
     TraceOffsets(3)=(Y=100.000000)
     TraceOffsets(4)=(Y=-100.000000)
     bSeekFlyingEscorts=True
     bSeekEscorts=True
     DriverWeapons(0)=(WeaponClass=Class'darkhover.Mortician_Head',WeaponBone="middle_front_weapon")
     PassengerWeapons(0)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="right_front_weapon")
     PassengerWeapons(1)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="left_front_weapon")
     PassengerWeapons(2)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="right_middle_weapon")
     PassengerWeapons(3)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="left_middle_weapon")
     PassengerWeapons(4)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="left_rear_weapon")
     PassengerWeapons(5)=(WeaponPawnClass=Class'OnslaughtFull.ONSMASSideGunPawn',WeaponBone="right_rear_weapon")
     VehicleMass=12.000000
     TPCamDistance=1400.000000
     bPathColliding=True
}
