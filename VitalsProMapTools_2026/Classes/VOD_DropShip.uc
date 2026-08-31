//-----------------------------------------------------------
//
//-----------------------------------------------------------
class VOD_DropShip extends ONSattackCraft
    placeable;

#exec OBJ LOAD FILE=..\animations\darkdropship_an.ukx

var     int                             CurrentIndex;
var     bool                            bDoorIsOpen;

// AI hint
Function Bool FastVehicle()
{
	return true;
}

Function Bool Dodge(eDoubleClickDir DoubleClickMove)
{
	if ( FRand() < 0.7 )
	{
		VehicleMovingTime = Level.TimeSeconds + 1;
		Rise = 1;
	}
	return False;
}

simulated Function SpecialCalcBehindView(PlayerController PC, out actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation )
{
	Local Vector CamLookAt, HitLocation, HitNormal, OffseTarget_Vector;
	Local Actor HitActor;
    Local Vector x, y, z;

	if (DesiredTPCamDistance < TPCamDistance)
		TPCamDistance = FMax(DesiredTPCamDistance, TPCamDistance - CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime));
	else if (DesiredTPCamDistance > TPCamDistance)
		TPCamDistance = FMin(DesiredTPCamDistance, TPCamDistance + CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime));

    GetAxes(PC.Rotation, x, y, z);
	ViewActor = self;
	CamLookAt = GetCameraLocationStart() + (TPCamLookat >> Rotation) + TPCamWorldOffset;

	OffseTarget_Vector = Vect(0, 0, 0);
	OffseTarget_Vector.X = -1.0 * TPCamDistance;

	CameraLocation = CamLookAt + (OffseTarget_Vector >> PC.Rotation);

	HitActor = Trace(HitLocation, HitNormal, CameraLocation, Location, true, Vect(40, 40, 40));
	if ( HitActor != None
	     && (HitActor.bWorldGeometry || HitActor == GetVehicleBase() || Trace(HitLocation, HitNormal, CameraLocation, Location, False, Vect(40, 40, 40)) != None ) )
			CameraLocation = HitLocation;

    CameraRotation = Normalize(PC.Rotation + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * x + PC.ShakeOffset.Y * y + PC.ShakeOffset.Z * z;
}

Function Died(Controller Killer, class<DamageType> damageType, Vector HitLocation)
{
    Local Int I;

    if(Level.NetMode != NM_DedicatedServer)
	{
    	for(i=0;i<TrailEffects.Length;I++)
        	TrailEffects[i].Destroy();
        TrailEffects.Length = 0;

		for(i=0; i<StreamerEffect.Length; I++)
			StreamerEffect[i].Destroy();
		StreamerEffect.Length = 0;
    }

	Super.Died(Killer, damageType, HitLocation);
}

simulated Function Destroyed()
{
    Local Int I;

    if(Level.NetMode != NM_DedicatedServer)
	{
    	for(i=0;i<TrailEffects.Length;I++)
        	TrailEffects[i].Destroy();
        TrailEffects.Length = 0;

		for(i=0; i<StreamerEffect.Length; I++)
			StreamerEffect[i].Destroy();
		StreamerEffect.Length = 0;
    }

    Super.Destroyed();
}

simulated event DrivingStatusChanged()
{
	Local Vector RotX, RotY, RotZ;
 Local Int I;

	Super.DrivingStatusChanged();

    if (bDriving && Level.NetMode != NM_DedicatedServer && !bDropDetail)
	{
        GetAxes(Rotation,RotX,RotY,RotZ);

        if (TrailEffects.Length == 0)
        {
            TrailEffects.Length = TrailEffectPositions.Length;

        	for(i=0;i<TrailEffects.Length;I++)
            	if (TrailEffects[i] == None )
            	{
                	TrailEffects[i] = Spawn(TrailEffectClass, self,, Location + (TrailEffectPositions[i] >> Rotation) );
                	TrailEffects[i].SetBase(self);
                    TrailEffects[i].SetRelativeRotation( rot(0,32768,0) );
                }
        }

        if (StreamerEffect.Length == 0)
        {
    		StreamerEffect.Length = StreamerEffectOffset.Length;

    		for(i=0; i<StreamerEffect.Length; I++)
        		if (StreamerEffect[i] == None )
        		{
        			StreamerEffect[i] = Spawn(StreamerEffectClass, self,, Location + (StreamerEffectOffset[i] >> Rotation) );
        			StreamerEffect[i].SetBase(self);
        		}
    	}
    }
    else
    {
        if (Level.NetMode != NM_DedicatedServer)
    	{
        	for(i=0;i<TrailEffects.Length;I++)
        	   TrailEffects[i].Destroy();

        	TrailEffects.Length = 0;

    		for(i=0; i<StreamerEffect.Length; I++)
                StreamerEffect[i].Destroy();

            StreamerEffect.Length = 0;
        }
    }
}

