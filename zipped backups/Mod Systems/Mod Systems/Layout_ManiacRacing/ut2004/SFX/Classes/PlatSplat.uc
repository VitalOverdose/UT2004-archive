//=============================================================================
//  PlatSplat.
//=============================================================================
class PlatSplat extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter1
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         DampRotation=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000))
         AutoResetTimeRange=(Min=3.000000,Max=3.000000)
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
         RotationDampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         Sounds(0)=(Sound=Sound'IntroSounds.fX.MetalHit1',Radius=(Min=1000.000000,Max=3000.000000),Pitch=(Min=1.000000,Max=1.000000),Weight=1,Volume=(Min=1.000000,Max=1.000000),Probability=(Min=0.100000,Max=1.000000))
         Sounds(1)=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion07',Radius=(Min=1000.000000,Max=3000.000000),Pitch=(Min=1.000000,Max=1.000000),Probability=(Max=0.200000))
         SpawningSound=PTSC_LinearGlobal
         SpawningSoundIndex=(Min=1.000000,Max=1.000000)
         SpawningSoundProbability=(Min=0.100000,Max=0.500000)
         CollisionSound=PTSC_LinearGlobal
         CollisionSoundIndex=(Min=2.000000,Max=2.000000)
         CollisionSoundProbability=(Max=0.500000)
         InitialParticlesPerSecond=500.000000
         LifetimeRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-200.000000,Max=200.000000),Y=(Min=-200.000000,Max=200.000000),Z=(Min=-200.000000,Max=200.000000))
         VelocityScale(1)=(RelativeTime=0.050000,RelativeVelocity=(X=60.000000,Y=60.000000,Z=60.000000))
         VelocityScale(2)=(RelativeTime=0.100000,RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
         VelocityScale(3)=(RelativeTime=0.500000,RelativeVelocity=(X=5.000000,Y=5.000000,Z=5.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.PlatSplat.MeshEmitter1'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter12
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
//         Texture=Texture'FatalsDest_Text.Bang.gratebits'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         VelocityScale(0)=(RelativeVelocity=(X=150.000000,Y=150.000000,Z=150.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=200.000000,Y=200.000000,Z=200.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=150.000000,Y=150.000000,Z=150.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.PlatSplat.SpriteEmitter12'

     bNoDelete=False
     bDirectional=True
}
