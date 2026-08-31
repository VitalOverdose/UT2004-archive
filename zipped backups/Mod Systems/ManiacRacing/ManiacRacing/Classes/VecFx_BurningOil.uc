class SFXGen_BurningOil extends SFXGen
Placeable;

var  ONSVehicle                                MyTarget;
Var (SFXBurningOil) bool                       Burns_Bot,Burns_player,Burns_Monster,Burns_Vehicle,SpawnPainTimer,HardAttachFX;
Var (SFXBurningOil) Class<SFX>                 FireTrailFX;
var (SFXBurningOil) sound                      Scream;

Function FX(actor other)
{
Local SFX SpawnedEffect;
if (((Burns_player==True) && (other.isa('PlayerPawn'))) || ((Burns_Vehicle==True) && (other.isa('ONSVehicle'))))
    {
    Playsound(Scream);
    NetUpdateTime = Level.TimeSeconds - 1;
    SpawnedEffect = Spawn( FireTrailFX , self , , other.Location , other.Rotation ) ;                   // Spawn FX
    SpawnedEffect.SetBase( other );
    }
}
simulated function touch(actor other)
{
FX(other);
}

state ImAlive
{
Begin:
Sleep(5);
VecAmbiantFX();
}

defaultproperties
{
     Scream=Sound'MercMaleTaunts.MMImOnFire'
     Initialstate=ImAlive
     Burns_player=True
     Burns_Vehicle=True
     FireTrailFX=Class'SFX.BetterFiretrail'
     AmbiantEffect=Class'SFX.BetterFiretrail'
     Texture=Texture'SFX.ddf.A00'
     CollisionRadius=150.000000
     CollisionHeight=150.000000
}
