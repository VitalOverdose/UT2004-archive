//=============================================================================
// VerticalGrateSmash.
//=============================================================================
class VerticalGrateSmash extends SFX_Fragment
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter8
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         StartLocationRange=(X=(Min=512.000000,Max=512.000000),Y=(Min=-512.000000,Max=512.000000),Z=(Max=100.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=20.000000)
         StartSizeRange=(X=(Min=5.000000),Y=(Min=5.000000),Z=(Min=5.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'WarEffectsTextures.Particles.gas2'
         TextureUSubdivisions=3
         TextureVSubdivisions=3
         LifetimeRange=(Min=1.000000,Max=2.000000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.VerticalGrateSmash.SpriteEmitter8'

     Begin Object Class=MeshEmitter Name=MeshEmitter5
//        StaticMesh=StaticMesh'FatalsDestructablesmesh.chunks.platchunklong'
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         DampRotation=True
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         StartLocationRange=(Z=(Min=-500.000000,Max=500.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000),Z=(Min=-0.500000,Max=0.500000))
         StartSpinRange=(Y=(Min=0.500000,Max=1.000000))
         RotationDampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.900000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=0.250000),Y=(Min=0.250000),Z=(Min=0.250000))
         InitialParticlesPerSecond=100.000000
         LifetimeRange=(Min=2.000000,Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         VelocityScale(0)=(RelativeVelocity=(X=100.000000,Y=100.000000,Z=100.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=200.000000,Y=200.000000,Z=200.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=100.000000,Y=100.000000,Z=100.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=25.000000,Y=25.000000,Z=25.000000))
     End Object
     Emitters(1)=MeshEmitter'SFX.VerticalGrateSmash.MeshEmitter5'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         UseCollision=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         StartLocationRange=(Y=(Min=-150.000000,Max=150.000000),Z=(Min=-500.000000,Max=500.000000))
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.900000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=100.000000
         DrawStyle=PTDS_Regular
         Texture=Texture'VMParticleTextures.VehicleExplosions.GENERICshrapnelTEX'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         VelocityScale(0)=(RelativeVelocity=(X=150.000000,Y=150.000000,Z=150.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=200.000000,Y=200.000000,Z=200.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=150.000000,Y=150.000000,Z=150.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
     End Object
     Emitters(2)=SpriteEmitter'SFX.VerticalGrateSmash.SpriteEmitter6'

}
