class TC_Spawner extends  ControlerSpawner
Placeable;


var() float                    FXDuration,SlideOutStart,SlideSteps,SlideInFinish;
var float                      NewValue,ValueStep;
var int                        StepCounter,TagCounter;
Var() class<SFX>               BlastoffFX,TrailFX;
var onsvehicle                 VehicleArray[32];
var() Sound                    RejectSound;
var ()class<timedcontroler>    TheTimedControler;
var onsvehicle                 VehicleVersion;
var SFX                        SpawnedAmbiantFX;
var ()int                      CurveDivision;




Function bool CheckList(onsvehicle Target)
{
local int I;

   for (i=1;I<32;I++)
       {
       if(VehicleArray[i]==VehicleVersion)
          {
          PlaySound(RejectSound);
          Return False;
          }
       }
   TagCounter++;
   VehicleArray[tagCounter]=Target;
   Return True;
   }


function Powerswitch()
{
if(SpawnedAmbiantFX!=None)
   {
   SpawnedAmbiantFX.destroy();
   }
else
SpawnedAmbiantFX=spawn(AmbiantFX,self,,self.location,self.rotation);
}

state() TimerLoop
{

function Bump(actor other)
{
   log("imwas touched!!!!!!!!!!!!!!!!!!!!!!");
if (other.isa('onsvehicle'))
   {

   VehicleVersion=onsvehicle(other);
   if (CheckList(VehicleVersion))
      {
      spawncontroler(VehicleVersion);
      VecBoost(VehicleVersion);
      }
   }
}

function touch(actor other)
{
   log("imwas touched!!!!!!!!!!!!!!!!!!!!!!");
if (other.isa('onsvehicle'))
   {

   VehicleVersion=onsvehicle(other);
   if (CheckList(VehicleVersion))
      {
      spawncontroler(VehicleVersion);
      VecBoost(VehicleVersion);
      }
   }
}

Function spawncontroler(ONSVehicle VehicleTarget)
{
local TimedControler SpawnedControler;
SpawnedControler = spawn( TheTimedControler,self,,VehicleTarget.Location ,VehicleTarget.Rotation ) ;
SpawnedControler.SetBase( VehicleTarget );
SpawnedControler.DataPacket( VehicleTarget,NewValue,FXDuration,SlideInFinish,SlideOutStart,SlideSteps,CurveDivision);
if (tagCounter==31) cleanout();
}

function cleanout()
{
local Int I;local Int ArrayLength;local ONSVehicle TagTemp;
For (I=0;I<32;I++)
    {
    if (VehicleArray[I+1]==none)
       {
       ArrayLength=I+1;
       TagTemp=VehicleArray[I];
       VehicleArray[I]=None;
       Vehiclearray[0]=TagTemp;
       tagCounter=0;
       Break;
       }
else
       VehicleArray[I]=None;
     }
}
begin:
sleep(FXDuration);
Powerswitch();
cleanout();
Powerswitch();
goto('begin');
}

defaultproperties
{

     TrailFX=Class'ManiacRacing.SFX_RocketFireTrail'
     TheTimedControler=Class'ManiacRacing.TC_UltraLight'

     bUseBoost=True

     bHidden=False
     InitialState="TimerLoop"

     CollisionRadius=200.000000
     CollisionHeight=200.000000
}