simulated Function Tick(float DeltaTime)
{
    Local float EnginePitch, DesiredOpacity, DeltaOpacity, MaxOpacityChange, ThrustAmount;
	Local TrailEmitter T;
    Local int I;
	Local Vector RelVel;
	Local Bool NewStreamerActive, bIsBehindView;
	Local PlayerController PC;

    if(Level.NetMode != NM_DedicatedServer)
	{
        EnginePitch = 64.0 + VSize(Velocity)/MaxPitchSpeed * 32.0;
        SoundPitch = FClamp(EnginePitch, 64, 96);

        RelVel = Velocity << Rotation;

        PC = Level.GetLocalPlayerController();

		if (PC != None && PC.ViewTarget == self)
			bIsBehindView = PC.bBehindView;
		else
            bIsBehindView = True;

    	// Adjust Engine FX depending on being drive/velocity
		if (!bIsBehindView)
		{
			for(i=0; i<TrailEffects.Length; I++)
				TrailEffects[i].SetThrustEnabled(False);
		}
        else
        {
			ThrustAmount = FClamp(OutputThrust, 0.0, 1.0);

			for(i=0; i<TrailEffects.Length; I++)
			{
				TrailEffects[i].SetThrustEnabled(true);
				TrailEffects[i].SetThrust(ThrustAmount);
			}
		}

		// Update streamer opacity (limit max change speed)
		DesiredOpacity = (RelVel.X - StreamerOpacityRamp.Min)/(StreamerOpacityRamp.Max - StreamerOpacityRamp.Min);
		DesiredOpacity = FClamp(DesiredOpacity, 0.0, StreamerOpacityMax);

		MaxOpacityChange = DeltaTime * StreamerOpacityChangeRate;

		DeltaOpacity = DesiredOpacity - StreamerCurrentOpacity;
		DeltaOpacity = FClamp(DeltaOpacity, -MaxOpacityChange, MaxOpacityChange);

		if(!bIsBehindView)
            StreamerCurrentOpacity = 0.0;
        else
    		StreamerCurrentOpacity += DeltaOpacity;

		if(StreamerCurrentOpacity < 0.01)
			NewStreamerActive = False;
		else
			NewStreamerActive = true;

		for(i=0; i<StreamerEffect.Length; I++)
		{
			if(NewStreamerActive)
			{
				if(!StreamerActive)
				{
					T = TrailEmitter(StreamerEffect[i].Emitters[0]);
					T.ResetTrail();
				}
				StreamerEffect[i].Emitters[0].Disabled = False;
				StreamerEffect[i].Emitters[0].Opacity = StreamerCurrentOpacity;
			    }

            else
			   {
				StreamerEffect[i].Emitters[0].Disabled = true;
				StreamerEffect[i].Emitters[0].Opacity = 0.0;
			   }
		}

		StreamerActive = NewStreamerActive;
    }

    Super.Tick(DeltaTime);
}

Function float ImpactDamageModifier()
{
    Local float Multiplier;
    Local Vector X, Y, Z;

    GetAxes(Rotation, X, Y, Z);

    if (ImpactInfo.ImpactNorm Dot Z > 0)
        Multiplier = 0.75-(ImpactInfo.ImpactNorm dot Z);
    else
        Multiplier = 1.0;

    return Super.ImpactDamageModifier() * Multiplier;
}

Function Bool RecommendLongRangedAttack() { Return true; }


