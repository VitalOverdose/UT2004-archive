//=============================================================================
// CometX2_Spitter.
//=============================================================================
class CometX2_Spitter extends SFX_Space
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter2
         UseCollision=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         UseVelocityScale=True
         Acceleration=(Z=10.000000)
         MaxParticles=2
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=200.000000
         StartSizeRange=(X=(Min=50.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=15.000000,Max=30.000000)
         StartVelocityRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000),Z=(Min=150.000000,Max=250.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=5.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.SpriteEmitter2'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         AddLocationFromOtherEmitter=0
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         SizeScaleRepeats=10.000000
         StartSizeRange=(X=(Min=50.000000))
         InitialParticlesPerSecond=30.000000
         Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.250000,Max=0.750000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         AddLocationFromOtherEmitter=0
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=50.000000))
         InitialParticlesPerSecond=30.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.SpriteEmitter1'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter3
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=100
         AddLocationFromOtherEmitter=0
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         StartSpinRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=1.500000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'EmitterTextures.MultiFrame.Effect_F'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=5.000000,Max=10.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
     End Object
     Emitters(3)=SpriteEmitter'SFX.SpriteEmitter3'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         FadeOut=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=30
         AddLocationFromOtherEmitter=0
         StartSpinRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'EmitterTextures.MultiFrame.LargeFlames'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=2.000000,Max=6.000000)
     End Object
     Emitters(4)=SpriteEmitter'SFX.SpriteEmitter4'

}
