//=============================================================================
//  LightPop.
//=============================================================================
class  LightsPOP extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter373
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-100.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=6.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=7.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=25.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=2.000000)
     End Object
 //    Emitters(0)=SpriteEmitter'SFX.SFX.SpriteEmitter373'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter374
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         MaxParticles=3
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
//    Emitters(1)=SpriteEmitter'SFX.SFX.SpriteEmitter374'

}
