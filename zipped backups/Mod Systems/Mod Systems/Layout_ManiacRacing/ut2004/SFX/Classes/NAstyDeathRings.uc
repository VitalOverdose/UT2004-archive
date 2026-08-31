//=============================================================================
// Fatals_NAstyDeathRings.
//=============================================================================
class  NAstyDeathRings extends SFX_Vertical
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter5
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=5000.000000)
         ColorScale(0)=(RelativeTime=0.200000,Color=(B=128,R=64))
         ColorScale(1)=(RelativeTime=0.300000,Color=(B=160))
         ColorScale(2)=(RelativeTime=0.400000,Color=(B=255))
         ColorScale(3)=(RelativeTime=0.500000,Color=(B=255,G=128,R=128))
         ColorScale(4)=(RelativeTime=0.600000,Color=(B=255,G=255))
         ColorScale(5)=(RelativeTime=0.700000,Color=(B=128,G=128))
         ColorScale(6)=(RelativeTime=0.800000,Color=(B=64,G=128))
         ColorScale(7)=(RelativeTime=0.900000,Color=(G=255))
         ColorScale(8)=(RelativeTime=1.000000,Color=(G=255,R=255))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=60.000000)
         SizeScale(2)=(RelativeTime=0.700000,RelativeSize=5.000000)
         SizeScale(3)=(RelativeTime=0.800000,RelativeSize=2.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffectMat.Ion.ion_ring'
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.NAstyDeathRings.SpriteEmitter5'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter8
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=128,G=255,R=255))
         ColorScale(1)=(Color=(G=255,R=128))
         ColorScale(2)=(Color=(G=128))
         ColorScale(3)=(Color=(B=128,G=128))
         ColorScale(4)=(Color=(B=255))
         ColorScale(5)=(Color=(B=255,G=255))
         ColorScale(6)=(Color=(B=255,G=128,R=128))
         MaxParticles=5
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=60.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=80.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffectMat.Ion.ion_ring'
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.NAstyDeathRings.SpriteEmitter8'

     bNoDelete=False
     bDirectional=True
}
