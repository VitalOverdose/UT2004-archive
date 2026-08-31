//=============================================================================
// Fatal_ChunkChucker2.
//=============================================================================
class Chunk2Chucker extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter2
         UseCollision=True
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-950.000000)
         DampingFactorRange=(X=(Min=0.600000,Max=0.800000),Y=(Min=0.600000,Max=0.800000),Z=(Min=0.600000,Max=0.800000))
         MaxParticles=2
         StartSizeRange=(X=(Min=2.000000,Max=2.000000),Y=(Min=2.000000,Max=2.000000),Z=(Min=2.000000,Max=2.000000))
         InitialParticlesPerSecond=500.000000
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=-200.000000,Max=200.000000))
         VelocityScale(0)=(RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
         VelocityScale(1)=(RelativeTime=1.000000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=5.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.Chunk2Chucker.MeshEmitter2'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         StartLocationShape=PTLS_Sphere
         SphereRadiusRange=(Max=250.000000)
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=7.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.Skins.ExplosionFlashTex'
         LifetimeRange=(Min=0.200000,Max=0.200000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.Chunk2Chucker.SpriteEmitter4'

     bNoDelete=False
     bDirectional=True
}
