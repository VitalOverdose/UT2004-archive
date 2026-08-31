//=============================================================================
//  SparkerTunnel.
//=============================================================================
class  SparkerTunnel extends SFX_Vertical
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter41
         UseDirectionAs=PTDU_Up
         UseColorScale=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=-800.000000)
         ColorScale(0)=(Color=(G=192,R=255))
         ColorScale(1)=(RelativeTime=1.000000)
         MaxParticles=50
         DetailMode=DM_High
         StartLocationOffset=(Z=100.000000)
         StartLocationShape=PTLS_Sphere
         SphereRadiusRange=(Min=10.000000,Max=10.000000)
         UseRotationFrom=PTRS_Actor
         SizeScale(1)=(RelativeTime=0.400000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=8.000000,Max=12.000000))
         InitialParticlesPerSecond=300.000000
         Texture=Texture'AW-2004Particles.Energy.SparkHead'
         LifetimeRange=(Min=0.700000,Max=0.700000)
         StartVelocityRange=(X=(Min=-300.000000,Max=300.000000),Y=(Min=-300.000000,Max=300.000000))
         StartVelocityRadialRange=(Min=-300.000000,Max=-500.000000)
         GetVelocityDirectionFrom=PTVD_AddRadial
     End Object
     Emitters(0)=SpriteEmitter'SFX.SparkerTunnel.SpriteEmitter41'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter42
         UseColorScale=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.700000,Color=(B=255,G=255,R=255))
         ColorScale(2)=(RelativeTime=1.000000)
         Opacity=0.800000
         MaxParticles=5
         DetailMode=DM_High
         AddLocationFromOtherEmitter=8
         StartSpinRange=(X=(Max=1.000000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=0.500000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=0.700000)
         StartSizeRange=(X=(Min=60.000000,Max=80.000000))
         InitialParticlesPerSecond=12.000000
         Texture=Texture'ExplosionTex.Framed.exp1_frames'
         TextureUSubdivisions=2
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.400000,Max=0.500000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.SparkerTunnel.SpriteEmitter42'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter43
         UseDirectionAs=PTDU_Normal
         ProjectionNormal=(X=1.000000,Z=0.000000)
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(X=-2000.000000)
         ColorScale(0)=(Color=(B=255,G=98,R=98))
         ColorScale(1)=(RelativeTime=0.100000,Color=(B=255,G=177,R=100))
         ColorScale(2)=(RelativeTime=0.500000,Color=(B=240,R=240))
         ColorScale(3)=(RelativeTime=0.700000,Color=(B=177,G=100,R=240))
         ColorScale(4)=(RelativeTime=0.100000,Color=(R=255))
         MaxParticles=20
         SpinsPerSecondRange=(X=(Min=-0.500000,Max=0.500000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=20.000000)
         SizeScale(2)=(RelativeTime=0.200000,RelativeSize=10.000000)
         SizeScale(3)=(RelativeTime=0.250000,RelativeSize=10.000000)
         SizeScale(4)=(RelativeTime=0.300000,RelativeSize=25.000000)
         SizeScale(5)=(RelativeTime=0.350000,RelativeSize=0.300000)
         SizeScale(6)=(RelativeTime=0.400000,RelativeSize=20.000000)
         SizeScale(7)=(RelativeTime=0.500000,RelativeSize=10.000000)
         SizeScale(8)=(RelativeTime=0.550000,RelativeSize=10.000000)
         SizeScale(9)=(RelativeTime=0.600000,RelativeSize=20.000000)
         SizeScale(10)=(RelativeTime=0.700000,RelativeSize=15.000000)
         SizeScale(11)=(RelativeTime=0.800000,RelativeSize=15.000000)
         SizeScale(12)=(RelativeTime=1.000000,RelativeSize=10.000000)
         InitialParticlesPerSecond=10.000000
 //        Texture=Texture'FatalsDest_Text.Bang.AirBlast3'
     End Object
     Emitters(2)=SpriteEmitter'SFX.SparkerTunnel.SpriteEmitter43'

}
