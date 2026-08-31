//=============================================================================
// VitalTeleportDest By Vitaloverdose
// Custom destination point for VehicleTeleporter
// Place in map, rotate the arrow to set exit direction
// Set DestGroup to match the teleporter's DestinationTag for per-teleporter routing
//=============================================================================

class VitalTeleportDest extends Actor
    placeable;

var() Name DestGroup;

function PostBeginPlay()
{
    if ( DestGroup != '' )
    {
        Tag = DestGroup;
    }
}

defaultproperties
{
    bDirectional=true
    bStatic=true
    Tag='TP'
    DestGroup='TP'
    Texture=Texture'Engine.S_Teleport'
    DrawScale=0.5
    bHidden=true
    bNoDelete=true
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
}
