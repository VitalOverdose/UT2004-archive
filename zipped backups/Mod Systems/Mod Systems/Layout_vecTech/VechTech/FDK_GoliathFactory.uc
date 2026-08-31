//-----------------------------------------------------------
//
//-----------------------------------------------------------
class FDK_GoliathFactory extends ONSTankFactory;


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

FDK_Goliath(TheTarget).FD_BoostDelayTime=FD_BoostDelayTime;
FDK_Goliath(TheTarget).FD_VehicleKickMass=FD_VehicleKickMass;
FDK_Goliath(TheTarget).FD_ScanRange=FDScanRange;
FDK_Goliath(TheTarget).FD_ReControlTime=FD_ReControlTime;
FDK_Goliath(TheTarget).FD_Boosts=FD_Boosts;
FDK_Goliath(TheTarget).FD_bUseVocalCount=FD_bUseVocalCount;
FDK_Goliath(TheTarget).FD_bBoosterEnabled=FD_bBoosterEnabled;
FDK_Goliath(TheTarget).FD_BoostFXEnabled=FD_BoostFXEnabled;
FDK_Goliath(TheTarget).FD_HardAttachFX=FD_HardAttachFX;
FDK_Goliath(TheTarget).FD_FirstEntryEvent=FD_FirstEntryEvent;
FDK_Goliath(TheTarget).FD_AppliedBoostForce=FD_AppliedBoostForce;
FDK_Goliath(TheTarget).FD_Groundspeed=FD_Groundspeed;
FDK_Goliath(TheTarget).FD_ScanRange=FDScanRange;
log("hi there from"$Self$". FD_TheFx.Length is "$FD_TheFx.Length);log("hi there from"$Self$". FD_TheSound.Length is "$FD_TheSound.Length);
for (I=0;I<FD_TheFx.Length;I++){FDK_Goliath(TheTarget).FD_TheFx[I]=FD_TheFx[I];}
for (I=0;I<FD_TheSound.Length;I++){FDK_Goliath(TheTarget).FD_TheSound[I]=FD_TheSound[I];}

}

defaultproperties
{
     FD_BoostDelayTime=1.000000
     FD_VehicleKickMass=3.000000
     FD_ReControlTime=3.000000
     FDScanRange=10000.000000
     FD_Boosts=1
     FD_bUseVocalCount=True
     FD_bBoosterEnabled=True
     FD_BoostFXEnabled=True
     FD_HardAttachFX=True
     FD_AppliedBoostForce=(X=90000000.000000)
     RedBuildEffectClass=Class'Onslaught.ONSHoverBikeBuildEffectRed'
     BlueBuildEffectClass=Class'Onslaught.ONSHoverBikeBuildEffectBlue'
     VehicleClass=Class'VecTech.FDK_Goliath'
     AmbientGlow=51
}
