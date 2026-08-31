//=============================================================================
// DoubelDeathrings.
//=============================================================================
class DoubelDeathrings extends Emitter
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter40
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=2000.000000)
         ColorScale(0)=(Color=(R=64))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255))
         MaxParticles=15
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=100.000000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=40.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=10.000000
         Texture=None
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.DoubelDeathrings.SpriteEmitter40'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter44
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=-4000.000000)
         ColorScale(0)=(Color=(R=64))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=223,G=255,R=255))
         MaxParticles=15
         StartLocationRange=(Z=(Min=6200.000000,Max=6200.000000))
         SizeScale(0)=(RelativeSize=100.000000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=40.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=10.000000
         Texture=None
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.DoubelDeathrings.SpriteEmitter44'

     bNoDelete=False
     bDirectional=True
}