Function Bool PlaceExitingDriver()                       // <<<<<< FIXME Fix to not be specific to this class after demo
{
 Local Int I;
	Local Vector tryPlace, Extent, HitLocation, HitNormal, ZOffset;

	Extent = Driver.default.CollisionRadius * Vect(1,1,0);
	Extent *= 2;
	Extent.Z = Driver.default.CollisionHeight;
	ZOffset = Driver.default.CollisionHeight * Vect(0,0,1);
	if (Trace(HitLocation, HitNormal, Location + (ZOffset * 6), Location, False, Extent) != None )
		return False;

	//avoid running Driver over by placing in direction perpendicular to velocity
	if ( VSize(Velocity) > 100 )
	{
		tryPlace = Normal(Velocity cross Vect(0,0,1)) * (CollisionRadius + Driver.default.CollisionRadius ) * 1.25 ;
		if ( FRand() < 0.5 )
			tryPlace *= -1; //randomly prefer other side
		if ( (Trace(HitLocation, HitNormal, Location + tryPlace + ZOffset, Location + ZOffset, False, Extent) == None && Driver.SetLocation(Location + tryPlace + ZOffset))
		     || (Trace(HitLocation, HitNormal, Location - tryPlace + ZOffset, Location + ZOffset, False, Extent) == None && Driver.SetLocation(Location - tryPlace + ZOffset)) )
			return true;
	}

	for( i=0; i<ExitPositions.Length; I++)
	{
		if ( ExitPositions[0].Z != 0 )
			ZOffset = Vect(0,0,1) * ExitPositions[0].Z;
		else
			ZOffset = Driver.default.CollisionHeight * Vect(0,0,2);

		if ( bRelativeExitPos )
			tryPlace = Location + ( (ExitPositions[i]-ZOffset) >> Rotation) + ZOffset;
		else
			tryPlace = ExitPositions[i];

		// First, do a line check (stops us passing through things on exit).
		if ( bRelativeExitPos && Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, False, Extent) != None )
			continue;

		// Then see if we can place the player there.
		if ( !Driver.SetLocation(tryPlace) )
			continue;

		return true;
	}
	return False;
}


//==================Mod off From ONSPR=====================================

Function AltFire(optional float F)            //avoid sending altfire to weapon
{
 Super(Vehicle).AltFire(F);
}


static function StaticPrecache(LevelInfo L)
{
    Super.StaticPrecache(L);

	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorGun');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');

    L.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.SmokePanels2');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    L.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.RaptorColorRed');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.RaptorColorBlue');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.AttackCraftNoColor');
	L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.TrailBlura');
    L.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.raptorCOLORtest');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.SmokeFragment');
}

simulated Function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorGun');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');

	Super.UpdatePrecacheStaticMeshes();
}

simulated Function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.SmokePanels2');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    Level.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.RaptorColorRed');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.RaptorColorBlue');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.AttackCraftNoColor');
	Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.TrailBlura');
    Level.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.AttackCraftGroup.raptorCOLORtest');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.SmokeFragment');

	Super.UpdatePrecacheMaterials();
}

defaultproperties
{
	VehiclePositionString="in  Vitals DropShip"
	VehicleNameString="Vital DropShip"
	MaxPitchSpeed=600.000000
	MaxThrustForce=256.000000
	TurnDamping=500.000000
	PitchTorqueMax=15.000000
	PitchDamping=50.000000
	RollDamping=60.000000
	RedSkin=Texture'VitalsProMapTools_tx.VehicleSkins.Dropship2026_Skin'
	BlueSkin=Texture'VitalsProMapTools_tx.VehicleSkins.Dropship2026_Skin'
	VehicleMass=10.000000
	bCanBeBaseForPawns=True
	GroundSpeed=50.000000
	HealthMax=800.000000
	Health=800
	TrailEffectPositions(0)=(X=-672.000000,Y=-480.000000,Z=-20.000000)
	TrailEffectPositions(1)=(X=-672.000000,Y=480.000000,Z=-20.000000)
	Mesh=SkeletalMesh'VitalsProMapTools_an.Dropship_2026'
}
