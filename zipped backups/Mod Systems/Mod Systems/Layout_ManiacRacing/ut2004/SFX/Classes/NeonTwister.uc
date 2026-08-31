//=============================================================================
// NeonTwister.
//=============================================================================
class NeonTwister extends SFX_Vertical
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter5
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=128,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=255,R=128))
         StartSpinRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         SizeScaleRepeats=4.000000
         StartSizeRange=(X=(Min=50.000000))
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.SpriteEmitter5'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=100.000000)
         ColorScale(0)=(Color=(B=255,G=106,R=181))
         ColorScale(1)=(RelativeTime=0.300000,Color=(B=128,G=255,R=128))
         ColorScale(2)=(RelativeTime=0.700000,Color=(B=255,G=255,R=128))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,R=128))
         MaxParticles=50
         SpinsPerSecondRange=(X=(Min=0.250000,Max=1.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=1.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=2.000000)
         StartSizeRange=(X=(Min=75.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=2.000000,Max=3.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.SpriteEmitter6'

}
