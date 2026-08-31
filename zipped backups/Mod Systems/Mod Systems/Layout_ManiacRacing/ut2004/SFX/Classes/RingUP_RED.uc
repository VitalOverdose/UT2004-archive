//=============================================================================
//  RingUP_RED.
//=============================================================================
class RingUP_RED extends SFX_Vertical
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter20
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=64,G=128,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(R=255))
         MaxParticles=3
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=15.000000)
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.RingUP_RED.SpriteEmitter20'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter21
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         UseVelocityScale=True
         Acceleration=(Z=1000.000000)
         ColorScale(0)=(Color=(B=128,G=128,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(R=255))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=2.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=1.000000)
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=0.300000,Max=0.300000)
         StartVelocityRange=(Z=(Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(Z=20.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Z=1.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.RingUP_RED.SpriteEmitter21'

}
