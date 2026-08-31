//================================================================================
// SCTC_MonsterWheels.
//================================================================================

class SCTC_MonsterWheels extends SC_TimedControler;

var ONSVehicle MyTarget;
var float MYLIfetime;
var float MyTimesMultiplyer;
var float MyInflateTime;
var float MyStartDeflate;
var float secondsleep;
var float TimeStep;
var float OrigDrawscale;
var float DrawScaleStep;
var float NewDrawScale;
var float OrigCollisionRadius;
var float RadiusStep;
var float NewCollisionRadius;
var float OrigcollisionHeight;
var float HeightStep;
var float NewCollisionHeight;
var float Temp;
var int i;
var int MyTimeslices;
var() Sound ChangeSound;

function DataPacket (ONSVehicle VehicleTarget, float NewValue, float FXDuration, float CurveInTime, float SlideOutStart, int SlideSteps, optional int CurveDivision)
{
  MyTarget = VehicleTarget;
  MYLIfetime = FXDuration;
  MyTimesMultiplyer = NewValue;
  MyInflateTime = CurveInTime;
  MyTimeslices = SlideSteps;
  MyStartDeflate = SlideOutStart;
  if ( MyTimesMultiplyer < 0 )
  {
    Warn("you Set the new wheel size to low");
    Destroy();
  }
  GotoState('Inflate');
}

state Inflate
{
  function Calc ()
  {
    local float RadiusDIfference;
    local float HeightDIfference;
    local float DrawScaleDIfference;
  
    DrawScaleDIfference = MyTarget.DrawScale * MyTimesMultiplyer;
    DrawScaleDIfference -= MyTarget.Default.DrawScale;
    RadiusDIfference = MyTarget.Default.CollisionRadius * MyTimesMultiplyer;
    RadiusDIfference -= MyTarget.Default.CollisionRadius;
    HeightDIfference = MyTarget.Default.CollisionHeight * MyTimesMultiplyer;
    HeightDIfference -= MyTarget.Default.CollisionHeight;
    TimeStep = MyInflateTime / MyTimeslices;
    DrawScaleStep = DrawScaleDIfference / MyTimeslices;
    RadiusStep = RadiusDIfference / MyTimeslices;
    HeightStep = HeightDIfference / MyTimeslices;
    secondsleep = MyStartDeflate - MyInflateTime;
  }
  
  Calc();
  i = 0;
  if ( i < MyTimeslices )
  {
    NewDrawScale += DrawScaleStep;
    NewCollisionRadius += RadiusStep;
    NewCollisionHeight += HeightStep;
    MyTarget.SetDrawScale(NewDrawScale);
    MyTarget.SetCollisionSize(NewCollisionRadius,NewCollisionHeight);
    MyTarget.SetLocation(MyTarget.Location + vect(0.00,0.00,1.00) * HeightStep);
    Sleep(TimeStep);
    i++;
    goto JL000D;
  }
  GotoState('monsterTrucking');
}

state monsterTrucking
{
  Sleep(secondsleep);
  GotoState('Deflating');
}

state Deflating
{
  i = 0;
  if ( i < MyTimeslices )
  {
    NewDrawScale -= DrawScaleStep;
    NewCollisionRadius -= RadiusStep;
    NewCollisionHeight -= HeightStep;
    MyTarget.SetDrawScale(NewDrawScale);
    MyTarget.SetCollisionSize(NewCollisionRadius,NewCollisionHeight);
    Sleep(TimeStep);
    ++i;
    goto JL0007;
  }
}

defaultproperties
{
    ChangeSound=Sound'ONSVehicleSounds-S.Hydraulics.Hydraulic05'

    bHidden=False

    Texture=Texture'ULogo.Menu.FadeLogo'

    CollisionRadius=200.00

    CollisionHeight=200.00

}
