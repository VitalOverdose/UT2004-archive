//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CentipedeFactory extends ONSShockTankFactory;

var(OnFirstEntry)float                  FD_BoostDelayTime,FD_VehicleKickMass,FD_ReControlTime,FDScanRange;
var(OnFirstEntry)Int                    FD_Boosts;
var(OnFirstEntry)bool                   FD_bUseVocalCount,FD_bBoosterEnabled,FD_BoostFXEnabled,FD_HardAttachFX,FD_bSearchAndLinkRecoiler;
var(OnFirstEntry) FD_Recoiler           FD_TheLinkedRecoiler;
var(OnFirstEntry) name                  FD_FirstEntryEvent;
var(OnFirstEntry) Vector                FD_AppliedBoostForce;
var(FX) array < class <FD_FX> >         FD_TheFx;
var(FX) array < Sound>                  FD_TheSound;
var() float                             FD_Groundspeed;



function SpawnVehicle()
{
	local Pawn P;
	local bool bBlocked;

    foreach CollidingActors(class'Pawn', P, VehicleClass.default.CollisionRadius * 1.25)
	{
		bBlocked = true;
		if (PlayerController(P.Controller) != None)
			PlayerController(P.Controller).ReceiveLocalizedMessage(class'ONSOnslaughtMessage', 11);
	}

    if (bBlocked)
    	SetTimer(1, false); //try again later
    else
    {
        if (bReverseBlueTeamDirection && ONSOnslaughtGame(Level.Game) != None && ((TeamNum == 1 && !ONSOnslaughtGame(Level.Game).bSidesAreSwitched) || (TeamNum == 0 && ONSOnslaughtGame(Level.Game).bSidesAreSwitched)))
            LastSpawned = spawn(VehicleClass,,, Location, Rotation + rot(0,32768,0));
        else
            LastSpawned = spawn(VehicleClass,,, Location, Rotation);

            TransmitStats(LastSpawned);
		if (LastSpawned != None )
		{
			VehicleCount++;
			LastSpawned.SetTeamNum(TeamNum);
			LastSpawned.Event = Tag;
			LastSpawned.ParentFactory = Self;

            TriggerEvent(Event, Self, LastSpawned);
		}
    }
}


function TransmitStats(actor TheTarget)
{
local Int I;

Wyvern(TheTarget).FD_BoostDelayTime=FD_BoostDelayTime;
Wyvern(TheTarget).FD_VehicleKickMass=FD_VehicleKickMass;
Wyvern(TheTarget).FD_ScanRange=FDScanRange;
Wyvern(TheTarget).FD_ReControlTime=FD_ReControlTime;
Wyvern(TheTarget).FD_Boosts=FD_Boosts;
Wyvern(TheTarget).FD_bUseVocalCount=FD_bUseVocalCount;
Wyvern(TheTarget).FD_bBoosterEnabled=FD_bBoosterEnabled;
Wyvern(TheTarget).FD_BoostFXEnabled=FD_BoostFXEnabled;
Wyvern(TheTarget).FD_HardAttachFX=FD_HardAttachFX;
Wyvern(TheTarget).FD_FirstEntryEvent=FD_FirstEntryEvent;
Wyvern(TheTarget).FD_AppliedBoostForce=FD_AppliedBoostForce;
Wyvern(TheTarget).FD_Groundspeed=FD_Groundspeed;
Wyvern(TheTarget).FD_ScanRange=FDScanRange;
log("hi there from"$Self$". FD_TheFx.Length is "$FD_TheFx.Length);log("hi there from"$Self$". FD_TheSound.Length is "$FD_TheSound.Length);
for (I=0;I<FD_TheFx.Length;I++){Wyvern(TheTarget).FD_TheFx[I]=FD_TheFx[I];}
for (I=0;I<FD_TheSound.Length;I++){Wyvern(TheTarget).FD_TheSound[I]=FD_TheSound[I];}

}

defaultproperties
{
     FD_BoostDelayTime=1.000000
     FD_VehicleKickMass=2.000000
     FD_ReControlTime=3.000000
     FDScanRange=10000.000000
     FD_Boosts=1
     FD_bUseVocalCount=True
     FD_bBoosterEnabled=True
     FD_BoostFXEnabled=True
     FD_HardAttachFX=True
     FD_AppliedBoostForce=(X=90000000.000000)
     VehicleClass=Class'VecTech.centipede'
     AmbientGlow=51
}
