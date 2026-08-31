//                             Class FD_GenericVehicleBooster
//
// By FatalOverdose (c) 2005 www.fataloverdose.copperstream.co.uk
// Part or the FatalsDestructables MOD Package
//
//
//
//-----------------------------------------------------------
class VecTech_VehicleBooster extends triggers;

var(FDK_Booster) vector         FD_AppliedBoostForce;
var(FDK_Booster) bool           FDb_CauseBoosterFX,FD_bHardAttachFX;
var(FDK_Booster) float          FD_RE_Boostdelay;
var(FDK_Booster) Int            FD_Boosts;

var(FDK_Booster) class<FD_FX>   AmbiantFX;
var(FDK_Booster) Sound          FD_VOC_Boost;

function postbeginplay ()
{
if (AmbiantFX!=none) Spawn( AmbiantFX, Owner,, Location );
Super.PostBeginPlay();
}

function touch(actor other)
{
//if (FDK_Scorpion(other)!= none) FDK_Scorpion(other).Booster(FD_Boosts,FD_AppliedBoostForce,FD_RE_Boostdelay,FDb_CauseBoosterFX,FD_bHardAttachFX,);
//else
//if (FDK_HoverTank(other)!= none) FDK_HoverTank(other).Booster(FD_Boosts,FD_AppliedBoostForce,FD_RE_Boostdelay,FDb_CauseBoosterFX,FD_bHardAttachFX,);
//else
if (Wyvern(other)!= none) Wyvern(other).Booster(FD_Boosts,FD_AppliedBoostForce,FD_RE_Boostdelay,FDb_CauseBoosterFX,FD_bHardAttachFX,);
}

defaultproperties
{
     FD_AppliedBoostForce=(X=9000000.000000)
     FDb_CauseBoosterFX=True
     FD_RE_Boostdelay=1.000000
     FD_VOC_Boost=Sound'AnnouncerEvil.Booster'
     DrawScale=5.000000
}
