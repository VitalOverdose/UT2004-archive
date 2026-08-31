//=============================================================================
//  Firework_2Red.
//=============================================================================
class  FireWork_2Red extends SFX_FireWorks
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter113
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         UseVelocityScale=True
         Acceleration=(Z=750.000000)
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=255))
         MaxParticles=1
         StartLocationRange=(Z=(Min=150.000000,Max=150.000000))
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=2.000000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=0.100000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=2.000000)
         SizeScaleRepeats=20.000000
         StartSizeRange=(X=(Min=200.000000,Max=200.000000),Y=(Min=200.000000,Max=200.000000),Z=(Min=200.000000,Max=200.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaStarRed'
         LifetimeRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=0.250000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=1.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=2.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Firework_2Red.SpriteEmitter113'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter114
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.560000,Color=(B=64,G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         MaxParticles=100
         AddLocationFromOtherEmitter=0
         StartSpinRange=(X=(Min=0.250000,Max=0.250000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=35.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadRed'
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.Firework_2Red.SpriteEmitter114'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter115
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=8
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=0.850000,RelativeSize=1.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000,Max=50.000000),Y=(Min=50.000000,Max=50.000000),Z=(Min=50.000000,Max=50.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaMuzzleBlue'
         LifetimeRange=(Min=1.500000,Max=1.500000)
         InitialDelayRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-500.000000,Max=500.000000),Y=(Min=-500.000000,Max=500.000000),Z=(Min=20.000000,Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=5.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=-20.000000))
     End Object
     Emitters(2)=SpriteEmitter'SFX.Firework_2Red.SpriteEmitter115'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter116
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         MaxParticles=3
         AddLocationFromOtherEmitter=0
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         Texture=Texture'XEffectMat.Shock.shock_ring_b'
         LifetimeRange=(Min=0.100000,Max=0.250000)
         InitialDelayRange=(Min=1.500000,Max=1.500000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.Firework_2Red.SpriteEmitter116'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter117
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=150
         AddLocationFromOtherEmitter=2
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2Red'
         LifetimeRange=(Min=1.500000,Max=1.500000)
         InitialDelayRange=(Min=1.500000,Max=1.500000)
     End Object
     Emitters(4)=SpriteEmitter'SFX.Firework_2Red.SpriteEmitter117'

}
