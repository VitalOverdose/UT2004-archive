//=============================================================================
//  MultiColorBooster.
//=============================================================================
class  MultiColorBooster extends SFX_Trails
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter83
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=5
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         InitialParticlesPerSecond=7.000000
 //        Texture=Texture'SC_Text.Bang.spectrum'
         LifetimeRange=(Min=0.500000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.MultiColorBooster.SpriteEmitter83'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter84
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=7.000000)
         StartSizeRange=(X=(Min=25.000000,Max=25.000000),Y=(Min=25.000000,Max=25.000000),Z=(Min=25.000000,Max=25.000000))
         InitialParticlesPerSecond=15.000000
 //        Texture=Texture'SC_Text.Bang.rainbow_Anim'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=1.000000,Max=1.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.MultiColorBooster.SpriteEmitter84'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter85
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=4.000000)
         StartSizeRange=(X=(Min=50.000000,Max=50.000000),Y=(Min=50.000000,Max=50.000000))
         InitialParticlesPerSecond=20.000000
 //        Texture=Texture'SC_Text.Bang.ban2ger'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=0.500000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.MultiColorBooster.SpriteEmitter85'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter86
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=4
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.600000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=3.000000)
         InitialParticlesPerSecond=20.000000
         Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
         LifetimeRange=(Min=0.500000,Max=0.500000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.MultiColorBooster.SpriteEmitter86'

}
