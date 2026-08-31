//-----------------------------------------------------------
//
//-----------------------------------------------------------
class WeaponsMag extends trigger
Placeable;

var() bool                           BUseFX;
var() Class<emitter>                 FD_ambiGroundFX;


function POSTBEGINPLAY()
{
local EMITTER TheMonster;
TheMonster=Spawn(FD_ambiGroundFX, Owner,,Location);
}

function  TOUCH(Actor Other)
{
local EMITTER TheMonster;
Other.setdrawscale(4);
setcollisionsize(other.default.collisionradius *4 ,other.default.collisionheight *4);
TheMonster=Spawn(FD_ambiGroundFX, Owner,,Location);
TheMonster.SetOwner(other);
log("other was..."$other) ;
}

defaultproperties
{
     BUseFX=True
     TriggerType=TT_AnyProximity
     DamageThreshold=1.000000
     CollisionRadius=100.000000
     CollisionHeight=150.000000
}
