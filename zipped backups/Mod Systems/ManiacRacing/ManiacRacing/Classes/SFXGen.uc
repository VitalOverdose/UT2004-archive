class SFXGen Extends VehicleToolbox
placeable;

var  ONSVehicle                                VecTarget;
var  Pawn                                      PlayerTarget;
Var () bool                                    TagPawn;
Var () bool                                    TagVec;
Var (SFXBurningOil) Class<SFX_Trails>          TrailFX;
Var (SFXBurningOil) Class<SFX>                 AmbiantEffect;
Var (SFXBurningOil) Class<SFX>                 Touch_SFX;
var (SFXBurningOil) sound                      TouchSoundFX;

Function PostbeginPlay()
{
Local SFX SpawnedEffect;

SpawnedEffect=Spawn(AmbiantEffect , self , , Location ,Rotation ) ;
}

Simulated function touch(actor other)
{
if ((TagPawn==True) && ( other.isa('playerpawn')) )
   {
   if (TouchSoundFX!=None) Playsound(TouchSoundFX);
   TouchFX(other);
   }
}

Function TouchFX(actor other)
{
Local SFX SpawnedEffect;
if ( Touch_SFX != None )
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   SpawnedEffect = Spawn( Touch_SFX , self , , other.Location , other.Rotation ) ;                   // Spawn FX
   }
}

Function TagFX(actor other)
{
Local SFX SpawnedEffect;

NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn( Touch_SFX , self , , other.Location , other.Rotation ) ;                   // Spawn FX
}


defaultproperties
{

}
