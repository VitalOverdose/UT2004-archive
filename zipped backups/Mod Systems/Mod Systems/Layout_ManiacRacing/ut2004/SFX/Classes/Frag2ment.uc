//=============================================================================
// Fragment.
//=============================================================================
class Frag2ment extends Emitter
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter19
         UseCollision=True
         RespawnDeadParticles=False
         SpinParticles=True
         DampRotation=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-900.000000)
         DampingFactorRange=(X=(Min=0.700000,Max=0.900000),Y=(Min=0.700000,Max=0.900000),Z=(Min=0.700000,Max=0.900000))
         SpinsPerSecondRange=(X=(Min=-0.200000,Max=0.500000),Y=(Min=-0.200000,Max=0.500000),Z=(Min=-0.200000,Max=0.500000))
         RotationDampingFactorRange=(X=(Min=0.600000,Max=0.900000),Y=(Min=0.600000,Max=0.900000),Z=(Min=0.600000,Max=0.900000))
         StartSizeRange=(X=(Max=5.000000),Y=(Max=5.000000),Z=(Max=5.000000))
         InitialParticlesPerSecond=500.000000
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=300.000000))
         VelocityScale(0)=(RelativeTime=0.050000,RelativeVelocity=(X=200.000000,Y=200.000000,Z=200.000000))
         VelocityScale(1)=(RelativeTime=0.500000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.Frag2ment.MeshEmitter19'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter55
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=187,G=255,R=255))
         ColorScale(1)=(RelativeTime=1.000000)
         MaxParticles=100
         AddLocationFromOtherEmitter=0
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.Frag2ment.SpriteEmitter55'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter56
         FadeOut=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         AddLocationFromOtherEmitter=0
         StartSizeRange=(X=(Max=200.000000),Y=(Max=200.000000),Z=(Max=200.000000))
         InitialParticlesPerSecond=20.000000
         Texture=Texture'EpicParticles.Smoke.StellarFog1aw'
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.Frag2ment.SpriteEmitter56'

     bNoDelete=False
     bDirectional=True
}
