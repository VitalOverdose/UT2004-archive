//=============================================================================
// Blastoff.
//=============================================================================
class Blastoff extends SFX_Space
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter1
         StaticMesh=StaticMesh'Mr.TimedController.ControlSpawnerDisc'
         UseParticleColor=True
         UseColorScale=True
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         ColorScale(0)=(RelativeTime=0.100000,Color=(G=255,R=255))
         ColorScale(1)=(RelativeTime=0.500000,Color=(G=128,R=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(R=255))
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
         SizeScaleRepeats=30.000000
         StartSizeRange=(X=(Min=0.500000,Max=0.500000),Y=(Min=0.500000,Max=0.500000),Z=(Min=0.900000,Max=0.900000))
         LifetimeRange=(Min=0.500000,Max=1.000000)
         StartVelocityRange=(Z=(Min=25.000000,Max=25.000000))
     End Object
     Emitters(0)=MeshEmitter'SFX.MeshEmitter1'

}
