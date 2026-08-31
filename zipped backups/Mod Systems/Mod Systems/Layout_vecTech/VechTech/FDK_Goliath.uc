//-----------------------------------------------------------
//
//-----------------------------------------------------------
class FDK_Goliath extends ONSHoverTank;


var float                              FD_BoostDelayTime,FD_VehicleKickMass,FD_ScanRange,FD_ReControlTime;
var Int                                FD_Boosts;
var bool                               FD_bUseVocalCount,FD_bBoosterEnabled,FD_BoostFXEnabled,FD_HardAttachFX,
                                       FD_bSearchlinkedrecoiler;
var name                               FD_FirstEntryEvent;
var Vector                             FD_AppliedBoostForce;
var array < class <FD_FX> >            FD_TheFx;
var array < Sound>                     FD_TheSound;
var float                              FD_Groundspeed;
Var FD_Recoiler                        FD_LinkedRecoiler;
var sound                              FDVoc_Three,FDVoc_Two,FDVoc_One,FDVoc_Boost;
var name                               LinkEstablishedEvent;

Function PreBeginPlay()
{                                                                               //========= Pre Begin Play() ======
if (FD_bSearchlinkedrecoiler==true) scanner();
Super.PreBeginPlay();
}

function postbeginplay()
{                                                                               //========= postbeginplay() ======
local int tempPseudoBool;tempPseudoBool=1;

if ((FD_bSearchlinkedrecoiler==True)&&(FD_LinkedRecoiler!=none))
   {
   Log("====hello from "$self$"im gonna make contact with "$FD_LinkedRecoiler);
   FD_LinkedRecoiler.RequestLinkage( tempPseudoBool ,self);
   if (tempPseudoBool!=1)
      {
      log("**"$self$" has established a link with"$FD_LinkedRecoiler$"**");
      triggerEvent( FD_FirstEntryEvent , self , instigator );
      }
else
     if (tempPseudoBool==1) warn("!!!!!!"$self$"has faild to establish a link with "$FD_LinkedRecoiler$"!!!!!!!!");
   }
super.postbeginplay();
}

function scanner()
{
 local FD_Recoiler Foundactor;
log("ive got to go lokk for the recoiler now."$self$"FD_ScanRange is "$FD_ScanRange);

foreach VisibleCollidingActors (class'FD_Recoiler',Foundactor,FD_ScanRange)
		{
        FD_LinkedRecoiler=Foundactor;
        Log("====hello from "$self$" I just found this "$Foundactor);
		}
}


Function Booster( int Boosts,vector BoostForce, Float BoostDelay, Bool CauseFX, bool HardAttachFX,optional bool bUseVocalCount,optional actor ID)
{
 log ("Hello there, im"$self$" and i have just recieved a call to boost from"$ID);
 FD_Boosts=Boosts;
 FD_bUseVocalCount=bUseVocalCount;
 FD_AppliedBoostForce=BoostForce;
 FD_BoostDelayTime=BoostDelay;
 FD_HardAttachFX=HardAttachFX;
 FD_BoostFXEnabled=CauseFX;
 log ("Hello there, im"$self$" im setting the following values"$FD_Boosts$" and "$FD_BoostDelayTime$" and "$FD_HardAttachFX$" and "$FD_BoostFXEnabled);
 gotostate('Boosting');
}
function Fswap(out float a,out float b)                                             // ======= Integer Swap() =======
{
local float temp;
temp=a;
a=b;
b=temp;
}


Function FD_DoBooster()                                                         // ====== FD_DoBooster() =======
{
local vector FD_PointOfBoostForce;
if (FD_bBoosterEnabled==true)
   {
   KAddImpulse( FD_AppliedBoostForce >> self.Rotation, FD_PointOfBoostForce >> self.Rotation );
   FD_Boosts--;
   }
}

Function FD_DoFX()                                                           // ====== FD_DoRNDFX() =====
{
local FD_FX Effect;local int RandomNumber;
RandomNumber=rand(FD_TheFx.length);                                           // Picks Random Number
log("hello from"$Self$" the fx is..."$FD_TheFx[RandomNumber]);
NetUpdateTime = Level.TimeSeconds - 1;                                       // NetUpdateTime
Effect = spawn(FD_TheFx[RandomNumber],self,,Location , Rotation) ;                   // Spawn FX
if (FD_HardAttachFX!=False) Effect.SetBase( self );                             // HardattachFX
}

Function FD_DoSound()                                                           //=========== FD_DoRNDSound() ======
{
local Int TempRandomNumber;TempRandomNumber=Rand(FD_TheSound.length);
Playsound ( FD_TheSound[TempRandomNumber] );
}

//============================================================================== STATES

