//=============================================================================
// SmallRadiusBlast.
//=============================================================================
class SmallRadiusBlast extends SFX_Explosions
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter3
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         MaxParticles=3
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=0.200000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=15.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         Texture=Texture'AW-2004Particles.Energy.AirBlast'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'sfx.SpriteEmitter3'

}
