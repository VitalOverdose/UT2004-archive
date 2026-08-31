//=============================================================================
// BurningMan.
//=============================================================================
class BurningMan extends SFX_Trails
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         FadeOut=True
         FadeIn=True
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=75.000000)
         MaxParticles=50
         StartLocationRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-50.000000,Max=50.000000))
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=15.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=3.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.SpriteEmitter1'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter2
         FadeOut=True
         FadeIn=True
         UniformSize=True
         BlendBetweenSubdivisions=True
         Acceleration=(Z=75.000000)
         MaxParticles=20
         StartSizeRange=(X=(Min=50.000000))
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
     End Object
     Emitters(1)=SpriteEmitter'SFX.SpriteEmitter2'

}
