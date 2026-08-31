//     Class FDK_ALLVehicleBooster
//
// kicks ANY vehicle.
//
// By FatalOverdose (c) 2005 www.fataloverdose.copperstream.co.uk
// A moveable physics volume with Simple RND Effect
// if you put something in SFX slot 1 that will be spawned when touched
// if you put something in SFX slot 1& 2 the engine pick will pick 1 at random
// You get to specify the probability of it being the second fx spawned instead
// of the first.
// booster will boost the vehicle in the direction hes facing
// unless the directional option is set to true
//-----------------------------------------------------------


class ManiacPhysicsVolume extends PhysicsVolume
placeable;

var(ManiacRacing)    bool                     bReactOnTouch,bReactOnUnTouch;
var(ManiacRacing)    class<SFX>               Touch_FX,Touch1FX,Touch2FX,ResultingFX,UnTouch1FX,UnTouch2FX,UnTouch_FX;
var(ManiacRacing)     float                    SFXTouch2FXProbability,SFXUnTouch2FXProbability;
var(ManiacRacing)    name                     Touch_Event,UnTouch_Event;
var(ManiacRacing)    sound                    Touch_Sound,UnTouch_Sound;


simulated event UnTouch( Actor Other )
{
local float R; R=FRand();
Super.UnTouch(Other);
if ( ( bReactOnUnTouch == true ) && ( UnTouch1FX != none ) )
    if (( UnTouch2FX != none )&&( R >SFXUnTouch2FXProbability ) )  UnTouch1FX =  UnTouch2FX;
    else if ( UnTouch2FX!=none)  UnTouch1FX= UnTouch2FX;
     NetUpdateTime = Level.TimeSeconds - 1;
     Spawn(  UnTouch1FX, Owner,, Location );
     if ( UNTouch_Event!='')TriggerEvent( UnTouch_Event, Self, Instigator);
     if ( UnTouch_Sound!= none) Playsound( UnTouch_Sound);
}

Simulated event Touch( Actor Other )
{
local float R; R=FRand();
Super.Touch(Other);
if ( ( bReactOnUnTouch == true ) && ( Touch1FX != none ) )
   if ( ( Touch2FX!= none) && ( R > SFXTouch2FXProbability ) )  Touch1FX = Touch2FX;
   else
   if ( Touch2FX!=none)  Touch1FX= Touch2FX;
   NetUpdateTime = Level.TimeSeconds - 1;
   Spawn(  Touch1FX, Owner,, Location );
   if ( Touch_Event!='')TriggerEvent( Touch_Event, Self, Instigator);
   if ( Touch_Sound!= none) Playsound( Touch_Sound);
}


defaultproperties
{
bStatic=False
}
