//=============================================================================
// SCFX_Trails_MultiColor.
//=============================================================================
class SCFX_Trails_MultiColor extends FD_FX
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseColorScale=True
         FadeOut=True
         ResetAfterChange=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(1)=(RelativeTime=0.100000,Color=(B=255,R=255))
         ColorScale(2)=(RelativeTime=0.200000)
         ColorScale(3)=(RelativeTime=0.300000,Color=(B=255,G=128,R=128))
         ColorScale(4)=(RelativeTime=0.400000)
         ColorScale(5)=(RelativeTime=0.500000,Color=(G=255))
         ColorScale(6)=(RelativeTime=0.600000)
         ColorScale(7)=(RelativeTime=0.700000,Color=(B=255,G=255))
         ColorScale(8)=(RelativeTime=0.800000)
         ColorScale(9)=(RelativeTime=0.900000,Color=(B=255,G=128,R=255))
         ColorScale(10)=(RelativeTime=1.000000)
         MaxParticles=200
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.500000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         StartSizeRange=(X=(Min=5.000000,Max=20.000000),Y=(Min=5.000000,Max=20.000000),Z=(Min=5.000000,Max=20.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
     End Object
     Emitters(0)=SpriteEmitter'VecTech.SCFX_Trails_MultiColor.SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=40
         SizeScale(0)=(RelativeTime=1.000000,RelativeSize=5.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=25.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=15.000000
         Texture=Texture'XEffectMat.Ion.ion_ring'
         LifetimeRange=(Min=1.000000,Max=2.000000)
     End Object
     Emitters(1)=SpriteEmitter'VecTech.SCFX_Trails_MultiColor.SpriteEmitter4'

}
