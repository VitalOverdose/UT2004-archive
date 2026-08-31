//-----------------------------------------------------------
// TransCore_Red..........Links to RealCoreRed..
// By FatalOverdose 2005 (c)
// Part OF The PseudoCore Mod Package
// DigiMechTech
// http://www.FatalOverdose.copperstream.co.uk
//-----------------------------------------------------------
class TransCore_Red extends ONSPRV;

var() vector        FD_AppliedBoostForce;

var sound                                   FDVoc_Three,FDVoc_Two,FDVoc_One,FDVOC_Boost;
var Emitter ExplosionEffect;
var RealCore_Red         MylinkedCore;
var bool                 FD_bUseVocalCount,FD_BoosterSound_OnFirstEntry,FD_BoosterTheFx_OnFirstEntry,FD_bBoosterEnabled;
var float                FD_ReControlTime;

struct DamageNshit
{
var()Class<Emitter>      TheFX;
Var()Sound               TheSound;
Var()name                TheEvent;
Var()Bool                ChangeCoreMesh;
Var()Bool                ViewShake;
};var() DamageNshit      SFX_EstablishLink,SFX_StartMoving,SFX_EndMoving,SFX_Destroyed;

Function PreBeginPlay()
{
local RealCore_Red m;

   foreach VisibleCollidingActors (class'RealCore_Red', M,10000)
		{
        MylinkedCore=m;
        MylinkedCore.linkRequest(,self);
        Break;
		}

Super.PreBeginPlay();
}



Function LinkHasBeenEstablished()
{
log ("*************the link was established**************");
ProcessSFX(true,);
}
Function ItsAllOverDude()
{
Gotostate('DeadMF');
}

Function ProcessSFX(optional bool link,optional bool Destroy)
{
if (link==True)
   {
   if (SFX_EstablishLink.TheFX!=None) Spawn(SFX_EstablishLink.TheFX,self,,location,Rotation);
   if (SFX_EstablishLink.TheSound!=None) PlaySound(SFX_EstablishLink.TheSound);
   if (SFX_EstablishLink.TheEvent!='') triggerevent(SFX_EstablishLink.TheEvent,self,instigator);
}
if (Destroy==True)
   {
   if (SFX_Destroyed.TheFX!=None) Spawn(SFX_Destroyed.TheFX,self,,location,Rotation);
   if (SFX_Destroyed.TheSound!=None) PlaySound(SFX_Destroyed.TheSound);
   if (SFX_Destroyed.TheEvent!='') triggerevent(SFX_Destroyed.TheEvent,self,instigator);
   }
}
Function FD_DoBooster()
{
local vector FD_PointOfBoostForce;
if (FD_bBoosterEnabled==true)
   {
   PlayOwnedSound(FDVoc_Boost,,150,,,,);
   KAddImpulse( FD_AppliedBoostForce >> self.Rotation, FD_PointOfBoostForce >> self.Rotation );
   }
}

Function FD_DoFX(int Timeframe)
{
local emitter Effect;
if (timeframe==1)                  //SFX_EstablishLink
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   Effect = spawn(SFX_EstablishLink.TheFX,self,,Location , Rotation) ;
   Effect.SetBase( self );
   }
else
if (Timeframe==2)
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   Effect = spawn(SFX_StartMoving.TheFX,self,,Location , Rotation) ;
   Effect.SetBase( self );
   }
else
if (Timeframe==3)
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   Effect = spawn(SFX_EndMoving.TheFX,self,,Location , Rotation) ;
   Effect.SetBase( self );
   }
else
if (Timeframe==4)
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   Effect = spawn(SFX_Destroyed.TheFX,self,,Location , Rotation) ;
   Effect.SetBase( self );
   }
}

Function FD_DoSound()
{
playsound(FDVOC_Boost);
}



function FD_Booster( optional bool FDbCauseBoosterFX , optional bool FDbUseVocalCount , optional int FDBoostrepeats,optional float FDReBoostTime , optional int FDVocTimerStartNumber , optional vector FDBoostForce )
{
if ( FDBoostForce      != vect(0,0,0) ) FD_AppliedBoostForce =   FDBoostForce;


if ( FDbUseVocalCount  == true    ) gotostate( 'Boosting' , 'VocBoost' );
else
if ( FDbCauseBoosterFX == true    ) gotostate( 'Boosting' , 'TheFX' );

else
                                    gotostate( 'Boosting' , 'Booster' );
}

function takedamage(int Damage, Pawn Eventinstigator,Vector HitLocation,Vector Momentum,Class<DamageType>DamageType)
{
MylinkedCore.takedamage( Damage,  Eventinstigator, HitLocation, Momentum,DamageType);

}
auto state WaitingForFirstEntry
{
 ignores takedamage;

 function KDriverEnter(Pawn p)
 {
 super.KDriverEnter( P );
 gotostate ('FirstOwnerEnters');
 }
}

state FirstOwnerEnters
{
function bool PlaceExitingDriver() {return false;}

Begin:                                                               // Start StateCode

if(FD_bUseVocalCount)
  {
  PlayOwnedSound (FDVOC_Three ,, 150 ,,,,); sleep (1) ;                                                           // <<FDVOCThree
  PlayOwnedSound (FDVOC_Two ,, 150 ,,,,); sleep (1) ;                                                           // <<FDVOCT_w_o
  PlayOwnedSound (FDVOC_One ,, 150 ,,,,); sleep (1) ;
  PlayOwnedSound (FDVOC_Boost ,, 150 ,,,,); sleep (1) ;
  }


if ( FD_BoosterSound_OnFirstEntry != true ) FD_DoSound();
if ( FD_BoosterTheFx_OnFirstEntry != true ) FD_DoFX(1);

if ( FD_AppliedBoostForce != vect( 0 , 0 , 0 ) ) FD_DoBooster();

Sleep ( FD_ReControlTime );           // Delay (FD_ReControlTime & FD_BoostRepeatTime)

Gotostate('Cruising');                                              // Goto State Cruising
}

State() Cruising
{

function KDriverEnter(Pawn p)
{
super.KDriverEnter( P );
}
}
State DeadMF
{
begin:
Log("##################Hi From"$Self$"... I Have FinishedMoving");
ProcessSFX(,true);
log("arrghhhhhhhhhhhhhhh! im dying");
}

defaultproperties
{
     FD_AppliedBoostForce=(X=90000000.000000,Z=10000.000000)
     FDVoc_Three=Sound'AnnouncerFemale2K4.Generic.three'
     FDVoc_Two=Sound'AnnouncerFemale2K4.Generic.two'
     FDVoc_One=Sound'AnnouncerFemale2K4.Generic.one'
     FDVoc_Boost=Sound'AnnouncerFemale2K4.Generic.Booster'
     FD_bUseVocalCount=True
     FD_ReControlTime=3.000000
     VehicleMass=3.000000
     EntryRadius=400.000000
     MomentumMult=4.000000
     VehiclePositionString="in a TransCore"
     VehicleNameString="TransCoreCar"
     GroundSpeed=1500.000000
     HealthMax=3000.000000
     Health=1500
}
