//=============================================================================
// FD_FX_StarBurstBlue.
//=============================================================================
class SCFX_Trails_StarBurstBlue extends FD_FX
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=50
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=3.000000)
         StartSizeRange=(X=(Min=10.000000,Max=25.000000))
         InitialParticlesPerSecond=200.000000
         Texture=Texture'XEffects.BlueMarker_t'
         LifetimeRange=(Min=0.500000,Max=0.500000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         RotateVelocityLossRange=True
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=75.000000,Y=75.000000,Z=75.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=0.100000,Y=0.100000,Z=0.100000))
     End Object
     Emitters(0)=SpriteEmitter'VecTech.SCFX_Trails_StarBurstBlue.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter8
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=5
         StartSpinRange=(X=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=10.000000,Max=25.000000))
         Texture=Texture'XEffects.LightningChargeT'
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.250000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'VecTech.SCFX_Trails_StarBurstBlue.SpriteEmitter8'

}
