//=============================================================================
// NovaStar.
//=============================================================================
class NovaStar extends SFX_Space
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=50.000000)
         MaxParticles=1
         AutoResetTimeRange=(Min=10.000000,Max=10.000000)
         RevolutionCenterOffsetRange=(X=(Min=-256.000000,Max=256.000000))
         RevolutionsPerSecondRange=(X=(Max=2.000000))
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'EpicParticles.Flares.FlashFlare1'
         LifetimeRange=(Min=6.000000,Max=6.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000))
         VelocityScale(0)=(RelativeVelocity=(X=20.000000,Y=20.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=5.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter15
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=200
         StartLocationRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000))
         AddLocationFromOtherEmitter=0
         StartSizeRange=(X=(Min=10.000000,Max=20.000000))
         InitialParticlesPerSecond=75.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-250.000000,Max=-100.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.SpriteEmitter15'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter10
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=-5000.000000)
         StartLocationRange=(X=(Min=-15.000000,Max=15.000000),Y=(Min=-15.000000,Max=15.000000))
         AddLocationFromOtherEmitter=0
         StartSpinRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=0.750000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.200000,Max=0.400000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-100.000000,Max=-50.000000))
     End Object
     Emitters(2)=SpriteEmitter'SFX.SpriteEmitter10'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter12
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=250
         AddLocationFromOtherEmitter=0
         StartSpinRange=(X=(Min=-2.000000,Max=2.000000))
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=30.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=2.000000,Max=3.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000))
     End Object
     Emitters(3)=SpriteEmitter'SFX.SpriteEmitter12'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter13
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         UseVelocityScale=True
         Acceleration=(Z=-50.000000)
         MaxParticles=150
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeSize=0.100000)
         SizeScaleRepeats=30.000000
         StartSizeRange=(X=(Min=10.000000,Max=25.000000))
         InitialParticlesPerSecond=500.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Max=6.000000)
         InitialDelayRange=(Min=6.000000,Max=6.000000)
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=10.000000))
     End Object
     Emitters(4)=SpriteEmitter'SFX.SpriteEmitter13'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.400000,Color=(B=64,G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         Texture=Texture'XGame.Water.xCausticRing2'
         LifetimeRange=(Min=0.250000,Max=0.750000)
         InitialDelayRange=(Min=6.000000,Max=6.000000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter14
         FadeOut=True
         RespawnDeadParticles=False
         UniformSize=True
         UseVelocityScale=True
         MaxParticles=300
         AddLocationFromOtherEmitter=4
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         Texture=Texture'XEffects.PainterDecalMark'
         LifetimeRange=(Min=3.000000,Max=5.000000)
         InitialDelayRange=(Min=4.000000,Max=4.000000)
         StartVelocityRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-250.000000,Max=-50.000000))
     End Object
     Emitters(6)=SpriteEmitter'SFX.SpriteEmitter14'

}
