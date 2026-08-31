//================================================================================
// Spider_Core_Red.
//================================================================================

class Spider_Core_Red extends ONSPowerCoreRed
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
  Log(string(MyBrain) $ " has manged to link to me(" $ string(self) $ ")");
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

    MyDamageThreshHold=25

    MyDamageSound=Sound'ONSVehicleSounds-S.PowerCore.DamageExplosion03'

    RedActiveSkins=[0]=()
[1]=()

    BlueActiveSkins=[0]=()
[1]=()

}
