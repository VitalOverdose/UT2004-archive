//=============================================================================
// VitalTeleportDest By Vitaloverdose
// Custom destination point for VehicleTeleporter
// Place in map, rotate the arrow to set exit direction
// Set DestGroup to match the teleporter's DestinationTag for per-teleporter routing
//=============================================================================

class VOD_TeleportDest extends Actor
    placeable;


// ========================================================================================
// EDITOR-ONLY ALIGNMENT HELPER
// ========================================================================================

// If enabled, this destination actor snaps its yaw to the nearest 90-degree axis
// whenever its properties are changed in UnrealEd.
var() bool bRotationalSnap;

function Trigger(Actor Other, Pawn EventInstigator)
{
    local rotator NewRot;

    if (!bRotationalSnap)
        return;

    NewRot = Rotation;

    // Snap to nearest 45 degrees.
    NewRot.Yaw = ((NewRot.Yaw + 4096) / 8192) * 8192;

    NewRot.Pitch = 0;
    NewRot.Roll  = 0;

    SetRotation(NewRot);
}




defaultproperties
{
    bDirectional=true
    bStatic=true
    Tag='TP'

    Texture=Texture'Engine.S_Teleport'
    DrawScale=5
    bHidden=true
    bNoDelete=true
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
    bRotationalSnap=false
}
