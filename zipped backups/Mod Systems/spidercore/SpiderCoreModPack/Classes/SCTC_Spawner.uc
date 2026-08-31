//================================================================================
// SCTC_Spawner.
//================================================================================

class SCTC_Spawner extends SC_TimedControlerSpawner;

var() float FXDuration;
var() float SlideOutStart;
var() float SlideSteps;
var() float SlideInFinish;
var() Class<Emitter> BlastofSCFX;
var() Class<Emitter> TrailFX;
var() Class<Emitter> MyAmbiantFX;
var() Sound RejectSound;
var() Class<SC_TimedControler> TheTimedControler;
var() int CurveDivision;
var float NewValue;
var float ValueStep;
var int StepCounter;
var int TagCounter;
var ONSVehicle VehicleArray[32];
var ONSVehicle VehicleVersion;
var Emitter SpawnedAmbiantFX;

function bool CheckList (ONSVehicle Target)
{
  local int i;

  i = 1;
  if ( i < 32 )
  {
    if ( VehicleArray[i] == VehicleVersion )
    {
      PlaySound(RejectSound);
      return False;
    }
    i++;
    goto JL0007;
  }
  TagCounter++;
  VehicleArray[TagCounter] = Target;
  return True;
}

function Powerswitch ()
{
  if ( SpawnedAmbiantFX != None )
  {
    SpawnedAmbiantFX.Destroy();
  } else {
    SpawnedAmbiantFX = Spawn(MyAmbiantFX,self,,self.Location,self.Rotation);
  }
}

state() TimerLoop
{
  function Bump (Actor Other)
  {
    if ( Other.IsA('ONSVehicle') )
    {
      VehicleVersion = ONSVehicle(Other);
      if ( CheckList(VehicleVersion) )
      {
        SpawnTimedControler(VehicleVersion);
      }
    }
  }
  
  function Touch (Actor Other)
  {
    if ( Other.IsA('ONSVehicle') )
    {
      VehicleVersion = ONSVehicle(Other);
      if ( CheckList(VehicleVersion) )
      {
        SpawnTimedControler(VehicleVersion);
      }
    }
  }
  
  function SpawnTimedControler (ONSVehicle VehicleTarget)
  {
    local SC_TimedControler SpawnedControler;
  
    SpawnedControler = Spawn(TheTimedControler,self,,VehicleTarget.Location,VehicleTarget.Rotation);
    SpawnedControler.SetBase(VehicleTarget);
    SpawnedControler.DataPacket(VehicleTarget,NewValue,FXDuration,SlideInFinish,SlideOutStart,int(SlideSteps),CurveDivision);
    if ( TagCounter == 31 )
    {
      Cleanout();
    }
  }
  
  function Cleanout ()
  {
    local int i;
    local int ArrayLength;
    local ONSVehicle TagTemp;
  
    i = 0;
    if ( i < 32 )
    {
      if ( VehicleArray[i + 1] == None )
      {
        ArrayLength = i + 1;
        TagTemp = VehicleArray[i];
        VehicleArray[i] = None;
        VehicleArray[0] = TagTemp;
        TagCounter = 0;
        goto JL0084;
      } else {
        VehicleArray[i] = None;
      }
      i++;
      goto JL0007;
    }
  }
  
  Sleep(FXDuration);
  Powerswitch();
  Cleanout();
  Powerswitch();
  goto ('Begin');
}

defaultproperties
{
    FXDuration=10.00

    SlideOutStart=8.00

    SlideSteps=10.00

    SlideInFinish=2.00

    TrailFX=Class'SCFX.SCFX_Trails_MultiColor'

    TheTimedControler=Class'SCTC_UltraLight'

    CurveDivision=4

    bHidden=False

    InitialState=TimerLoop

    CollisionRadius=200.00

    CollisionHeight=200.00

}
