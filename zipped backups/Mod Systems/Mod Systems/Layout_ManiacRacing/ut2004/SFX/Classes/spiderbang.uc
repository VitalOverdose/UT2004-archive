//=============================================================================
// spiderbang.
//=============================================================================
class SpiderBang extends SFX_SpiderCore
placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter7
         UseCollision=True
         RespawnDeadParticles=False
         AutoDestroy=True
         SpinParticles=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-900.000000)
         DampingFactorRange=(X=(Min=0.300000,Max=0.400000),Y=(Min=0.300000,Max=0.400000),Z=(Min=0.300000,Max=0.400000))
         MaxParticles=2
         AutoResetTimeRange=(Min=7.000000,Max=7.000000)
         StartLocationRange=(X=(Min=-500.000000,Max=500.000000),Y=(Min=-500.000000,Max=500.000000),Z=(Min=-500.000000,Max=500.000000))
         SphereRadiusRange=(Min=1024.000000,Max=2048.000000)
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000),Z=(Min=-0.500000,Max=0.500000))
         RotationDampingFactorRange=(X=(Min=0.900000,Max=0.900000),Y=(Min=0.900000,Max=0.900000),Z=(Min=0.900000,Max=0.900000))
         InitialParticlesPerSecond=500.000000
         LifetimeRange=(Min=3.000000)
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Max=800.000000))
         VelocityScale(0)=(RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
         VelocityScale(1)=(RelativeTime=0.500000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=2.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.spiderbang.MeshEmitter7'

     bLightChanged=True
     bNoDelete=False
     Region=(iLeaf=355,ZoneNumber=4)
     Tag="Emitter"
     Location=(X=-795.035645,Y=-1183.000000,Z=-1790.626953)
     DrawScale=7.000000
     bDirectional=True
     bSelected=True
}
