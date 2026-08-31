//=============================================================================
// CompSmash.
//=============================================================================
class CompSmash extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=5
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-512.000000,Max=512.000000))
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=20.000000
         Texture=Texture'XEffects.Skins.MuzFlashA_t'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.CompSmash.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter14
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=5
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=10.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=5.000000
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=20.000000
         Texture=Texture'XEffects.Skins.MuzFlashFlak_t'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.CompSmash.SpriteEmitter14'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter15
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         MaxParticles=5
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-512.000000,Max=512.000000))
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=5.000000
         Texture=Texture'XEffects.Skins.ExplosionFlashTex'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.CompSmash.SpriteEmitter15'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter17
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=50.000000)
         EffectAxis=PTEA_PositiveZ
         AddLocationFromOtherEmitter=2
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=25.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         StartVelocityRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Max=250.000000))
     End Object
     Emitters(3)=SpriteEmitter'SFX.CompSmash.SpriteEmitter17'

     Begin Object Class=MeshEmitter Name=MeshEmitter6
 //        StaticMesh=StaticMesh'FatalsDestructablesmesh.chunks.complexchunk'
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         MaxParticles=3
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-0.500000,Max=0.500000))
         InitialParticlesPerSecond=20.000000
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=200.000000,Y=200.000000,Z=200.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=150.000000,Y=150.000000,Z=150.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
     End Object
     Emitters(4)=MeshEmitter'SFX.CompSmash.MeshEmitter6'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter18
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=20
         AddLocationFromOtherEmitter=4
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=10.000000)
         InitialParticlesPerSecond=20.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.CompSmash.SpriteEmitter18'

}
