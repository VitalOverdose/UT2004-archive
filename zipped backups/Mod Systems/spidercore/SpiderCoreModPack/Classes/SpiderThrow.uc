//================================================================================
// SpiderThrow.
//================================================================================

class SpiderThrow extends ONSMineThrowFire;

function Projectile SpawnProjectile (Vector Start, Rotator Dir)
{
  local Projectile P;
  local int X;

  if ( Weapon.Instigator.GetTeamNum() == 0 )
  {
    ProjectileClass = RedMineClass;
  }
  if ( Weapon.Instigator.GetTeamNum() == 1 )
  {
    ProjectileClass = BlueMineClass;
  }
  if ( ProjectileClass != None )
  {
    P = Weapon.Spawn(ProjectileClass,Weapon,,Start,Dir);
  }
  if ( P == None )
  {
    return None;
  }
  P.SetDrawScale(1.0);
  P.SetCollisionSize(50.0,50.0);
  P.Damage *= DamageAtten;
  if ( SpiderMineLayer(Weapon) != None )
  {
    if ( SpiderMineLayer(Weapon).CurrentMines >= SpiderMineLayer(Weapon).MaxMines )
    {
      X = 0;
      if ( X < SpiderMineLayer(Weapon).Mines.Length )
      {
        if ( SpiderMineLayer(Weapon).Mines[X] == None )
        {
          SpiderMineLayer(Weapon).Mines.Remove (X,1);
          X--;
        } else {
          SpiderMineLayer(Weapon).Mines[X].Destroy();
          SpiderMineLayer(Weapon).Mines.Remove (X,1);
          goto JL01BA;
        }
        X++;
        goto JL0112;
      }
    }
    SpiderMineLayer(Weapon).Mines[SpiderMineLayer(Weapon).Mines.Length] = P;
    SpiderMineLayer(Weapon).CurrentMines++;
  }
  return P;
}

function PlayFiring ()
{
  Super.PlayFiring();
  SpiderMineLayer(Weapon).PlayFiring(True);
}

defaultproperties
{
    RedMineClass=Class'SpiderCoreSpiderMineRed'

    BlueMineClass=Class'SpiderCoreSpiderMineBlu'

}
