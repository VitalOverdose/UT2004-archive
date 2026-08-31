//================================================================================
// SC_RNDMonsterMaker.
//================================================================================

class SC_RNDMonsterMaker extends SpiderCoreToolBox;

struct SCSequencer
{
  var() Class<Emitter> SpawnFx;
  var() Class<Monster> TheMonster;
  var() bool bHardAttachFXToMonster;
  var() int NoOfMonsters;
  var() float RespawnDelay;
  var() float Monstersize_Min;
  var() float Monstersize_Max;
  var() float MonsterGroundSpeedMin;
  var() float MonsterGroundSpeedMax;
  var() float JumpHeightMin;
  var() float JumpHeightMax;
};

var int RNDNo;
var() array<SCSequencer> MonsterSeq;

function SpawnMonster ()
{
  local Monster theSpawnedMonster;
  local float AdjustedRadius;
  local float AdjustedHeight;
  local float AdjustedMonsterSize;
  local Vector AdjustedZLocation;

  RNDNo = int(RandRange(0.0,MonsterSeq.Length - 1));
  CalcRNDDimentions(AdjustedRadius,AdjustedHeight,AdjustedZLocation,AdjustedMonsterSize);
  theSpawnedMonster = Spawn(MonsterSeq[RNDNo].TheMonster,Owner,,AdjustedZLocation);
  theSpawnedMonster.SetDrawScale(AdjustedMonsterSize);
  theSpawnedMonster.SetCollisionSize(AdjustedRadius,AdjustedHeight);
  theSpawnedMonster.GroundSpeed = RandRange(MonsterSeq[RNDNo].MonsterGroundSpeedMin,MonsterSeq[RNDNo].MonsterGroundSpeedMax);
  theSpawnedMonster.GroundSpeed = RandRange(MonsterSeq[RNDNo].JumpHeightMin,MonsterSeq[RNDNo].JumpHeightMax);
  DoSpawnFX(theSpawnedMonster);
}

function CalcRNDDimentions (out float AdjustedRadius, out float AdjustedHeight, out Vector AdjustedZLocation, out float AdjustedMonsterSize)
{
  local float AdjustedLocation;

  if ( MonsterSeq[RNDNo].Monstersize_Min > 0.5 )
  {
    if ( MonsterSeq[RNDNo].Monstersize_Min < MonsterSeq[RNDNo].Monstersize_Max )
    {
      AdjustedMonsterSize = RandRange(MonsterSeq[RNDNo].Monstersize_Min,MonsterSeq[RNDNo].Monstersize_Max);
    } else {
      if ( MonsterSeq[RNDNo].Monstersize_Min > 0.5 )
      {
        AdjustedMonsterSize = RandRange(0.5,MonsterSeq[RNDNo].Monstersize_Min);
      }
    }
  }
  AdjustedRadius = MonsterSeq[RNDNo].TheMonster.Default.CollisionRadius * AdjustedMonsterSize;
  AdjustedHeight = MonsterSeq[RNDNo].TheMonster.Default.CollisionHeight * AdjustedMonsterSize;
  AdjustedLocation = MonsterSeq[RNDNo].TheMonster.Default.CollisionHeight * AdjustedMonsterSize;
  AdjustedZLocation = Location + vect(0.00,0.00,1.00) * AdjustedLocation;
}

function DoSpawnFX (Monster Target)
{
  local Emitter SpawnedFX;

  NetUpdateTime = Level.TimeSeconds - 1;
  SpawnedFX = Spawn(MonsterSeq[RNDNo].SpawnFx,Owner,,Target.Location);
  if ( MonsterSeq[RNDNo].bHardAttachFXToMonster )
  {
    SpawnedFX.SetBase(Target);
  }
}

state ReadyToGo
{
  function Touch (Actor Other)
  {
    if (  !Other.IsA('Monster') && Other.IsA('Pawn') )
    {
      GotoState('Genesis');
    }
  }
  
}

state Genesis
{
  SpawnMonster();
  GotoState('Delaying');
}

state Delaying
{
  Sleep(MonsterSeq[RNDNo].RespawnDelay);
  if ( MonsterSeq[RNDNo].NoOfMonsters == 1 )
  {
    GotoState('ReadyToGo');
  }
  MonsterSeq[RNDNo].NoOfMonsters--;
  GotoState('Genesis');
}

defaultproperties
{
    InitialState=ReadyToGo

}
