//=============================================================================
//  meltdown.
//=============================================================================
class Meltdown extends SFX_Explosions
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=30.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.000000)
         InitialParticlesPerSecond=10.000000
         Texture=Texture'XEffects.Skins.ExplosionFlashTex'
     End Object
     Emitters(0)=SpriteEmitter'SFX.Meltdown.SpriteEmitter6'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter5
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=500.000000)
         MaxParticles=40
         StartLocationRange=(X=(Min=-512.000000,Max=512.000000),Y=(Min=-512.000000,Max=512.000000))
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=5.000000)
         StartSizeRange=(X=(Max=200.000000),Y=(Max=200.000000),Z=(Max=200.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'EpicParticles.Smoke.StellarFog1aw'
         LifetimeRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=1.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(1)=SpriteEmitter'SFX.Meltdown.SpriteEmitter5'

}
