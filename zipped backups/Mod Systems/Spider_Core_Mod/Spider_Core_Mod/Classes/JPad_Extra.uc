//-----------------------------------------------------------
//
//-----------------------------------------------------------
class JPad_Extra extends UTJumpPad
Placeable;

var() bool                           BUseFX;
var() sound                          FD_VOC_Boost;
var() Class<emitter>                 FD_Booster_TrailFX;
var() Class<emitter>                 FD_BoosterGroundFX;
var() name                           FD_BoosterEvent;
event Touch(Actor Other)
{
super.Touch(other);
if ((BUseFX == true)&& ( pawn(other).IsA('playerpawn')))  FD_SpawnRNDFX(Other);
}

function FD_SpawnRNDFX (Actor TheTarget)
{
  local Emitter FDSpawnEffect;

  if (FD_BoosterEvent != '') TriggerEvent(FD_Boosterevent,self,Instigator);
  if ( FD_VOC_Boost != None ) PlaySound(FD_VOC_Boost);
  if ( FD_Booster_TrailFX != None )
     {
     NetUpdateTime = Level.TimeSeconds - 1;
     FDSpawnEffect = Spawn(FD_Booster_TrailFX,self,,TheTarget.Location,TheTarget.Rotation);
     FDSpawnEffect.SetBase(TheTarget);
     }
  if ( FD_BoosterGroundFX != None )
     {
     NetUpdateTime = Level.TimeSeconds - 1;
     FDSpawnEffect = Spawn(FD_BoosterGroundFX,self,,Location,Rotation);
     FDSpawnEffect.SetBase(self);
     }
}

defaultproperties
{
}
