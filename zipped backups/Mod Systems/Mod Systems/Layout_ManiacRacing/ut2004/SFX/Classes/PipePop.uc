//=============================================================================
// FFX_PipePop.
//=============================================================================
class PipePop extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter77
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=3
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=250.000000,Max=750.000000))
         SizeScale(1)=(RelativeTime=0.050000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=4.000000,RelativeSize=0.100000)
         SizeScale(3)=(RelativeTime=0.500000,RelativeSize=2.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=500.000000
         Texture=Texture'XEffectMat.Shock.shock_flare_a'
         LifetimeRange=(Min=0.100000,Max=0.250000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.PipePop.SpriteEmitter77'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter72
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=3
         StartLocationRange=(Z=(Min=250.000000,Max=750.000000))
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.050000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=7.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffectMat.Shock.shock_flare_a'
         LifetimeRange=(Min=0.100000,Max=0.250000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.PipePop.SpriteEmitter72'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter73
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=3
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=250.000000,Max=750.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         InitialParticlesPerSecond=500.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=2.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.PipePop.SpriteEmitter73'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter74
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=3
         StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=250.000000,Max=750.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.500000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.PipePop.SpriteEmitter74'

     Begin Object Class=MeshEmitter Name=MeshEmitter13
 //        StaticMesh=StaticMesh'FatalsDestructablesmesh.usx.chunks.ringchunkSmaller2'
         UseCollision=True
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         MaxParticles=5
         StartLocationRange=(Z=(Min=250.000000,Max=750.000000))
         StartSizeRange=(X=(Min=0.400000,Max=0.400000),Y=(Min=0.400000,Max=0.400000),Z=(Min=0.400000,Max=0.400000))
         InitialParticlesPerSecond=100.000000
         LifetimeRange=(Min=0.500000,Max=2.000000)
         StartVelocityRange=(X=(Min=-250.000000,Max=250.000000),Y=(Min=-250.000000,Max=250.000000),Z=(Min=-250.000000,Max=250.000000))
         VelocityScale(1)=(RelativeTime=0.050000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
         VelocityScale(2)=(RelativeTime=0.100000,RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
     End Object
     Emitters(4)=MeshEmitter'SFX.PipePop.MeshEmitter13'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter75
         RespawnDeadParticles=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=15
         StartLocationRange=(Z=(Min=250.000000,Max=750.000000))
         AddLocationFromOtherEmitter=4
         Texture=Texture'ExplosionTex.Framed.we1_frames'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.PipePop.SpriteEmitter75'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter76
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=25
         StartLocationRange=(Z=(Min=250.000000,Max=750.000000))
         AddLocationFromOtherEmitter=4
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         InitialParticlesPerSecond=50.000000
         Texture=Texture'ExplosionTex.Framed.we1_frames'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(6)=SpriteEmitter'SFX.PipePop.SpriteEmitter76'

}
