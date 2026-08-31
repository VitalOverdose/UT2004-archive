//=============================================================================
//  SmallFlashLightWhite.
//=============================================================================
class  SmallFlashLightWhite extends SFX_Explosions
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter15
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255))
         MaxParticles=3
         StartLocationRange=(Z=(Min=10.000000,Max=10.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=7.000000)
         InitialParticlesPerSecond=10.000000
         Texture=Texture'AW-2004Particles.Energy.PurpleSwell'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.SmallFlashLightWhite.SpriteEmitter15'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         RespawnDeadParticles=False
         AutoReset=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=3
         AutoResetTimeRange=(Min=5.000000,Max=5.000000)
         StartLocationRange=(Z=(Min=10.000000,Max=10.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=15.000000)
         InitialParticlesPerSecond=30.000000
         Texture=Texture'AW-2004Particles.Energy.SmoothRing'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.SmallFlashLightWhite.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter14
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=3
         StartLocationRange=(Z=(Min=10.000000,Max=10.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=7.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.SmallFlashLightWhite.SpriteEmitter14'

}
