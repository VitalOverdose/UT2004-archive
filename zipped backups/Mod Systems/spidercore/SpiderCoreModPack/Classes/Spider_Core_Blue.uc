//================================================================================
// Spider_Core_Blue.
//================================================================================

class Spider_Core_Blue extends ONSPowerCoreBlue
  Placeable

  HideCategories(Lighting,LightColor,Karma,Force,DestroyableObjective);

var() Class<Emitter> MyDamageFX;
var() int MyDamageThreshHold;
var() Sound MyDamageSound;
var() name MyDamageEvent;
var SpiderBrain MyBrain;

function LinkMeBrain (SpiderBrain Requestor)
{
  MyBrain = Requestor;
  Log("The brain made a link with Spider_Core_Blue " $ string(MyBrain));
}

function TakeDamage (int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
  if ( Damage >= MyDamageThreshHold )
  {
    if ( MyDamageFX != None )
    {
      NetUpdateTime = Level.TimeSeconds - 1;
      Spawn(MyDamageFX,Owner,,Location);
    }
    if ( MyDamageSound != None )
    {
      PlayOwnedSound(MyDamageSound,,150.0,,,);
    }
    if ( MyDamageEvent != 'None' )
    {
      TriggerEvent(MyDamageEvent,self,Instigator);
    }
    MyBrain.Ouch();
  }
  Super.TakeDamage(Damage,instigatedBy,HitLocation,Momentum,DamageType);
}

defaultproperties
{
    MyDamageFX=Class'SCFX.SCFX_Attack'

    MyDamageThreshHold=5

    MyDamageSound=Sound'ONSVehicleSounds-S.PowerCore.DamageExplosion03'

    RedActiveSkins=[0]=()
[1]=()

    BlueActiveSkins=[0]=()
[1]=()

    StaticMesh=StaticMesh'SpiderCore_Mesh.SpiderBits.Core'

}
