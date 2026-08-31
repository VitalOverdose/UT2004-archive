//-----------------------------------------------------------
//
//-----------------------------------------------------------
class Spider_Core_MeshUtils extends StaticMeshActor;

function Reset()
{
super.Reset();
bHidden = false;
SetCollision(true, true, true);
}

function SpawnFX(class<emitter> FX,Optional actor SpawnPos, Optional vector ReletiveVecPos,Optional Actor HardAttachTo,Optional sound SpawnSound)
{
local Emitter SpawnedSFX;

if (FX != None)
   {
   if (SpawnPos != None)            SpawnedSFX = Spawn( FX,Self,,SpawnPos.Location ,SpawnPos.Rotation );
   else
   if (ReletiveVecPos != vect(0,0,0) )  SpawnedSFX = Spawn( FX,Self,,Location + ReletiveVecPos ,Rotation );
   else
   SpawnedSFX = Spawn( FX ,Self,,Location,Rotation );
   }

if (hardAttachTo != None) SpawnedSFX.SetBase( hardAttachTo );

if (SpawnSound!=None) Playsound(SpawnSound);
}

defaultproperties
{
}
