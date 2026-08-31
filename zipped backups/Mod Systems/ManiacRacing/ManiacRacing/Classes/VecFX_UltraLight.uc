//     Class TC_UltraLight (TimedControler)
//
// By FatalOverdose (c) 2005 www.fataloverdose.copperstream.co.uk
//
// This actor gets spawned by the TimedControlerspawner..
// dont place directly in a map
//-----------------------------------------------------------

class TC_UltraLight extends TimedControler
Placeable;

var onsvehicle                    MyTarget;
var float                         MyLifetime,NewGravValue,MyCurveInTime,MyCurveDivision;
var float                         SingleTimeSlice,SleepTime,OrigGrav,GravStepAmount,SoundLength,Smoother,Origmas;
var int                           Counter,MySlideSteps;
var sound                         DestroySound;
var SFX                           Spawned1Effect,Spawned2Effect;
Var(ManiacRacing) class<SFX>                  rocketFX;

function DataPacket ( onsvehicle VehicleTarget,float NewValue,float FXDuration,float CurveInTime,float SlideOutStart,int SlideSteps,optional int NewCurveDivision)
{
local float GravDifference;
MyLifetime       = FXDuration;
MyTarget         = VehicleTarget;
MyCurveDivision  = NewCurveDivision;
NewGravValue     = NewValue;
MySlideSteps     = SlideSteps;
SingleTimeSlice  = MyLifetime     - MyCurveInTime;
SingleTimeSlice /= SlideSteps;
OrigGrav         = MyTarget.KgetActorGravscale();
GravDifference   = OrigGrav        -  NewGravValue;
GravStepAmount   = GravDifference  / MySlideSteps;

MyTarget.KSetActorGravScale(NewGravValue);                  // set new grav

if ((MySlideSteps>0) && ( MyCurveInTime < 1 ))
   {
   SingleTimeSlice = MyLifetime;log ("((MySlideSteps>0) && ( MyCurveInTime < 1 ))SingleTimeSlice   = FXDuration   ="$SingleTimeSlice);
   gotostate( 'Timing' , 'Noslide' );
   }
gotostate ( 'Timing' );
}

Function DoUbleFX()
{
NetUpdateTime = Level.TimeSeconds - 1;                                       // NetUpdateTime
Spawned1Effect = spawn(rocketFX,self,,location , Rotation) ;                   // Spawn FX
Spawned1Effect.SetBase( self );
Spawned2Effect = spawn(rocketFX,self,,location  , Rotation) ;
Spawned2Effect.SetBase( self );
}

State Timing
{
Begin:
DoUbleFX();
SleepTime=0;

for ( Counter = 1 ; Counter < MySlideSteps + 1 ; Counter++ )
    {
     if (MyTarget.bVehicleOnGround==False)
        {
        Smoother     += Counter         / MyCurveDivision;
        SleepTime     = SingleTimeSlice + Smoother;
        Sleep(SleepTime);
        NewGravValue += GravStepAmount;
        MyTarget.KSetActorGravScale(NewGravValue);
        }
    else
       if (DestroySound != None )
       {
        SoundLength=GetSoundDuration( DestroySound );
        Playsound (DestroySound);
        Sleep(SoundLength);
        Destroy();
        }
}
Noslide:
Sleep(SingleTimeSlice);
MyTarget.KSetActorGravScale(OrigGrav);
if (MyTarget.IsA('ONSRV')) MyTarget.KsetMass(3.5);
gotostate( 'Suicide' );
}

state Suicide
{
begin:
if ( Spawned1Effect != None )
   {
   Spawned1Effect.Destroy();
   Spawned2Effect.Destroy();
   }
NewGravValue = MyTarget.KGetActorGravScale();
Destroy();
}

defaultproperties
{
rocketFX=Class'ManiacRacing.SFX_RocketFireTrail'
bUseBoost=True
bFX_Attach=True
StaticMesh=StaticMesh'ManiacRacing_StatMesh.Misc.wingNbooster'
bHidden=False
AmbientSound=Sound'ONSVehicleSounds-S.Flying.Flying01'
bFullVolume=True
SoundVolume=0
SoundRadius=256.000000
}
