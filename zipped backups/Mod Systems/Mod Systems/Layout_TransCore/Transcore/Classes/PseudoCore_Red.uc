//-----------------------------------------------------------
// PseudoCore_Red..........Links to RealCoreRed..
// By TimeSecondsds 2005 (c)
// Part OF The PseudoCore Mod Package
// DigiMechTech
// http://www.TimeSecondsds.copperstream.co.uk
//-----------------------------------------------------------
class PseudoCore_Red extends FatalsToolbox;


var int              DefenderTeamIndex;
var Emitter ExplosionEffect;
var array<Actor>    CloseActors;
var array<ONSTeleportPad> TeleportPads;
var RealCore_Red         MylinkedCore;
var() Float              RealCore_ScanRange;
struct DamageNshit
{
var()Class<Emitter>        TheFX;
Var()Sound               TheSound;
Var()name                TheEvent;
};var() DamageNshit      SFX_EstablishLink,SFX_StartMoving,SFX_EndMoving,SFX_Destroyed;


Function prebeginplay()
{
local RealCore_Red m;

   foreach VisibleCollidingActors (class'RealCore_Red', M,RealCore_ScanRange)
		{
        MylinkedCore=m;
        MylinkedCore.linkRequest(self);
        Break;
		}

Super.PreBeginPlay();
}

Function postbeginplay()
{
FindCloseActors();

UpdateAnythingClose();

Super.PostBeginPlay();
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

simulated function FindCloseActors()
{
	local Actor A;

	CloseActors.Length = 0;

	if (Role == ROLE_Authority)
	{
		foreach AllActors(class 'Actor', A)
			if ( (A.IsA('PlayerStart') || A.IsA('ONSVehicleFactory') || A.IsA('ONSStationaryWeaponPawn') || A.IsA('xTeamBanner') || A.IsA('ONSTeleportPad'))
			     && ClosestTo(A) == MylinkedCore )
			{
				if (A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(MylinkedCore);
					TeleportPads[TeleportPads.length] = ONSTeleportPad(A);
				}
				else
					CloseActors[CloseActors.Length] = A;
			}
	}
	else
	{
		foreach AllActors(class'Actor', A)
			if ((A.IsA('xTeamBanner') || A.IsA('ONSTeleportPad')) && ClosestTo(A) == self)
			{
				if (A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(MylinkedCore);
					TeleportPads[TeleportPads.length] = ONSTeleportPad(A);
				}
				else
					CloseActors[CloseActors.Length] = A;
			}
	}
}

function Reset()
{
	super.Reset();

	NetUpdateTime = Level.TimeSeconds - 1;
	bHidden = false;
	SetCollision(true, true, true);
}

Function UpdateAnythingClose()
{
local Actor A;
local int i;
 // Update Nearby Powered Actors
        for (i = 0; i < CloseActors.Length; i++)
        {
            A = CloseActors[i];

            // Update any vehicle factories in the power radius to be owned by the controlling team
            if (A.IsA('ONSVehicleFactory'))
                ONSVehicleFactory(A).Activate(DefenderTeamIndex);

            // Update any playerstarts in the power radius to the be owned by the controlling team
            if (A.IsA('PlayerStart'))
            {
                PlayerStart(A).TeamNumber = DefenderTeamIndex;
                PlayerStart(A).bEnabled = True;
            }

            // Enable any turrets in the power radius
            If (A.IsA('ONSStationaryWeaponPawn'))
            {
                ONSStationaryWeaponPawn(A).bPowered = True;
                ONSStationaryWeaponPawn(A).SetTeamNum(DefenderTeamIndex);
                ONSStationaryWeaponPawn(A).PrevTeam = DefenderTeamIndex;
            }
        }

}

Function LinkHasBeenEstablished()
{
log ("*************the link was established**************");
ProcessSFX(true,,,);
}

Function ProcessSFX(optional bool link,optional bool MovStart,optional bool MovEnd,optional bool Destroy)
{
if (link==True)
   {
   if (SFX_EstablishLink.TheFX!=None) Spawn(SFX_EstablishLink.TheFX,self,,location,Rotation);
   if (SFX_EstablishLink.TheSound!=None) PlaySound(SFX_EstablishLink.TheSound);
   if (SFX_EstablishLink.TheEvent!='') triggerevent(SFX_EstablishLink.TheEvent,self,instigator);
}
else
if(MovStart==True)
   {
   if (SFX_StartMoving.TheFX!=None) Spawn(SFX_StartMoving.TheFX,self,,location,Rotation);
   if (SFX_StartMoving.TheSound!=None) PlaySound(SFX_StartMoving.TheSound);
   if (SFX_StartMoving.TheEvent!='') triggerevent(SFX_StartMoving.TheEvent,self,instigator);
   }
else
If(MovEnd==True)
   {
   if (SFX_EndMoving.TheFX!=None) Spawn(SFX_StartMoving.TheFX,self,,location,Rotation);
   if (SFX_EndMoving.TheSound!=None) PlaySound(SFX_StartMoving.TheSound);
   if (SFX_EndMoving.TheEvent!='') triggerevent(SFX_StartMoving.TheEvent,self,instigator);
   }
else
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

Function ItsAllOverDude()
{
Gotostate('DeadMF');
}

Function RequestChangeState (optional bool Chillin,optional bool moving,optional bool NotMoving)
{
if (chillin==True) gotostate('JustChillin');
if (moving==True) gotostate('ImMoving');
if (NotMoving==True) gotostate('IHaveFinishedMoving');
}

state JustChillin
{
Begin:
Log("##################Hi From"$Self$"...Im Just ChillinG");
}

state ImMoving
{
begin:
Log("##################Hi From"$Self$"...Im moving");
ProcessSFX(,true,,);
}

state IHaveFinishedMoving
{
begin:
Log("##################Hi From"$Self$"... I Have FinishedMoving");
ProcessSFX(,,true,);
}

State DeadMF
{
begin:
Log("##################Hi From"$Self$"... I Have FinishedMoving");
ProcessSFX(,,,true);
log("arrghhhhhhhhhhhhhhh! im dying");
bHidden = true;
SetCollision(false, false, false);
}

defaultproperties
{
     RealCore_ScanRange=10000.000000
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'AW-Junk.Complex.FailedWeapon'
     InitialState="JustChillin"
     DrawScale3D=(Z=0.500000)
     bCollideActors=True
     bBlockActors=True
     bBlockKarma=True
     bPathColliding=True
}
