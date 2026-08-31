//=============================================================================
//  firework2_RED.
//=============================================================================
class  FireWork_1Red extends SFX_FireWorks
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter352
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
         ColorScale(0)=(Color=(B=64,G=128,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=128))
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
//         Texture=Texture'FatalsDest_Text.Bang.Fatal-Torpedo'
         TextureUSubdivisions=2
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=0.250000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=1.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=2.000000))
     End Object
//     Emitters(0)=SpriteEmitter'SFX.firework2_RED.SpriteEmitter352'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter353
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         ColorScaleRepeats=5.000000
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
 //    Emitters(1)=SpriteEmitter'SFX.firework2_RED.SpriteEmitter353'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter354
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         ColorScale(0)=(Color=(R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=64,G=128,R=255))
         ColorScale(2)=(RelativeTime=0.700000,Color=(R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,R=255))
         MaxParticles=8
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.500000)
         SizeScale(2)=(RelativeTime=0.850000,RelativeSize=2.500000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'EpicParticles.Flares.FlashFlare1'
         LifetimeRange=(Min=1.500000,Max=1.500000)
         InitialDelayRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-1000.000000,Max=1000.000000),Y=(Min=-1000.000000,Max=1000.000000),Z=(Min=25.000000,Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=-50.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=-100.000000))
     End Object
 //    Emitters(2)=SpriteEmitter'SFX.firework2_RED.SpriteEmitter354'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter355
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.300000,Color=(B=64,G=128,R=255))
         ColorScale(2)=(RelativeTime=0.800000,Color=(R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,R=255))
         MaxParticles=3
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=0.100000,Max=0.250000)
         InitialDelayRange=(Min=1.500000,Max=1.500000)
     End Object
 //    Emitters(3)=SpriteEmitter'SFX.firework2_RED.SpriteEmitter355'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter356
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
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=64,G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         ColorScaleRepeats=2.000000
         MaxParticles=150
         AddLocationFromOtherEmitter=2
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=75.000000
         Texture=Texture'EpicParticles.Flares.SoftFlare'
         LifetimeRange=(Min=1.500000,Max=1.500000)
         InitialDelayRange=(Min=1.750000,Max=1.750000)
     End Object
 //    Emitters(4)=SpriteEmitter'SFX.firework2_RED.SpriteEmitter356'

}
