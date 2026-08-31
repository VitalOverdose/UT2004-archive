//-----------------------------------------------------------
//
//-----------------------------------------------------------

class ColisionToggleActor extends mover;

var() int  MaxChanges;
var() bool InvisibleWhenNonsolid;
var() bool ReactsOnShot;
var() bool ReactsOnTrigger;

var   bool IsSolid;
var   int  CurrentChanges;



function collisiontoggle ()
{
CurrentChanges += 1;

if ( (MaxChanges > 0) && (CurrentChanges > MaxChanges ) ) return;

if ( IsSolid == true )
   {
   SetCollision(false, false, false);
   if (InvisibleWhenNonsolid == true) bHidden = True;
   IsSolid = false;
   }
else
   {
   SetCollision(True, True, True);
   if (InvisibleWhenNonsolid == true) bHidden = false;
   IsSolid = True;
   }

}

function takedamage(int Damage,Pawn EventInstigator, vector HitLocation, vector Momentum,Class<damageType> DamageType)
{
 if (ReactsOnShot == true)  collisiontoggle();
}

event trigger(actor other,pawn eventinstigator)
{
 if (ReactsOntrigger == true)  collisiontoggle();
}

defaultproperties
{
     IsSolid=True
}
