//=============================================================================
// 2PipePop.
//=============================================================================
class Pipe2Pop extends SFX_Fragment
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=-500.000000)
         ColorScale(0)=(Color=(B=255,G=206,R=255))
         ColorScale(1)=(RelativeTime=0.200000,Color=(B=255,G=128,R=255))
         ColorScale(2)=(RelativeTime=0.400000,Color=(B=128,R=255))
         ColorScale(3)=(RelativeTime=0.100000,Color=(B=128,R=128))
         StartLocationRange=(Z=(Min=512.000000,Max=512.000000))
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
         InitialParticlesPerSecond=40.000000
 //        Texture=Texture'FatalsDest_Text.Bang.AirBlast3'
         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(Z=(Min=-500.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Pipe2Pop.SpriteEmitter6'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=500.000000)
         ColorScale(0)=(Color=(B=255,G=128,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=128,R=255))
         ColorScale(2)=(RelativeTime=0.100000,Color=(B=128,R=128))
         StartLocationRange=(Z=(Min=500.000000,Max=500.000000))
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
         InitialParticlesPerSecond=40.000000

         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(Z=(Max=500.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.Pipe2Pop.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter8
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         StartLocationRange=(Z=(Max=1024.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         SizeScaleRepeats=3.000000
         StartSizeRange=(X=(Min=20.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=2.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.pipe2Pop.SpriteEmitter8'

}
