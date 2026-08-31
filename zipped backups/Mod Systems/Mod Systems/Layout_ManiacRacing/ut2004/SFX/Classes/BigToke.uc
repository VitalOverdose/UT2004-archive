//=============================================================================
// BigToke.
//=============================================================================
class BigToke extends SFX_Smoke
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter3
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=100.000000)
         MaxParticles=100
         StartLocationRange=(X=(Min=-750.000000,Max=750.000000),Y=(Min=-750.000000,Max=750.000000),Z=(Max=1000.000000))
         SizeScale(0)=(RelativeSize=0.100000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=5.000000)
         InitialParticlesPerSecond=10.000000
         Texture=Texture'EpicParticles.Smoke.StellarFog1aw'
         LifetimeRange=(Max=6.000000)
         StartVelocityRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Max=100.000000))
     End Object
     Emitters(0)=SpriteEmitter'SFX.BigToke.SpriteEmitter3'

     bNoDelete=False
     bDirectional=True
}
