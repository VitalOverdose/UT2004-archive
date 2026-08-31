class SFXGen_FXAttacher            extends vehicletoolbox
placeable;

var() sfx                           SpawnedAmbiantFX;
Var() class<SFX>                    StaticFX,TrailFX;
Var() Bool                          TrigBy_Pawn,TrigBy_ONSVehicle,TrigByMonster;
var onsvehicle                      VehicleArray[32];
var Int                             TagCounter;
var () Float                        FXDuration;
var () sound                        RejectSound,SpawnSound;

function Powerswitch()
{
if(SpawnedAmbiantFX!=None) SpawnedAmbiantFX.destroy();
else
if (AmbiantFX!=None) SpawnedAmbiantFX=spawn(AmbiantFX,self,,self.location,self.rotation);
}

Function bool CheckList(onsvehicle Target)
{
local int I;
for (i=1;I<33;I++)
    {
    if(VehicleArray[i]==Target)
       {
       PlaySound(RejectSound);
       Return False;
       }
    }
TagCounter++;
VehicleArray[tagCounter]=Target;
Return True;
}

state TimerLoop
{

function touch(actor Other)
{
local Onsvehicle VehicleVersion;//local Pawn PawnInstigator;
if (other.IsA('onsvheicle'))
   {
   VehicleVersion=onsvehicle(other);
   if (CheckList(VehicleVersion))
      {
      spawnFX(VehicleVersion);
      VecBoost(VehicleVersion);
      }
   }
}

Function spawnFX(ONSVehicle VehicleTarget)
{
local sfx SpawnedSFX;
if (StaticFX!=None) SpawnedSFX = spawn( StaticFX,self,,Location,Rotation) ;
if (TrailFX!=None) SpawnedSFX = spawn( TrailFX,self,,VehicleTarget.Location ,VehicleTarget.Rotation );
SpawnedSFX.SetBase( VehicleTarget );
if(SpawnSound!=None) Playsound(SpawnSound);
if (tagCounter==31) cleanout();
}

function cleanout()
{
local Int I;local ONSVehicle ForTheSwap;
For (I=0;I<32;I++)
    {
    if ((VehicleArray[I+1]==none) || (i==31))
       {
       ForTheSwap=VehicleArray[I];
       VehicleArray[I]=None;
       Vehiclearray[0]=ForTheSwap;
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
InitialState=TimerLoop
bHidden=False
Texture=Texture'HUDContent.Reticles.Reticle001'
CollisionRadius=200.000000
CollisionHeight=200.000000
}

