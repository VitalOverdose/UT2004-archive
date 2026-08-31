//     Class FDK_ALLVehicleBooster
//
// kicks ANY vehicle.
//
// By FatalOverdose (c) 2005 www.fataloverdose.copperstream.co.uk
// Part1 Of the SpiderCore MOD Package
// optional vocal's(just remove sound to disable in unrealed)
// Optional taril FX specify as many as you want an one will be picked
//  at random when the kick happens. Trail FX are hard attached to vehicle
// optional FD_BoosterGroundFX (not hard attached to vehicle)
// booster will boost the vehicle in the direction hes facing
// unless the directional option is set to true
//-----------------------------------------------------------

class ALLVehicleBooster extends triggers;

Var (VehicleBooster) vector                     FD_AppliedBoostForce;
Var (VehicleBooster) bool                       FD_bDirectional;
Var (VehicleBooster) Sound                      FD_VOC_Boost;
Var (VehicleBooster) array < class< FD_FX> >    FD_Booster_TrailFX,FD_BoosterGroundFX;
Var  int                                        FDRandom;

Function PostBeginPlay()
{
if ( FD_Booster_TrailFX[1] != none ) FDRandom=Rand( FD_Booster_TrailFX.length );
}

Function FD_SpawnRNDFX(actor TheTarget)
{
local Emitter FDSpawnEffect;local int temp2;
if (FD_VOC_Boost!=None) Playsound (FD_VOC_Boost);

if (FD_Booster_TrailFX[1]!=none)                      //   attatch random trail fx to vehicle
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   FDSpawnEffect = spawn(FD_Booster_TrailFX[FDRandom],self,,TheTarget.Location , TheTarget.Rotation);
   FDSpawnEffect.SetBase( TheTarget );
   FDRandom=Rand( FD_BoosterGroundFX.length );      // pick RND number for next function
   }
if (FD_BoosterGroundFX[1]!=none)                    //   attatch fx to self
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   FDSpawnEffect = spawn(FD_BoosterGroundFX[FDRandom],self,,Location ,Rotation);
   FDSpawnEffect.SetBase( self );
   temp2= FD_Booster_TrailFX.Length;
   FDRandom=Rand( temp2 );       // pick RND number for nect boost
   }
}

Function FD_GenericVehicleBoost(onsvehicle TheTarget)
{
Local Vector FD_PointOfBoostForce;
if (FD_VOC_Boost!=None) Playsound (FD_VOC_Boost);
if (bDirectional==True) TheTarget.KAddImpulse( FD_AppliedBoostForce >> self.Rotation, FD_PointOfBoostForce >> self.Rotation );
else
    TheTarget.KAddImpulse( FD_AppliedBoostForce >> TheTarget.Rotation, FD_PointOfBoostForce >> TheTarget.Rotation );
}

function Bump(Actor Other)
{
local onsvehicle temp;
if (onsvehicle(other)!= none)
   {
   temp=ONSVehicle(other);
   FD_GenericVehicleBoost(temp);
   FD_SpawnRNDFX(temp);
   }
}

function touch(actor other)
{
local onsvehicle temp;
if (onsvehicle(other)!= none)
   {
   temp=ONSVehicle(other);
   FD_GenericVehicleBoost(temp);
   FD_SpawnRNDFX(temp);
   }
}

defaultproperties
{
     FD_AppliedBoostForce=(X=9000000.000000)
     FD_VOC_Boost=Sound'AnnouncerEvil.Booster'
     Texture=Texture'XEffectMat.Shock.Shock_ring_a'
     DrawScale=5.000000
     CollisionHeight=100.000000
}
