//=============================================================================
// Super_Nova...By fatalaoverdose.
//=============================================================================
class Super_Nova extends Emitter
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         FadeOut=True
         FadeIn=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         MaxParticles=150
         StartLocationRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-10.000000,Max=10.000000))
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=25.000000,Max=50.000000))
         Texture=Texture'AW-2004Explosions.Fire.Part_explode'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=25.000000,Max=30.000000)
         StartVelocityRange=(X=(Min=-15.000000,Max=15.000000),Y=(Min=-15.000000,Max=15.000000),Z=(Min=-15.000000,Max=15.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.SpriteEmitter1'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter2
         UseColorScale=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         ColorScale(0)=(Color=(G=255,R=255))
         ColorScale(1)=(RelativeTime=0.300000,Color=(G=128,R=255))
         ColorScale(2)=(RelativeTime=0.600000,Color=(R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(R=128))
         SpinsPerSecondRange=(X=(Min=-0.100000,Max=0.100000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=7.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.100000)
         Texture=Texture'EpicParticles.Flares.Sharpstreaks2'
         LifetimeRange=(Min=60.000000,Max=120.000000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.SpriteEmitter2'

}
