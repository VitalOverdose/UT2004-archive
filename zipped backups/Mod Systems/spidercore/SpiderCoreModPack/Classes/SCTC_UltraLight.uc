//================================================================================
// SCTC_UltraLight.
//================================================================================

class SCTC_UltraLight extends SC_TimedControler;

var ONSVehicle MyTarget;
var float MYLIfetime;
var float NewGravValue;
var float MyCurveInTime;
var float MyCurveDivision;
var float SingleTimeSlice;
var float SleepTime;
var float OrigGrav;
var float GravStepAmount;
var float SoundLength;
var float SmoOther;
var float Origmas;
var int Counter;
var int MySlideSteps;
var Sound DestroySound;
var Emitter Spawned1Effect;
var Emitter Spawned2Effect;
var() Class<Emitter> rocketFX;

function DataPacket (ONSVehicle VehicleTarget, float NewValue, float FXDuration, float CurveInTime, float SlideOutStart, int SlideSteps, optional int NewCurveDivision)
{
  local float GravDIfference;

  MYLIfetime = FXDuration;
  MyTarget = VehicleTarget;
  MyCurveDivision = NewCurveDivision;
  NewGravValue = NewValue;
  MySlideSteps = SlideSteps;
  SingleTimeSlice = MYLIfetime - MyCurveInTime;
  SingleTimeSlice /= SlideSteps;
  OrigGrav = MyTarget.KGetActorGravScale();
  GravDIfference = OrigGrav - NewGravValue;
  GravStepAmount = GravDIfference / MySlideSteps;
  MyTarget.KSetActorGravScale(NewGravValue);
  if ( (MySlideSteps > 0) && (MyCurveInTime < 1) )
  {
    SingleTimeSlice = MYLIfetime;
    Log("((MySlideSteps>0) && ( MyCurveInTime < 1 ))SingleTimeSlice   = FXDuration   =" $ string(SingleTimeSlice));
    GotoState('Timing','Noslide');
  }
  GotoState('Timing');
}

function DoUbleFX ()
{
  NetUpdateTime = Level.TimeSeconds - 1;
  Spawned1Effect = Spawn(rocketFX,self,,Location,Rotation);
  Spawned1Effect.SetBase(self);
  Spawned2Effect = Spawn(rocketFX,self,,Location,Rotation);
  Spawned2Effect.SetBase(self);
}

state Timing
{
  DoUbleFX();
  SleepTime = 0.0;
  Counter = 1;
  if ( Counter < MySlideSteps + 1 )
  {
    if ( MyTarget.bVehicleOnGround == False )
    {
      SmoOther += Counter / MyCurveDivision;
      SleepTime = SingleTimeSlice + SmoOther;
      Sleep(SleepTime);
      NewGravValue += GravStepAmount;
      MyTarget.KSetActorGravScale(NewGravValue);
    } else {
      if ( DestroySound != None )
      {
        SoundLength = GetSoundDuration(DestroySound);
        PlaySound(DestroySound);
        Sleep(SoundLength);
        Destroy();
      }
    }
    Counter++;
    goto JL0018;
  }
  Sleep(SingleTimeSlice);
  MyTarget.KSetActorGravScale(OrigGrav);
  if ( MyTarget.IsA('ONSRV') )
  {
    MyTarget.KSetMass(3.5);
  }
  GotoState('Suicide');
}

state Suicide
{
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
    rocketFX=Class'SCFX.SCFX_Trails_MultiColor'

    bHidden=False

    AmbientSound=Sound'ONSVehicleSounds-S.Flying.Flying01'

    bFullVolume=True

    SoundVolume=0

    SoundRadius=256.00

}
