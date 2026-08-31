//-----------------------------------------------------------
//
//-----------------------------------------------------------
class MagneticMesh extends Spider_Core_MeshUtils;

var() bool               bSticks2Vec;
var() bool               bSticks2Player;
var() bool               bsticks2Bot;
var() bool               bCanbShotOff;
var() bool               bTimedDropOff;
var() bool               bHideWhenDead;
var() int                MaxSticks;
var() float              FallOffAfter;
var() float              ShotDamageDropOffThresh;

var(Damage) bool               bDamagesVec;
var(Damage) bool               bDamagesPlayer;
var(Damage) bool               bDamagesBot;
var(Damage) float              DamagePerSec;
var(Damage) class<damagetype>  AttachedDamageType;

var(FX) class<emitter>     StickOnFX;
var(FX) class<emitter>     DropOffFX;
var(FX) class<emitter>     AttachedFX;
var(FX) class<emitter>     DeadFX;

var(SoundFX) sound              StickOnSound;
var(SoundFX) sound              DropOffSound;
var(SoundFX) sound              DeadSound;
var(SoundFX) sound              DamagePerSecSound;

var int                  Used;
var pawn                 Stuckto;

function DropOff ()
{
setbase(Self);
if  (DropOffFX != none) SpawnFX(DropOffFX,self,,self,DropOffSound);
if ( MaxSticks > 0 ) Used += 1;
if ( MaxSticks == used) gotostate('Dead');
gotostate('WaitingForAction');
}

function takedamage(int Damage,Pawn EventInstigator,Vector Hitlocation,Vector Momentum,class<DamageType> DamageType)
{
if ( stuckto == none) return;
if ( Damage > ShotDamageDropOffThresh)  DropOff ();
}

state PainFullAttach
{
begin:
startloop:
stuckto.takedamage(DamagePerSec,instigator,location,vect(0,0,0),AttachedDamageType);
sleep(1);
if (bTimedDropOff == true )
   {
   fallOffAfter = fallOffAfter -1;
   if (fallOffAfter == 0) DropOff();
   }
}

state NONPainFullAttach
{
begin:
startloop:

sleep(1);

if (bTimedDropOff == true )
   {
   fallOffAfter = fallOffAfter -1;
   if (fallOffAfter == 0) DropOff();
   }
}

state WaitingForAction
{
function touch(actor other)
{
if  (MaxSticks == 0 )   return;
if  ( stuckto != none ) return;
if  ( ( bSticks2Vec == true) && ( other.IsA('onsvehicle') ) || ( bSticks2Player == true) && ( other.IsA('playerpawn') )|| ( bSticks2bot == true) && ( other.IsA('xbot') ))
   {
   if ( StickOnFX != none )
       {
        SpawnFX(StickOnFX,self,,self,StickOnSound);
       }
   setbase(other);
   stuckto = pawn(other);
   GotoState('PainFullAttach');
   }
super.Touch(other);
}
}

state Dead
{
begin:
if (DeadFX != none)  SpawnFX(DropOffFX,self,,self,DeadSound);
if ( bHideWhenDead == true )
   {
    bhidden=true;
    SetCollision(false, false, false);
   }

}

defaultproperties
{
     bStatic=False
     InitialState="WaitingForAction"
}
