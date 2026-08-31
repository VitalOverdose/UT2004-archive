//-----------------------------------------------------------
// TransCore_Blue..........Links to RealCoreRed..
// By FatalOverdose 2005 (c)
// Part OF The PseudoCore Mod Package
// DigiMechTech
// http://www.FatalOverdose.copperstream.co.uk
//-----------------------------------------------------------
class TransCore_Blue extends ONSPRV;

var Emitter ExplosionEffect;
var RealCore_Blue         MylinkedCore;
struct DamageNshit
{
var()Class<Emitter>      TheFX;
Var()Sound               TheSound;
Var()name                TheEvent;
Var()Bool                ChangeCoreMesh;
Var()Bool                ViewShake;
};var() DamageNshit      SFX_EstablishLink,SFX_StartMoving,SFX_EndMoving,SFX_Destroyed;

Function PreBeginPlay()
{
local RealCore_Blue m;

   foreach VisibleCollidingActors (class'RealCore_Blue', M,10000)
		{
        MylinkedCore=m;
        MylinkedCore.linkRequest(,self);
        Break;
		}

Super.PreBeginPlay();
}

simulated function ONSPowerCore ClosestTo(Actor A)
{
    local float Distance, BestDistance;
    local ONSPowerCore C, Best;

	BestDistance = VSize(A.Location - Location);
	Best = MylinkedCore;

	for ( C = MylinkedCore.NextCore; C != MylinkedCore && C != None; C = C.NextCore )
	{
		Distance = VSize(A.Location - C.Location);
		if ( Distance < BestDistance )
		{
			BestDistance = Distance;
			Best = C;
		}
	}

	return Best;
}
Function LinkHasBeenEstablished()
{
log ("*************the link was established**************");
ProcessSFX(true,);
}
Function ItsAllOverDude()
{
Gotostate('DeadMF');
}

Function ProcessSFX(optional bool link,optional bool Destroy)
{
if (link==True)
   {
   if (SFX_EstablishLink.TheFX!=None) Spawn(SFX_EstablishLink.TheFX,self,,location,Rotation);
   if (SFX_EstablishLink.TheSound!=None) PlaySound(SFX_EstablishLink.TheSound);
   if (SFX_EstablishLink.TheEvent!='') triggerevent(SFX_EstablishLink.TheEvent,self,instigator);
}
if (Destroy==True)
   {
   if (SFX_Destroyed.TheFX!=None) Spawn(SFX_Destroyed.TheFX,self,,location,Rotation);
   if (SFX_Destroyed.TheSound!=None) PlaySound(SFX_Destroyed.TheSound);
   if (SFX_Destroyed.TheEvent!='') triggerevent(SFX_Destroyed.TheEvent,self,instigator);
   }
}


function takedamage(int Damage, Pawn Eventinstigator,Vector HitLocation,Vector Momentum,Class<DamageType>DamageType)
{
MylinkedCore.takedamage( Damage,  Eventinstigator, HitLocation, Momentum,DamageType);

}

State DeadMF
{
begin:
Log("##################Hi From"$Self$"... I Have FinishedMoving");
ProcessSFX(,true);
log("arrghhhhhhhhhhhhhhh! im dying");
}

defaultproperties
{
}
