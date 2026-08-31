//=============================================================================
// fanbreak.
//=============================================================================
class fanbreak extends SFX_Fragment
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter18
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=0.250000,Color=(B=255,G=255,R=128))
         ColorScale(2)=(RelativeTime=0.500000,Color=(B=255,G=128))
         ColorScale(3)=(RelativeTime=0.100000,Color=(B=191,R=191))
         ColorScaleRepeats=10.000000
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(0)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=20.000000)
         InitialParticlesPerSecond=40.000000
         Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(0)=SpriteEmitter'SFX.fanbreak.SpriteEmitter18'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter17
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         StartSizeRange=(X=(Min=50.000000),Y=(Min=50.000000),Z=(Min=50.000000))
         InitialParticlesPerSecond=50.000000
         Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=0.750000)
     End Object
     Emitters(1)=SpriteEmitter'SFX.fanbreak.SpriteEmitter17'

     Begin Object Class=MeshEmitter Name=MeshEmitter3
 //        StaticMesh=StaticMesh'FatalsDestructablesmesh.MiscDeco.FanBit'
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=500.000000)
         MaxParticles=1
         InitialParticlesPerSecond=100.000000
         LifetimeRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-25.000000,Max=25.000000),Y=(Min=-25.000000,Max=25.000000),Z=(Min=50.000000,Max=100.000000))
         VelocityScale(1)=(RelativeTime=0.100000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=10.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=2.000000,Y=2.000000,Z=2.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
     End Object
     Emitters(2)=MeshEmitter'SFX.fanbreak.MeshEmitter3'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter19
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         MaxParticles=50
         AddLocationFromOtherEmitter=2
         SizeScale(0)=(RelativeSize=2.000000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=4.000000)
         InitialParticlesPerSecond=30.000000
         Texture=Texture'XEffects.WispSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.500000,Max=1.000000)
     End Object
     Emitters(3)=SpriteEmitter'SFX.fanbreak.SpriteEmitter19'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter20
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         DampRotation=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         StartLocationRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000))
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         StartSizeRange=(X=(Min=20.000000,Max=50.000000),Y=(Min=20.000000,Max=50.000000),Z=(Min=20.000000,Max=50.000000))
         Texture=Texture'XEffects.Skins.ExplosionFlashTex'
         LifetimeRange=(Min=0.100000,Max=0.500000)
     End Object
     Emitters(4)=SpriteEmitter'SFX.fanbreak.SpriteEmitter20'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter21
         UseDirectionAs=PTDU_Normal
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=10.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=20.000000)
         InitialParticlesPerSecond=100.000000
 //        Texture=Texture'FatalsDest_Text.Bang.ban2ger'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.250000,Max=0.500000)
     End Object
     Emitters(5)=SpriteEmitter'SFX.fanbreak.SpriteEmitter21'

     Begin Object Class=MeshEmitter Name=MeshEmitter4
 //        StaticMesh=StaticMesh'FatalsDestructablesmesh.MiscDeco.FanExtra'
         RespawnDeadParticles=False
         SpinParticles=True
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         Acceleration=(Z=-100.000000)
         AddLocationFromOtherEmitter=2
         SpinsPerSecondRange=(X=(Min=-1.000000,Max=1.000000),Y=(Min=-1.000000,Max=1.000000),Z=(Min=-1.000000,Max=1.000000))
         InitialParticlesPerSecond=50.000000
         LifetimeRange=(Min=2.000000,Max=2.000000)
         InitialDelayRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Max=10.000000))
         VelocityScale(0)=(RelativeTime=0.100000,RelativeVelocity=(X=50.000000,Y=50.000000,Z=50.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
         VelocityScale(2)=(RelativeTime=0.500000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=30.000000))
         VelocityScale(3)=(RelativeTime=1.000000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=30.000000))
     End Object
     Emitters(6)=MeshEmitter'SFX.fanbreak.MeshEmitter4'

     Begin Object Class=MeshEmitter Name=MeshEmitter5
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         UseVelocityScale=True
         MaxParticles=5
         InitialParticlesPerSecond=10.000000
         InitialDelayRange=(Min=2.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000))
         VelocityScale(0)=(RelativeTime=0.100000,RelativeVelocity=(X=30.000000,Y=30.000000,Z=30.000000))
         VelocityScale(1)=(RelativeTime=0.200000,RelativeVelocity=(X=20.000000,Y=20.000000,Z=30.000000))
         VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(X=10.000000,Y=10.000000,Z=30.000000))
     End Object
     Emitters(7)=MeshEmitter'SFX.fanbreak.MeshEmitter5'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter23
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         MaxParticles=30
         AddLocationFromOtherEmitter=7
         InitialParticlesPerSecond=50.000000
         Texture=Texture'XEffects.EmitSmoke_t'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=0.100000,Max=0.500000)
         InitialDelayRange=(Min=2.000000,Max=2.000000)
     End Object
     Emitters(8)=SpriteEmitter'SFX.fanbreak.SpriteEmitter23'

}
