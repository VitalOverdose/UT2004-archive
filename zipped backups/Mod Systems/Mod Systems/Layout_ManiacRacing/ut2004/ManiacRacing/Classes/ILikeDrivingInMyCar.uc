//- quite blatantly
//
//

class ILikeDrivingInMyCar extends VehicleToolBox
placeable;


var(ILikeDrivingInMyCar) bool bRespawnVehicles;
var(ILikeDrivingInMyCar) bool bNoTeamLock;

function PostBeginPlay()
{
SetTimer(1, true);
}

simulated function Timer()
{
local GameInfo I;
local Vehicle V;
local ONSVehicleFactory F;
local ASVehicleFactory P;

foreach DynamicActors(class'Engine.Gameinfo', I)
{
if (!I.bAllowVehicles)
I.bAllowVehicles = true;
}

if (bNoTeamLock)
{
foreach DynamicActors(class'Vehicle', V)
{
V.bTeamLocked = false;
V.Team = 255;
}
}

if (bRespawnVehicles)
{
foreach DynamicActors(class'ONSVehicleFactory', F)
{
F.SpawnVehicle();
}

foreach DynamicActors(class'ASVehicleFactory', P)
{
P.SpawnVehicle();
}
}
}


