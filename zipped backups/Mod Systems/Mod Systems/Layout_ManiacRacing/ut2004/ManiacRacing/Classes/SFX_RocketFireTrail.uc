//=============================================================================
// rocketFireTrail.
//=============================================================================
class SFX_RocketFireTrail extends SFX_Trails
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseColorScale=True
         FadeOut=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.300000,Color=(B=102,G=152,R=255))
         ColorScale(2)=(RelativeTime=0.600000,Color=(R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(R=128))
         MaxParticles=200
         SpinsPerSecondRange=(X=(Min=-0.100000,Max=0.100000),Z=(Min=-1.000000,Max=1.000000))
         StartSpinRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=25.000000,Max=75.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Particles.Energy.BurnFlare'
         LifetimeRange=(Min=0.500000,Max=2.000000)
         StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-10.000000,Max=10.000000))
     End Object
     Emitters(0)=SpriteEmitter'maniacracing.SpriteEmitter0'

}
