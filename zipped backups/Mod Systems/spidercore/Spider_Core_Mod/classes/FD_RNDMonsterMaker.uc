class FD_RNDMonsterMaker extends Triggers
placeable;

struct FDSequencer
{
var() class<xpawn>       FD_monster;
var() class<emitter>     FD_SpawnFX;
var() Int                FD_No_OfMonsters;
var() float              FD_Monstersize;
var() bool               FDb_RandomSize;
var() float              FD_ReSpawnDelay;
};Var()FDSequencer       MonsterSequence[16];

var int R;
var float FD_templocation;
var float FDNewHeight;
Var float FDNewRadius;


auto state waiting
{
function touch(actor other)
{

R=Rand(4);log("R is"$R);
log ("FD_templocation=128*MonsterSequence[r].FD_Monstersize"$FD_templocation);
FD_templocation=MonsterSequence[r].FD_monster.default.CollisionHeight*MonsterSequence[r].FD_Monstersize;

FDNewRadius=MonsterSequence[r].FD_monster.default.CollisionRadius*MonsterSequence[r].FD_Monstersize;
FDNewHeight=MonsterSequence[r].FD_monster.default.CollisionHeight*MonsterSequence[r].FD_Monstersize;

if (!Other.IsA('Pawn'))
   {
   log("been touched by a pawn. MonsterSequence[r].FD_monster is "$MonsterSequence[r].FD_monster);
   gotostate('Birthing');
   }
}
}

state birthing
{
function birth()
{
local Xpawn TheMonster;

TheMonster=Spawn(MonsterSequence[r].FD_monster, Owner,,Location+vect(0,0,1)* FD_templocation);
TheMonster.SetDrawScale(MonsterSequence[r].FD_Monstersize);

TheMonster.SetCollisionsize(  FDNewRadius,FDNewHeight );
}

begin:
   if (MonsterSequence[r].FD_SpawnFX != None)
      {
       NetUpdateTime = Level.TimeSeconds - 1;
       Spawn(MonsterSequence[r].FD_SpawnFX , Owner,,Location+vect(0,0,1)* FD_templocation);
      }
    birth();
      gotostate('delaying');
}

state delaying
{
begin:
sleep (MonsterSequence[R].FD_ReSpawnDelay);
if (MonsterSequence[R].FD_No_OfMonsters != 1)
   {
   MonsterSequence[R].FD_No_OfMonsters--;
   gotostate('Birthing');
   }
else
    gotostate('waiting');
}

defaultproperties
{
}
