//=============================================================================
//  RingUP_BLUE.
//=============================================================================
class RingUP_BLUE extends SFX_Vertical
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter18
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=255,R=128))
         ColorScale(2)=(RelativeTime=0.700000,Color=(B=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=128))
         MaxParticles=3
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=15.000000)
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.RingUP_BLUE.SpriteEmitter18'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter19
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
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=255,R=128))
         ColorScale(2)=(RelativeTime=0.800000,Color=(B=255,G=128,R=128))
         ColorScale(3)=(RelativeTime=0.900000,Color=(B=255))
         ColorScale(4)=(RelativeTime=1.000000,Color=(B=128))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=2.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=1.000000)
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=0.300000,Max=0.300000)
         StartVelocityRange=(Z=(Max=50.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(Z=20.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Z=1.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.RingUP_BLUE.SpriteEmitter19'

}
