//-----------------------------------------------------------
//
//-----------------------------------------------------------
class TheMortician extends FatalsStationaryGunners;

DefaultProperties
{

DriverWeapons(0)=(WeaponClass=Class'VecTech.Mortician_Head')
     DestructionEffectClass=Class'Onslaught.ONSVehicleExplosionEffect'
     DisintegrationEffectClass=Class'Onslaught.ONSVehDeathHoverTank'
     DisintegrationHealth=-125.000000
     DestructionLinearMomentum=(Min=250000.000000,Max=400000.000000)
     DestructionAngularMomentum=(Min=100.000000,Max=300.000000)
     DamagedEffectScale=1.500000
     DamagedEffectOffset=(X=100.000000,Y=20.000000,Z=26.000000)
     bEnableProximityViewShake=True
     VehicleMass=12.000000
     bTurnInPlace=True
     bDrawMeshInFP=True
     bPCRelativeFPRotation=False
     bSeparateTurretFocus=True
     health=3000
ExitPositions(0)=(Y=300.000000,Z=100.000000)
ExitPositions(1)=(Y=-300.000000,Z=100.000000)
ExitPositions(2)=(X=350.000000,Z=100.000000)
ExitPositions(3)=(X=-350.000000,Z=100.000000)
ExitPositions(4)=(X=-350.000000,Z=-100.000000)
ExitPositions(5)=(X=350.000000,Z=-100.000000)
ExitPositions(6)=(Y=300.000000,Z=-100.000000)
ExitPositions(7)=(Y=-300.000000,Z=-100.000000)
EntryRadius=140.000000
VehiclePositionString="in TheMortician"
VehicleNameString="TheMortician"
RedSkin=Shader'Chrome_cp.Walls.cp-chromewallred1shad'
BlueSkin=Shader'Chrome_cp.Walls.cp-chromewallblushad1'
bShowChargingBar=false

Skins(0)=Texture'Chrome_cp.Walls.cp_chromewall1'
AmbientGlow=51
     Begin Object Class=KarmaParamsRBFull Name=KParams0
         KInertiaTensor(0)=1.000000
         KInertiaTensor(3)=3.000000
         KInertiaTensor(5)=3.500000
         KCOMOffset=(X=-0.250000)
         KLinearDamping=0.000000
         KAngularDamping=0.000000
         KStartEnabled=True
         bKNonSphericalInertia=True
         KActorGravScale=0.000000
         bHighDetailOnly=False
         bClientOnly=False
         bKDoubleTickRate=True
         bKAllowRotate=True
         bDestroyOnWorldPenetrate=True
         bDoSafetime=True
         KFriction=0.500000
         KImpactThreshold=300.000000
     End Object
KParams=KarmaParamsRBFull'VecTech.TheMortician.KParams0'
  Mesh=SkeletalMesh'AS_Vehicles_M.FloorTurretBase'
}
