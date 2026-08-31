//     Class FDK_ALLVehicleBooster
//
// kicks ANY vehicle.
//
// By FatalOverdose (c) 2005 www.fataloverdose.copperstream.co.uk
// optional vocal's(just remove sound to disable in unrealed)
// booster will boost the vehicle in the direction hes facing
// unless the directional option is set to true
//-----------------------------------------------------------

class ALLVecBooster extends Triggers;

Var (ManiacRacing) vector                      AppliedBoostForce;
Var (ManiacRacing) bool                        bDirectionalBoost;
Var (ManiacRacing) Sound                       VOC_Boost;

Function  GenericVehicleBoost(onsvehicle TheTarget)
{
Local Vector  PointOfBoostForce;
if ( VOC_Boost!=None) Playsound ( VOC_Boost);
if (bDirectionalBoost==True) TheTarget.KAddImpulse(  AppliedBoostForce >> self.Rotation,  PointOfBoostForce >> self.Rotation );
else
TheTarget.KAddImpulse(  AppliedBoostForce >> TheTarget.Rotation,  PointOfBoostForce >> TheTarget.Rotation );
}

function Bump(Actor Other)
{
if (other.isa('onsvehicle')) GenericVehicleBoost(ONSVehicle(other));
}

function touch(actor other)
{
if (other.isa('onsvehicle')) GenericVehicleBoost(ONSVehicle(other));
}

defaultproperties
{
AppliedBoostForce=(X=9000000.000000)
VOC_Boost=Sound'AnnouncerEvil.Booster'
Texture=Texture'XEffectMat.Shock.Shock_ring_a'
DrawScale=5.000000
CollisionHeight=150.000000
CollisionRadius=150.000000
}
