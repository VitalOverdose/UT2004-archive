//-----------------------------------------------------------
//
//-----------------------------------------------------------
class FXDamageCounter extends Triggers;

var() float             totalDamageThresh;
var() float             currentDamageTotal;
var() float             ReActivateTime;
var() name              TrigEvent;
var() class<emitter>    triggerFX;
var() sound             triggersound;

state() ReadyAndWaiting
{
function takedamage(int Damage,Pawn EventInstigator,Vector Hitlocation,Vector Momentum,class<DamageType> DamageType)
{
currentDamageTotal = currentDamageTotal + Damage;
if (currentDamageTotal == totalDamageThresh )
   {
   spawn (triggerFX,Self,,Location,Rotation);
   if (TrigEvent    != '')   Triggerevent(TrigEvent,self,eventinstigator);
   if (Triggersound != none) Playsound(Triggersound);
   gotostate('Imasleep');
   }
}

}

state Imasleep
{
begin:
sleep(ReActivateTime);
gotostate('ReadyAndWaiting');
}

defaultproperties
{
     ReActivateTime=10.000000
     InitialState="ReadyAndWaiting"
}
