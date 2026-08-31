//=============================================================================
// Fatal_ChunkChucker3.
//=============================================================================
class Chunk3Chucker extends Emitter
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter21
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         MaxParticles=20
         AddLocationFromOtherEmitter=1
         StartSizeRange=(X=(Min=300.000000,Max=500.000000),Y=(Min=300.000000,Max=500.000000),Z=(Min=300.000000,Max=500.000000))
         Texture=Texture'EpicParticles.Smoke.StellarFog1aw'
         LifetimeRange=(Min=0.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Chunk3Chucker.SpriteEmitter21'

     Begin Object Class=MeshEmitter Name=MeshEmitter9
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-900.000000)
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         MaxParticles=2
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-0.500000,Max=0.500000))
         StartSizeRange=(X=(Min=0.100000,Max=0.500000),Y=(Min=0.100000,Max=0.500000),Z=(Min=0.100000,Max=0.500000))
         InitialParticlesPerSecond=500.000000
         LifetimeRange=(Min=3.000000,Max=3.000000)
         StartVelocityRange=(X=(Min=-350.000000,Max=350.000000),Y=(Min=-350.000000,Max=350.000000),Z=(Min=-50.000000,Max=350.000000))
         VelocityScale(1)=(RelativeTime=0.050000,RelativeVelocity=(X=60.000000,Y=60.000000,Z=60.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(3)=(RelativeTime=0.500000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(4)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(1)=MeshEmitter'SFX.Chunk3Chucker.MeshEmitter9'

     bNoDelete=False
     bDirectional=True
}
