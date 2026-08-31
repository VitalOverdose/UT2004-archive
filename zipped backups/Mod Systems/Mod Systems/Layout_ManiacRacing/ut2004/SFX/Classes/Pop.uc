//=============================================================================
// Pop.
//=============================================================================
class Pop extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter29
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=50
         StartLocationRange=(X=(Min=-500.000000,Max=500.000000),Y=(Min=-500.000000,Max=500.000000))
         StartLocationShape=PTLS_Sphere
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=10.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=5.000000)
         StartSizeRange=(X=(Min=5.000000,Max=50.000000),Y=(Min=5.000000,Max=50.000000),Z=(Min=5.000000,Max=50.000000))
         InitialParticlesPerSecond=1000.000000
         Texture=None
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.500000,Max=2.000000)
         StartVelocityRange=(X=(Min=-750.000000,Max=750.000000),Y=(Min=-750.000000,Max=750.000000),Z=(Max=100.000000))
         VelocityScale(0)=(RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Pop.SpriteEmitter29'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter30
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=1.000000)
         StartLocationShape=PTLS_Sphere
         SphereRadiusRange=(Min=128.000000,Max=256.000000)
         SizeScale(0)=(RelativeSize=7.000000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Max=500.000000),Y=(Max=500.000000),Z=(Max=500.000000))
         InitialParticlesPerSecond=20.000000
         Texture=None
         LifetimeRange=(Min=0.150000,Max=0.250000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.Pop.SpriteEmitter30'

     bNoDelete=False
}
