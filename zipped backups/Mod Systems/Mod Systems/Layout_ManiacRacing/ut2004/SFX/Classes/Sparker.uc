//=============================================================================
// FataFX_Sparker.
//=============================================================================
class  Sparker extends SFX_Explosions
placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter41
         UseColorScale=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         UseVelocityScale=True
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.100000,Color=(B=255,G=255,R=255))
         ColorScale(2)=(RelativeTime=0.110000)
         ColorScale(3)=(RelativeTime=0.500000)
         ColorScale(4)=(RelativeTime=0.510000,Color=(B=255,G=255,R=255))
         ColorScale(5)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255))
         ColorScaleRepeats=30.000000
         MaxParticles=20
         SpinsPerSecondRange=(X=(Min=-2.000000,Max=2.000000),Y=(Min=-2.000000,Max=2.000000),Z=(Min=-2.000000,Max=2.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=1.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=30.000000,Max=50.000000),Y=(Min=30.000000,Max=50.000000),Z=(Min=30.000000,Max=50.000000))
         InitialParticlesPerSecond=500.000000
         Texture=None
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=1.000000,Max=1.000000)
         StartVelocityRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-100.000000,Max=100.000000))
         VelocityScale(1)=(RelativeTime=0.060000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
         VelocityScale(2)=(RelativeTime=0.200000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.Sparker.SpriteEmitter41'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter42
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(1)=(RelativeTime=0.500000)
         ColorScale(2)=(RelativeTime=0.510000,Color=(B=255,G=255,R=255))
         ColorScale(3)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255))
         ColorScaleRepeats=5.000000
         Opacity=2.000000
         MaxParticles=100
         AddLocationFromOtherEmitter=0
         SizeScale(0)=(RelativeSize=1.000000)
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=2.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.500000)
         StartSizeRange=(X=(Min=0.000000,Max=25.000000),Y=(Min=10.000000,Max=25.000000),Z=(Min=10.000000,Max=25.000000))
         InitialParticlesPerSecond=50.000000
         Texture=None
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.500000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.Sparker.SpriteEmitter42'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter43
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         BlendBetweenSubdivisions=True
         ColorScale(0)=(Color=(B=255,G=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(B=255,G=255,R=128))
         ColorScale(2)=(RelativeTime=0.510000)
         ColorScaleRepeats=5.000000
         MaxParticles=20
         StartLocationRange=(X=(Min=-20.000000,Max=20.000000),Y=(Min=-20.000000,Max=20.000000),Z=(Min=-20.000000,Max=20.000000))
         SpinsPerSecondRange=(X=(Min=-6.000000,Max=6.000000),Y=(Min=-6.000000,Max=6.000000),Z=(Min=-6.000000,Max=6.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=5.000000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=1.000000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=0.100000)
         StartSizeRange=(X=(Min=10.000000),Y=(Min=10.000000),Z=(Min=10.000000))
         Texture=None
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=0.500000,Max=0.200000)
     End Object
     Emitters(2)=SpriteEmitter'SFX.Sparker.SpriteEmitter43'

     bNoDelete=False
     bDirectional=True
}
