//=============================================================================
//  Firework_2Blue.
//=============================================================================
class  Firework_2Blue extends SFX_FireWorks
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter342
         UseColorScale=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         UseVelocityScale=True
         Acceleration=(Z=1500.000000)
         ColorScale(0)=(Color=(B=255,G=255,R=128))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=128))
         ColorScale(2)=(RelativeTime=0.600000,Color=(B=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,R=128))
         MaxParticles=1
         StartLocationRange=(Z=(Min=150.000000,Max=150.000000))
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=2.000000)
         SizeScale(1)=(RelativeTime=0.010000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=4.000000)
         SizeScaleRepeats=20.000000
         StartSizeRange=(X=(Min=200.000000,Max=200.000000),Y=(Min=200.000000,Max=200.000000),Z=(Min=200.000000,Max=200.000000))
         InitialParticlesPerSecond=100.000000
 //        Texture=Texture'FatalsDest_Text.Bang.Fatal-Torpedo'
         TextureUSubdivisions=2
         TextureVSubdivisions=4
         LifetimeRange=(Min=3.000000,Max=3.000000)
         StartVelocityRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=0.250000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=1.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=2.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Firework_2Blue.SpriteEmitter342'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter343
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=128))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=128,R=128))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=160))
         MaxParticles=100
         AddLocationFromOtherEmitter=0
         StartSpinRange=(X=(Min=0.250000,Max=0.250000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=35.000000
         Texture=Texture'EpicParticles.Flares.SoftFlare'
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.Firework_2Blue.SpriteEmitter343'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter344
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.200000,Color=(B=255,G=128,R=128))
         ColorScale(2)=(RelativeTime=0.500000,Color=(B=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,R=128))
         MaxParticles=8
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.500000)
         SizeScale(2)=(RelativeTime=0.850000,RelativeSize=2.500000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'EpicParticles.Flares.FlashFlare1'
         LifetimeRange=(Min=3.000000,Max=3.000000)
         InitialDelayRange=(Min=3.000000,Max=3.000000)
         StartVelocityRange=(X=(Min=-1000.000000,Max=1000.000000),Y=(Min=-1000.000000,Max=1000.000000),Z=(Min=25.000000,Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=-50.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=-100.000000))
     End Object
     Emitters(2)=SpriteEmitter'SFX.Firework_2Blue.SpriteEmitter344'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter345
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=255,G=255,R=128))
         ColorScale(1)=(RelativeTime=0.600000,Color=(B=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,R=128))
         MaxParticles=3
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=0.100000,Max=0.250000)
         InitialDelayRange=(Min=3.000000,Max=3.000000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.Firework_2Blue.SpriteEmitter345'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter346
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         ColorScale(0)=(Color=(B=255,G=255,R=128))
         ColorScale(1)=(RelativeTime=0.200000,Color=(B=128,R=128))
         ColorScale(2)=(RelativeTime=0.500000,Color=(B=255,G=128))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=64))
         ColorScaleRepeats=10.000000
         MaxParticles=150
         AddLocationFromOtherEmitter=2
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=75.000000
         Texture=Texture'EpicParticles.Flares.SoftFlare'
         LifetimeRange=(Min=3.000000,Max=3.000000)
         InitialDelayRange=(Min=3.250000,Max=3.250000)
     End Object
     Emitters(4)=SpriteEmitter'SFX.Firework_2Blue.SpriteEmitter346'

}
