//-----------------------------------------------------------
// RealCore_Red......Links to EITHER PseudoCore OR TransCore_Red
// By FatalOverdose 2005 (c)
// Part OF The PseudoCore Mod Package
// DigiMechTech
// http://www.FatalOverdose.copperstream.co.uk
//-----------------------------------------------------------
class RealCore_Red extends ONSPowerCoreRed;

var  PseudoCore_Red       My_Linked_PseudoCore;
var  TransCore_Red        My_Linked_TransCore,SpawnedTransCore;

Var() enum SpawnVehicleAt
{
PseudoCore,
Specify
}  SpawnVehicleAt_;


Var () bool               LinkToTransCore;
var () bool               SpawnVehicleWhenDying;
var () Float              SpawnVehicleAtHealth;
var () vector             SepecifiedVehicleSpawnPosition,VehicleSpawnOffSet;
var  bool                 VehicleIsActive;
var () Class<Emitter>     VehicleSpawnEffect;

simulated function LinkRequest(optional PseudoCore_Red MyLinked_PseudoCore,optional TransCore_Red MyLinkedTransCore)
{
if ((LinkToTransCore!=False) &&  (MyLinkedTransCore==None))
   {
   My_Linked_TransCore=MyLinkedTransCore;
   log("Hi im "$Self$"recieved Request for linkage from..."$My_Linked_TransCore$"I think Ill Send Confirmation");
   My_Linked_TransCore.LinkHasBeenEstablished();
   }
else
if ((LinkToTransCore!=True) &&  (My_Linked_PseudoCore==None))
   {
    My_Linked_PseudoCore=MyLinked_PseudoCore;
    log("Hi im "$Self$"recieved Request for linkage from..."$My_Linked_PseudoCore$"I think Ill Send Confirmation");
    My_Linked_PseudoCore.LinkHasBeenEstablished();
}
}


simulated function PowerCoreDestroyed()
{
    local PlayerController PC;

    AmbientSound = None;
//	log(Name@"PowerCoreDestroyed");
    Health = 0;


if (My_Linked_PseudoCore!=None)
   {
   My_Linked_PseudoCore.ItsAllOverDude();
   My_Linked_PseudoCore.ExplosionEffect = spawn(class'ONSPowerCoreBreachEffect', My_Linked_PseudoCore);
   }
else
if (My_Linked_TransCore !=None)
   {
   My_Linked_TransCore.ExplosionEffect = spawn(class'ONSPowerCoreBreachEffect', My_Linked_TransCore);
   My_Linked_TransCore.ItsAllOverDude();
   }

if (Level.NetMode != NM_DedicatedServer)
    {
     PC = Level.GetLocalPlayerController();
        if (PC != None)
            PC.ClientPlaySound(DestroyedSound, False, 2.0);
        else
            {
             if (My_Linked_PseudoCore!=none ) My_Linked_PseudoCore.PlaySound(DestroyedSound, SLOT_Misc, 5.0);
             else
             if (My_Linked_TransCore!=none ) My_Linked_TransCore.PlaySound(DestroyedSound, SLOT_Misc, 5.0);
            }
    Skins.length = 0;
    }

    if (Role == ROLE_Authority)
    {
        NetUpdateTime = Level.TimeSeconds - 1;
        Scorers.length = 0;
        UpdateCloseActors();
        OnCoreDestroyed(DefenderTeamIndex);
        NotifyUpdateLinks();
        DefenderTeamIndex = 2;
        GotoState('DestroyedCore');
    }

	UpdateLinkState(Self);
}






simulated function SpawnVehicle(int Wheretospawn)     //1=pseudo 2=specify
{
local emitter InstantFX;
if (Wheretospawn==1)
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   InstantFX=Spawn(VehicleSpawnEffect,self,,My_Linked_PseudoCore.location+VehicleSpawnOffset,My_Linked_PseudoCore.rotation);
   SpawnedTransCore=Spawn( class'TransCore_Red', self,, My_Linked_PseudoCore.Location+VehicleSpawnOffSet,My_Linked_PseudoCore.rotation);
   health=SpawnedTransCore.health;
   }
else
if (Wheretospawn==2)
   {
   NetUpdateTime = Level.TimeSeconds - 1;
   InstantFX=Spawn(VehicleSpawnEffect,self,,SepecifiedVehicleSpawnPosition+VehicleSpawnOffSet,rotation);
   SpawnedTransCore=Spawn( class'TransCore_Red', self,,SepecifiedVehicleSpawnPosition+VehicleSpawnOffSet,rotation);
   health=SpawnedTransCore.health;
   }
}


simulated function CheckShield()
{
    Super.CheckShield();
if ((My_Linked_PseudoCore!=none) && (My_Linked_TransCore==none))
   {
    if (CoreStage == 0)
       {
        if (PCEnergyEffect != None && ((PCEnergyEffect.IsA('ONSPowerCoreEnergyRed') && DefenderTeamIndex == 1) || (PCEnergyEffect.IsA('ONSPowerCoreEnergyBlue') && DefenderTeamIndex == 0)))
            PCEnergyEffect.Destroy();
        if (PCEnergyEffect == None)
           {
            if (DefenderTeamIndex == 0)
                PCEnergyEffect = Spawn(class'ONSPowerCoreEnergyRed',My_Linked_TransCore,,My_Linked_TransCore.location);
            else
                PCEnergyEffect = Spawn(class'ONSPowerCoreEnergyBlue',My_Linked_TransCore,,My_Linked_TransCore.location);
           }
       }
    else if (PCEnergyEffect != None)  PCEnergyEffect.Destroy();
  }
else
if ((My_Linked_PseudoCore==none) && (My_Linked_TransCore!=none))
   {
    if (CoreStage == 0)
       {
        if (PCEnergyEffect != None && ((PCEnergyEffect.IsA('ONSPowerCoreEnergyRed') && DefenderTeamIndex == 1) || (PCEnergyEffect.IsA('ONSPowerCoreEnergyBlue') && DefenderTeamIndex == 0)))
            PCEnergyEffect.Destroy();
        if (PCEnergyEffect == None)
           {
            if (DefenderTeamIndex == 0)
                PCEnergyEffect = Spawn(class'ONSPowerCoreEnergyRed',My_Linked_PseudoCore,,My_Linked_PseudoCore.location);
            else
                PCEnergyEffect = Spawn(class'ONSPowerCoreEnergyBlue',My_Linked_PseudoCore,,My_Linked_PseudoCore.location);
           }
       }
    else if (PCEnergyEffect != None)  PCEnergyEffect.Destroy();
  }
}



function takedamage(int Damage, Pawn Eventinstigator,Vector HitLocation,Vector Momentum,Class<DamageType>DamageType)
{

if ((health<SpawnVehicleAtHealth)&&(SpawnVehicleWhenDying!=False)&&(VehicleIsActive!=True)&&(SpawnvehicleAt_==PseudoCore)) {SpawnVehicle(1);VehicleIsActive=True;}
else
if ((health<SpawnVehicleAtHealth)&&(SpawnVehicleWhenDying!=False)&&(VehicleIsActive!=True)&&(SpawnvehicleAt_==specify)) {SpawnVehicle(2);VehicleIsActive=True;}
super.takedamage( Damage,  Eventinstigator, HitLocation, Momentum,DamageType);
}

defaultproperties
{
     SpawnVehicleAtHealth=1500.000000
     VehicleSpawnOffSet=(X=512.000000,Z=512.000000)
     DrawScale=0.250000
}
