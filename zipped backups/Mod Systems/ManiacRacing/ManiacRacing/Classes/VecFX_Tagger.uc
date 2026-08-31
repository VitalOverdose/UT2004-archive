class VecFX_Tagger extends  PMT_Vehicletoolbox
Placeable;

struct                                          SpawnUltraLight
{
var()class<timedcontroler>                      TC_Class;
var()range                                      FXDuration;
var()float                                      SlideOutStart,SlideInFinish;
var()int                                        SlideSteps;
var()sound                                      RejectSound;
var()int                                        CurveDivision;
var()bool                                       bBoostVec;
};



var() SpawnUltraLight                           UltrLightSpawnDetails

var SFX                                         SpawnedAmbiantFX;
var float                                       NewValue,ValueStep;
var int                                         StepCount,TagCount;


function Bump(actor other)
{
local bool bReturnResult;
if ( other.isa('onsvehicle') )
   {
   TheVec = onsvehicle( other );log("imwas touched by"$other$"TheVec="$TheVec);
   if ( TheVec == none ) return;
   bReturnResult = CheckList( TheVec );
   if (!bReturnResult) return;
   spawncontroler( TheVec );
   if ( UltrLightSpawnDetails.bBoostVec ) VecBoost( TheVec );
   }
}

function touch( actor other )
{
local bool bReturnResult;
if ( other.isa('onsvehicle') )
   {
   TheVec = onsvehicle( other );log("imwas touched by"$other$"TheVec="$TheVec);
   if ( TheVec == none ) return;
   bReturnResult = CheckList( TheVec );
   if (!bReturnResult) return;
   spawncontroler( TheVec );
   if ( UltrLightSpawnDetails.bBoostVec ) VecBoost( TheVec );
   }
}

function spawncontroler(ONSVehicle VecTarget,class<TimedControler> TC_Class)
{
SpawnedControler = spawn( TC_Class,VecTarget, ,VecTarget.Location ,VecTarget.Rotation ) ;
SpawnedControler.Spawner=self;
UltrLightSpawnDetails.SpawnedControler.NewValue;
UltrLightSpawnDetails.SpawnedControler.FXDuration;
UltrLightSpawnDetails.SpawnedControler.SlideInFinish;
UltrLightSpawnDetails.SpawnedControler.SlideOutStart;
UltrLightSpawnDetails.SpawnedControler.SlideSteps;
UltrLightSpawnDetails.SpawnedControler.CurveDivision;
}

function RemoveMe(timedcontroler WhosAboutToDie)
{
local int TagNum;
TagNum = Int(string(WhosAboutToDie.tag)))
if ( TagNum < VecList )
   {
   VecList.remove( TagNum , 1 );
   return ;
   }
warn("The TC's("$WhosAboutToDie$") tag num"$Int(string(WhosAboutToDie.tag)))$" was higher than the last record in the vec list array"$VecList.length-1)
}



defaultproperties
{


bHidden=False
CollisionRadius=200.000000
CollisionHeight=200.000000
}
