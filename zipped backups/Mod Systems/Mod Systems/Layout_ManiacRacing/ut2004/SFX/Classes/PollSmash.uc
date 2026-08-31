//=============================================================================
//  PollSmash.
//=============================================================================
class  PollSmash extends SFX_Fragment
placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter3
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-500.000000)
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         MaxParticles=3
         StartLocationRange=(Z=(Min=-512.000000,Max=512.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000),Z=(Min=-0.200000,Max=0.200000))
         InitialParticlesPerSecond=50.000000
         LifetimeRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-20.000000,Max=20.000000))
         VelocityScale(0)=(RelativeVelocity=(X=0.100000,Y=0.100000,Z=0.100000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=40.000000,Y=40.000000,Z=40.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.PollSmash.MeshEmitter3'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter20
         FadeOut=True
         UseActorForces=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=5
         StartLocationRange=(Z=(Min=-512.000000,Max=512.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=100.000000
         Texture=Texture'XEffects.EmitLightSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-10.000000,Max=10.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.PollSmash.SpriteEmitter20'

     Begin Object Class=MeshEmitter Name=MeshEmitter4
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-800.000000)
         DampingFactorRange=(X=(Min=0.300000,Max=0.900000),Y=(Min=0.300000,Max=0.900000),Z=(Min=0.300000,Max=0.900000))
         MaxParticles=5
         StartLocationRange=(Z=(Min=-512.000000,Max=512.000000))
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000),Y=(Min=-0.500000,Max=0.500000),Z=(Min=-0.200000,Max=0.200000))
         StartSizeRange=(X=(Max=0.100000),Y=(Max=0.100000),Z=(Max=0.100000))
         InitialParticlesPerSecond=50.000000
         LifetimeRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-5.000000,Max=5.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=20.000000))
         VelocityScale(2)=(RelativeTime=0.300000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(3)=(RelativeTime=0.700000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
         VelocityScale(4)=(RelativeTime=1.000000,RelativeVelocity=(X=0.500000,Y=0.500000,Z=0.500000))
     End Object
     Emitters(2)=MeshEmitter'SFX.PollSmash.MeshEmitter4'

     bNoDelete=False
     bDirectional=True
}
