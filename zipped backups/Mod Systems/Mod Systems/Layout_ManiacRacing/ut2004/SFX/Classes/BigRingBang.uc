//=============================================================================
// BigRingBang.
//=============================================================================
class BigRingBang extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter6
//         StaticMesh=StaticMesh'FatalsDestructablesmesh.tech.Comp1Break'
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(X=200.000000)
         StartLocationRange=(Y=(Min=-6000.000000,Max=6000.000000),Z=(Min=-1000.000000,Max=1000.000000))
         SpinsPerSecondRange=(X=(Min=-0.200000,Max=0.200000),Y=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.750000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.010000)
         InitialParticlesPerSecond=500.000000
         LifetimeRange=(Max=6.000000)
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=-400.000000,Max=400.000000))
         VelocityScale(0)=(RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=80.000000,Y=80.000000,Z=80.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.BigRingBang.MeshEmitter6'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=50
         AddLocationFromOtherEmitter=0
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.700000,RelativeSize=7.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=10.000000)
         StartSizeRange=(X=(Min=5.000000,Max=20.000000),Y=(Min=5.000000,Max=20.000000),Z=(Min=5.000000,Max=20.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.Skins.MuzFlashA_t'
         LifetimeRange=(Min=0.100000,Max=0.500000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter4'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter37
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=30
         AddLocationFromOtherEmitter=0
         SpinsPerSecondRange=(X=(Min=-0.200000,Max=0.200000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.300000,RelativeSize=7.000000)
         SizeScale(3)=(RelativeTime=0.700000,RelativeSize=10.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Max=6.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter37'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter32
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(X=200.000000)
         MaxParticles=5
         StartLocationRange=(Y=(Min=-7000.000000,Max=7000.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=30.000000)
         SizeScale(2)=(RelativeTime=0.200000,RelativeSize=20.000000)
         SizeScale(3)=(RelativeTime=0.300000,RelativeSize=10.000000)
         SizeScale(4)=(RelativeTime=1.000000,RelativeSize=0.200000)
         InitialParticlesPerSecond=10.000000
         Texture=Texture'XEffects.Skins.MuzFlashFlak_t'
         LifetimeRange=(Min=0.200000,Max=0.200000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter32'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter33
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         Acceleration=(X=200.000000)
         MaxParticles=5
         StartLocationRange=(Y=(Min=-7000.000000,Max=7000.000000))
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=30.000000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=20.000000)
         SizeScale(2)=(RelativeTime=0.300000,RelativeSize=10.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         InitialParticlesPerSecond=3.000000
         Texture=Texture'XEffects.Skins.MuzFlashRocket_t'
         LifetimeRange=(Min=0.200000,Max=0.200000)
     End Object
     Emitters(4)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter33'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter34
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         Acceleration=(X=200.000000)
         MaxParticles=5
         StartLocationRange=(Y=(Min=-7000.000000,Max=7000.000000))
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=40.000000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=32.000000)
         SizeScale(2)=(RelativeTime=0.300000,RelativeSize=20.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         Texture=None
         LifetimeRange=(Min=0.500000,Max=0.500000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter34'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter47
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(X=100.000000)
         StartLocationRange=(Y=(Min=-7000.000000,Max=7000.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.110000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=15.000000)
         InitialParticlesPerSecond=500.000000
         Texture=Texture'EpicParticles.Smoke.Smokepuff2'
         LifetimeRange=(Min=2.000000)
     End Object
     Emitters(6)=SpriteEmitter'SFX.BigRingBang.SpriteEmitter47'

}
