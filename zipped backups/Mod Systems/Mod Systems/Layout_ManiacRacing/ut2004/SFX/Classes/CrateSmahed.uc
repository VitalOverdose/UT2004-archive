//=============================================================================
// CrateSmahed.
//=============================================================================
class CrateSmahed extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter3
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.250000,Color=(B=128,G=255,R=255))
         ColorScale(2)=(RelativeTime=0.700000,Color=(B=64,G=128,R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(R=255))
         MaxParticles=3
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=30.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=50.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=25.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=20.000000
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter3'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.200000,Color=(B=128,G=255,R=255))
         ColorScale(2)=(RelativeTime=0.500000,Color=(B=64,G=128,R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(R=255))
         MaxParticles=5
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=15.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         StartSizeRange=(X=(Min=10.000000,Max=50.000000),Y=(Min=10.000000,Max=50.000000),Z=(Min=10.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
         LifetimeRange=(Min=0.250000,Max=0.750000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=5
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=20.000000)
         SizeScale(2)=(RelativeTime=0.200000,RelativeSize=25.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=35.000000)
         SizeScaleRepeats=10.000000
         StartSizeRange=(X=(Min=10.000000,Max=25.000000),Y=(Min=10.000000,Max=25.000000),Z=(Min=10.000000,Max=25.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter1'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter2
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=5
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         StartSizeRange=(X=(Min=10.000000,Max=50.000000),Y=(Min=10.000000,Max=50.000000),Z=(Min=10.000000,Max=50.000000))
         Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter2'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         MaxParticles=5
         StartLocationRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000))
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-0.500000,Max=0.500000),Z=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.850000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=10.000000,Max=50.000000),Y=(Min=10.000000,Max=50.000000),Z=(Min=10.000000,Max=50.000000))
         InitialParticlesPerSecond=100.000000
         DrawStyle=PTDS_Regular
         Texture=Texture'VMParticleTextures.VehicleExplosions.GENERICshrapnelTEX'
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         VelocityScale(0)=(RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=25.000000,Y=25.000000,Z=25.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
     End Object
     Emitters(4)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter4'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter5
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=25
         AddLocationFromOtherEmitter=4
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=10.000000,Max=50.000000),Y=(Min=10.000000,Max=50.000000),Z=(Min=10.000000,Max=50.000000))
         InitialParticlesPerSecond=30.000000
         Texture=Texture'VMParticleTextures.VehicleExplosions.cloudPARTICLEredTEX'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
     End Object
     Emitters(5)=SpriteEmitter'SFX.CrateSmahed.SpriteEmitter5'

}
