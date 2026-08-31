//=============================================================================
// firetrail.
//=============================================================================
class firetrail extends SFX_Trails
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter22
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=100
         StartLocationRange=(X=(Min=-128.000000,Max=128.000000),Y=(Min=-128.000000,Max=128.000000))
         StartSpinRange=(X=(Min=0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=1.500000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.200000)
         StartSizeRange=(X=(Min=50.000000,Max=300.000000),Y=(Min=50.000000,Max=150.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'SFX.ddf.A00'
         LifetimeRange=(Min=1.000000,Max=2.000000)
     End Object
     Emitters(0)=SpriteEmitter'sfx.SpriteEmitter22'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter23
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=100
         StartLocationRange=(X=(Min=-128.000000,Max=128.000000),Y=(Min=-128.000000,Max=128.000000))
         StartSpinRange=(X=(Min=0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'StreamlineIntro.Scene4.flames'
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=10.000000,Max=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'sfx.SpriteEmitter23'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter24
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=100
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         ParticlesPerSecond=15.000000
         Texture=Texture'SFX.ddf.A20'
     End Object
     Emitters(2)=SpriteEmitter'sfx.SpriteEmitter24'

}
