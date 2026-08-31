//     class V2VecBooster
//
// kicks ANY Vehicle.
//
// By VitalOverdose
// optional vocal's(just remove sound to disable in unrealed)
// booster will boost the Vehicle in the direction hes facing
// unless the directional option is set to true
// V2: locks driver in during boost to prevent panic-eject
//-----------------------------------------------------------

class VOD_VehicleBooster extends VOD_Triggers
placeable;

struct                            VecRec
{
var OnsVehicle                    VecRef;
var float                         RecTime;
};var array< VecRec >             Tracking;

var vector                        AppliedBoostForce;
var() sound                       SoundFxBoost;
Var() bool                        bAirbornBoost;
Var() float                       Capturetime;
var   float                       TimerFrequency;

simulated function Touch( Actor Other )
{
 if ( Other.IsA('OnsVehicle') && ( OnsVehicle(Other).bVehicleOnGround || bAirbornBoost ) )
    {
     VecBoost( OnsVehicle(Other) );
     EnterVecRec( OnsVehicle(Other) );
    }

 super.touch(Other);
}

simulated function VecBoost( OnsVehicle VehicleToBoost )
{
 local actor RotationRelation;

 RotationRelation = VehicleToBoost;             // will kick the vec in the direction its facing

 if ( bDirectional )                            // if bdirectional is true: kick vec in direction this actor
     RotationRelation = self;                   // is facing

 VehicleToBoost.KAddImpulse( AppliedBoostForce >> RotationRelation.Rotation, vect(0,0,0) >> RotationRelation.Rotation );

 if ( SoundFxBoost != None )
    {
     PlaySound( SoundFxBoost );                 // sound fx
     VehicleToBoost.MakeNoise(1.0);
    }
}

simulated function EnterVecRec( OnsVehicle NewVec )
{
 Tracking.insert(0,1);
 NewVec.bDriverCannotLeaveVehicle = true;
 Tracking[0].VecRef               = NewVec;
 Tracking[0].RecTime              = Capturetime;

 if ( Tracking.length == 1 )
     SetTimer(TimerFrequency, false);
}

function Timer()
{
 local Int I;
 for ( i=0 ; i < Tracking.length ; I++ )
     {
      if ( Tracking[i].VecRef == None )
         {
          Tracking.remove(i, 1);
          i -= 1;
         }
      else
      if ( Tracking[i].RecTime > 0 )
         {
          Tracking[i].RecTime -= TimerFrequency;
          if ( Tracking[i].RecTime <= 0 )
             {
              Tracking[i].VecRef.bDriverCannotLeaveVehicle = false;
              Tracking.remove(i, 1);
              i -= 1;
             }
         }
     }
 if ( Tracking.length != 0 )
     SetTimer(TimerFrequency, false);
}

defaultproperties
{
     AppliedBoostForce=(X=9000000.000000)
     SoundFxBoost=Sound'AnnouncerEvil.Booster'
     bAirbornBoost=False
     Capturetime=1.000000
     TimerFrequency=0.100000
     Texture=Texture'XEffectMat.Shock.Shock_ring_a'
     CollisionRadius=150.000000
     CollisionHeight=150.000000
     bCollideActors=True
}