Auto State WaitingForFirstEntry                        //========================// AutoState WaitingForFirstEntry===
{
function bool PlaceExitingDriver() {return false;}                              // stops driver from leaving

function KDriverEnter(Pawn p)                                                   // ===== KDriverEnter(Pawn p) =====
 {                                                                              // jumps to first entry when driver enters
 super.KDriverEnter( P );
 gotostate ('firstEntry');
 }
begin:
log("=="$self$"=im in state WaitingForFirstEntry===============");
}

State firstEntry                                          //=====================//======State FirstEntry=====
{
ignores trigger;                                                                // disables trigger
ignores takedamage;                                                             // disables take damage

function bool PlaceExitingDriver() {return false;}                              // stop driver leaving

begin:                                                                          // (drop stats for kick)
log("=="$self$"=im in state firstEntry===============");
bDriverCannotLeaveVehicle=True;                                                 // so diver cant leave
if ((FD_VehicleKickMass!=0.0) && (VehicleMass!=0.0)) Fswap(VehicleMass,FD_VehicleKickMass);                                             // alters vehicle mass

if (FD_FirstEntryEvent!='') triggerEvent( FD_FirstEntryEvent , self , instigator ); // FD_FirstEntryEvent

GotoState('Boosting');                                                      // goto state justcruising
}

state Boosting                                       //==========================// =========State Boosting=======
{
ignores trigger;
ignores takedamage;

function bool PlaceExitingDriver() {return false;}                              // So driver cant leave

Begin:
log("=="$self$"=im in state BOOSTING===============");                                                                          // Begin StateCode
bDriverCannotLeaveVehicle=True;                                                 // So driver cant leave
MaxAirSpeed=5000;
MaxGroundSpeed=5000;
VehicleMass=6.000000;

if (FD_bUseVocalCount!=False)
{
PlayOwnedSound ( FDVOC_Three ,, 150 ,,,,); sleep (1) ;                          // Vocal 3
PlayOwnedSound ( FDVOC_Two ,, 150 ,,,,);   sleep (1) ;                          // Vocal 2
PlayOwnedSound ( FDVOC_One ,, 150 ,,,,);   sleep (1) ;                          // Vocal 1
}
if (FD_LinkedRecoiler!=none)
{
log(" ok gonna try to trigger the linked recoiler now people...."$FD_LinkedRecoiler.tag);
TriggerEvent(FD_LinkedRecoiler.tag, Self,instigator );
}
else
warn("**********there was no recoiler found That i can Trigger");
PlayOwnedSound ( FDVoc_Boost ,, 150 ,,,,);
                                                                               // Vocal Boost
Boostloop:                                                                      //Start Boostloop
if ((FD_BoostFXEnabled==True)&&(FD_TheFx[0]!=none))  FD_DoFX();
if (FD_TheSound[0]!=none)     FD_DoSound();
if (FD_bBoosterEnabled==True)
   {
    if (FD_AppliedBoostForce!=Vect(0,0,0)) FD_DoBooster();
    else
    warn("****"$self$" didnt kick as its FD_AppliedBoostForce ="$FD_AppliedBoostForce$" Check the Vehicle Factory dummy");
    }
sleep(FD_BoostDelayTime);                                                              // delay between FD_Boosts

if (FD_Boosts>0) goto'boostloop';                                                // end of boostloop

sleep(FD_ReControlTime);                                                           // recontroltime delay
MaxAirSpeed=1000;
MaxGroundSpeed=5000;
MaxPitchSpeed=1500.000000;
if ((FD_VehicleKickMass!=0.0) && (VehicleMass!=0.0)) Fswap(VehicleMass,FD_VehicleKickMass);                                             // swaps mass back to origional

GotoState('justCruising');
                                                                                   // gotostate just cruising
}

State JustCruising                                    //======================== =======State Just Cruising====
{

function KDriverEnter(Pawn p){super.KDriverEnter( P );}                          // So driver can leave



begin:                                                                          // begin state code
log("="$self$"====im in state JustCruising===============");
bDriverCannotLeaveVehicle=False;                                                 // So driver can leave

}


//PassengerWeapons(0)=(WeaponClass=Class'onslaughtfull.ONSMASRocketPack')

defaultproperties
{
     FD_ScanRange=1024.000000
     FD_bSearchlinkedrecoiler=True
     FDVoc_Three=Sound'AnnouncerFemale2K4.Generic.three'
     FDVoc_Two=Sound'AnnouncerFemale2K4.Generic.two'
     FDVoc_One=Sound'AnnouncerFemale2K4.Generic.one'
     FDVoc_Boost=Sound'AnnouncerFemale2K4.Generic.Booster'
     bCanFlip=True
     DriverWeapons(0)=(WeaponClass=Class'VecTech.PiggyBackGunner')
     PassengerWeapons(0)=(WeaponPawnClass=Class'vectech.ArmChairShooter')
}
