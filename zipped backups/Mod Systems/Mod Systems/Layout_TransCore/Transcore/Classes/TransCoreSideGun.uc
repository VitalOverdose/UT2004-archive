//-----------------------------------------------------------
//
//-----------------------------------------------------------
class  TransCoreSideGun extends ONSPRVSideGun;

var ONSShockTankProjectile ComboTargetnew;



function SetComboTargetnew(ONSShockTankProjectile S)
{
	if (Bot(Instigator.Controller) == None || Instigator.Controller.Enemy == None)
		return;

	ComboTargetnew = S;
	ComboTargetnew.Monitor(Bot(Instigator.Controller).Enemy);
}



state InstantFireMode
{
    simulated function ClientSpawnHitEffects()
    {
    }

    function SpawnHitEffects(Actor HitActor, vector HitLocation, vector HitNormal)
    {
    }



    function Fire(Controller C)
    {
    	local ONSShockTankProjectile S;

    	S = ONSShockTankProjectile(SpawnProjectile(ProjectileClass, False));
    	if ( S != None && Bot(Instigator.Controller) != None )
        	SetComboTargetnew(S);
    }
}

defaultproperties
{
     FireInterval=0.200000
     AltFireInterval=0.400000
     DamageMin=50
     DamageMax=100
     ProjectileClass=Class'OnslaughtBP.ONSShockTankProjectile'
     AIInfo(0)=(RefireRate=0.500000)
     CullDistance=8000.000000
     DrawScale=1.000000
}
