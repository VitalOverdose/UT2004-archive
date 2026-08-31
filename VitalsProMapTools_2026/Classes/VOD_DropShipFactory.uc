//=============================================================================
// darkhoverSpawner.
//=============================================================================
class VOD_DropShipFactory extends ONSHoverCraftFactory
placeable;

var bool  bscanning;


simulated function postbeginplay()
{

settimer(0.25,true);
}

simulated function timer()
{


super.timer();
}

function SpawnVehicle()
{
    Super.SpawnVehicle();

    if (LastSpawned != None)
    {
      LastSpawned.KSetActorGravScale(3.0);
    }
}


simulated function AttachSpawnedcraft(actor SpawnedCRaft)
{



}


defaultproperties
{
 	VehicleClass=Class'VitalsProMapTools.VOD_VehicleDropShip'
	Mesh=SkeletalMesh'VitalsProMapTools_an.Dropship_2026'
	Skins(0)=Texture'VitalsProMapTools_tx.VehicleSkins.Dropship2026_Skin'
}
