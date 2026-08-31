//-----------------------------------------------------------
//
//-----------------------------------------------------------
class FatalsStationaryGunners extends ONSvehicle;

DefaultProperties
{
DriverWeapons(0)=(WeaponClass=Class'VecTech.FDK_WeaponsKit_FireStar')
PassengerWeapons(0)=(WeaponPawnClass=Class'Onslaught.ONSPRVRearGunPawn')


     Begin Object Class=KarmaParamsRBFull Name=KParams0

         KCOMOffset=(X=-0.250000)
         KLinearDamping=0.000000
         KAngularDamping=0.000000
         KStartEnabled=True
         bKNonSphericalInertia=True
         KActorGravScale=0
         bHighDetailOnly=False
         bClientOnly=False
         bKDoubleTickRate=True
         bKStayUpright=false
         bKAllowRotate=True
         bDestroyOnWorldPenetrate=True
         bDoSafetime=True
         KFriction=0.500000
         KImpactThreshold=300.000000
     End Object
KParams=KarmaParamsRBFull'VecTech.FatalsStationaryGunners.KParams0'

  Mesh=SkeletalMesh'AS_Vehicles_M.FloorTurretBase'
}
