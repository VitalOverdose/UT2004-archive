//=============================================================================
//  WebRing.
//=============================================================================
class WebRing extends Emitter
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter13
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
         ColorScale(0)=(RelativeTime=0.100000,Color=(G=255,R=128))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=128))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,R=128))
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=-0.100000,Max=0.100000),Y=(Min=-0.100000,Max=0.100000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=50.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=100.000000)
         InitialParticlesPerSecond=20.000000
         Texture=None
         LifetimeRange=(Min=5.000000,Max=5.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.WebRing.SpriteEmitter13'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter14
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
         ColorScale(0)=(Color=(B=128,R=128))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(G=255))
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=-0.100000,Max=0.100000),Y=(Min=-0.100000,Max=0.100000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=50.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=100.000000)
         InitialParticlesPerSecond=20.000000
         Texture=None
         LifetimeRange=(Min=5.000000,Max=5.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.WebRing.SpriteEmitter14'

     bNoDelete=False
     bDirectional=True
}
