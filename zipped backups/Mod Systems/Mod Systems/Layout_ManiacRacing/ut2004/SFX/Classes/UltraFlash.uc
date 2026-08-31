//=============================================================================
// Fatal_UltraFlash.
//=============================================================================
class UltraFlash extends SFX_Explosions
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter15
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         StartLocationRange=(X=(Min=-500.000000,Max=500.000000),Y=(Min=-500.000000,Max=500.000000),Z=(Min=-250.000000,Max=250.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=0.100000)
         SizeScale(2)=(RelativeTime=0.200000,RelativeSize=30.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Max=200.000000),Y=(Max=200.000000),Z=(Max=200.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.Skins.ExplosionFlashTex'
         LifetimeRange=(Min=0.500000,Max=0.250000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.UltraFlash.SpriteEmitter15'

}
