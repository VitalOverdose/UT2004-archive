//=============================================================================
// FireWork_Stolen.
//=============================================================================
class FireWork_Stolen extends SFX_FireWorks
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter155
         UseDirectionAs=PTDU_Up
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ScaleSizeYByVelocity=True
         AutomaticInitialSpawning=False
         ResetOnTrigger=True
         ColorScale(0)=(Color=(B=100,G=217,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(G=91,R=193))
         FadeOutStartTime=1.500000
         FadeInEndTime=0.200000
         MaxParticles=15
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=6.000000)
         StartSizeRange=(X=(Min=25.000000))
         ScaleSizeByVelocityMultiplier=(Y=0.005000)
         InitialParticlesPerSecond=50.000000
         DrawStyle=PTDS_Brighten
         Texture=Texture'BenTex02.Texture.Flame01'
         LifetimeRange=(Min=2.000000,Max=3.000000)
         StartVelocityRange=(Z=(Min=200.000000,Max=2500.000000))
         VelocityLossRange=(Z=(Min=0.750000,Max=1.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.FireWork_Stolen.SpriteEmitter155'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter156
         UseDirectionAs=PTDU_Up
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UniformSize=True
         ScaleSizeYByVelocity=True
         AutomaticInitialSpawning=False
         ResetOnTrigger=True
         ColorScale(0)=(Color=(B=234,G=53))
         ColorScale(1)=(RelativeTime=0.200000,Color=(B=168,G=236,R=255))
         ColorScale(2)=(Color=(G=89,R=179))
         FadeOutStartTime=0.500000
         FadeInEndTime=0.200000
         MaxParticles=40
         DetailMode=DM_High
         StartSizeRange=(X=(Min=4.000000,Max=10.000000))
         ScaleSizeByVelocityMultiplier=(Y=0.020000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'BenTex02.Texture.Flame01'
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=500.000000,Max=3000.000000))
         VelocityLossRange=(Z=(Min=0.250000,Max=0.750000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.FireWork_Stolen.SpriteEmitter156'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter157
         UseDirectionAs=PTDU_Up
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ScaleSizeYByVelocity=True
         AutomaticInitialSpawning=False
         ResetOnTrigger=True
         ColorScale(0)=(Color=(B=34,G=100,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(G=70,R=217))
         FadeOutStartTime=1.500000
         FadeInEndTime=1.500000
         MaxParticles=2
         DetailMode=DM_SuperHigh
         StartLocationOffset=(Z=256.000000)
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=4.000000)
         StartSizeRange=(X=(Min=200.000000,Max=400.000000))
         ScaleSizeByVelocityMultiplier=(Y=0.015000)
         Sounds(0)=(Sound=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion04',Radius=(Min=128.000000,Max=255.000000),Pitch=(Min=0.500000,Max=1.000000),Volume=(Min=20.000000,Max=30.000000),Probability=(Min=1.000000,Max=1.000000))
         Sounds(1)=(Sound=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion02',Radius=(Min=128.000000,Max=255.000000),Pitch=(Min=0.500000,Max=1.000000),Volume=(Min=20.000000,Max=30.000000),Probability=(Min=1.000000,Max=1.000000))
         Sounds(2)=(Sound=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion03',Radius=(Min=128.000000,Max=255.000000),Pitch=(Min=0.500000,Max=1.000000),Volume=(Min=20.000000,Max=30.000000),Probability=(Min=1.000000,Max=1.000000))
         SpawningSound=PTSC_Random
         SpawningSoundProbability=(Min=1.000000,Max=1.000000)
         InitialParticlesPerSecond=2000.000000
         Texture=Texture'BenTex02.Texture.SunGlow01'
         LifetimeRange=(Min=3.000000,Max=3.000000)
         StartVelocityRange=(Z=(Min=800.000000,Max=800.000000))
         VelocityLossRange=(Z=(Min=0.500000,Max=1.000000))
     End Object
     Emitters(2)=SpriteEmitter'SFX.FireWork_Stolen.SpriteEmitter157'

}
