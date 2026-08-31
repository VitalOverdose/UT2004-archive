//=============================================================================
// BeamBreaker.
//=============================================================================
class BeamBreaker extends SFX_Misc
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter55
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         StartLocationRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=4.000000)
         SizeScaleRepeats=5.000000
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=25.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         Texture=Texture'XEffects.LightningChargeT'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter55'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter56
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         MaxParticles=5
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=0.000000,Max=75.000000),Y=(Min=50.000000,Max=75.000000),Z=(Min=50.000000,Max=75.000000))
         Texture=Texture'AW-2004Particles.Fire.BlastMark'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter56'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter57
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=0.500000)
         SizeScale(3)=(RelativeTime=0.700000,RelativeSize=3.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         Texture=Texture'AW-2004Particles.Energy.ElecPanels'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter57'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter54
         UseColorScale=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         ColorScale(0)=(Color=(B=255,G=255,R=128))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=128))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,R=255))
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=0.500000)
         SizeScale(3)=(RelativeTime=0.700000,RelativeSize=3.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         Texture=Texture'AW-2004Particles.Energy.ElecPanels'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter54'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter74
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         StartLocationRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-250.000000,Max=250.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.300000,RelativeSize=0.100000)
         SizeScale(3)=(RelativeTime=0.400000,RelativeSize=1.200000)
         SizeScale(4)=(RelativeTime=0.500000,RelativeSize=0.200000)
         SizeScale(5)=(RelativeTime=0.600000,RelativeSize=2.500000)
         SizeScale(6)=(RelativeTime=0.700000,RelativeSize=0.100000)
         SizeScale(7)=(RelativeTime=0.800000,RelativeSize=2.000000)
         SizeScale(8)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=5.000000
         StartSizeRange=(X=(Min=30.000000,Max=75.000000),Y=(Min=30.000000,Max=75.000000),Z=(Min=30.000000,Max=75.000000))
         InitialParticlesPerSecond=300.000000
         Texture=None
         TextureUSubdivisions=3
         TextureVSubdivisions=3
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
     End Object
     Emitters(4)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter74'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter73
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=100
         AddLocationFromOtherEmitter=4
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=4.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=0.100000)
         SizeScale(3)=(RelativeTime=0.700000,RelativeSize=2.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=10.000000
         StartSizeRange=(X=(Min=5.000000,Max=15.000000),Y=(Min=5.000000,Max=15.000000),Z=(Min=5.000000,Max=15.000000))
         InitialParticlesPerSecond=100.000000
         Texture=None
         TextureUSubdivisions=2
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.250000,Max=0.500000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.BeamBreaker.SpriteEmitter73'

}
