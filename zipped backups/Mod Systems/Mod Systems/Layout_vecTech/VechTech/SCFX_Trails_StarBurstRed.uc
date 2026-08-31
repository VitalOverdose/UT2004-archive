//=============================================================================
// FD_FX_StarBurstRed.
//=============================================================================
class SCFX_Trails_StarBurstRed extends FD_FX
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter4
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=50
         SizeScale(0)=(RelativeTime=0.100000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=3.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000),Y=(Min=10.000000,Max=10.000000),Z=(Min=10.000000,Max=10.000000))
         InitialParticlesPerSecond=1000.000000
         Texture=Texture'XEffects.RedMarker_t'
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Z=(Min=-25.000000,Max=25.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=0.100000,Y=0.100000,Z=0.100000))
     End Object
     Emitters(0)=SpriteEmitter'VecTech.SCFX_Trails_StarBurstRed.SpriteEmitter4'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter6
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=5
         StartSpinRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         SizeScaleRepeats=10.000000
         StartSizeRange=(X=(Min=25.000000,Max=25.000000))
         InitialParticlesPerSecond=20.000000
         Texture=Texture'XEffects.Skins.MuzFlashA_t'
         LifetimeRange=(Min=0.100000,Max=0.300000)
     End Object
     Emitters(1)=SpriteEmitter'VecTech.SCFX_Trails_StarBurstRed.SpriteEmitter6'

}
