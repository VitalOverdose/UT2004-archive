//=============================================================================
// BetterFiretrail.
//=============================================================================
class BetterFiretrail extends SFX_Trails
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter2
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=100
         StartLocationRange=(X=(Min=-64.000000,Max=64.000000),Y=(Min=-128.000000,Max=128.000000))
         StartSpinRange=(X=(Min=0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=10.000000,Max=30.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'SFX.ddf.fire3'
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=25.000000,Max=50.000000))
     End Object
     Emitters(0)=SpriteEmitter'sfx.SpriteEmitter2'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter3
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=100
         StartLocationRange=(X=(Min=-64.000000,Max=64.000000),Y=(Min=-128.000000,Max=128.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'SFX.ddf.Fire2'
         LifetimeRange=(Min=0.500000,Max=2.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=25.000000,Max=50.000000))
     End Object
     Emitters(1)=SpriteEmitter'sfx.SpriteEmitter3'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         RespawnDeadParticles=False
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=100
         StartLocationRange=(X=(Min=-64.000000,Max=64.000000),Y=(Min=-64.000000,Max=64.000000))
         StartSpinRange=(X=(Min=0.500000,Max=0.500000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=50.000000))
         InitialParticlesPerSecond=10.000000
         Texture=Texture'SFX.ddf.A00'
         LifetimeRange=(Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=10.000000,Max=25.000000))
     End Object
     Emitters(2)=SpriteEmitter'sfx.SpriteEmitter6'

}
