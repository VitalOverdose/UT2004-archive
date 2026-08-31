//=============================================================================
// Fatal_Volume V1.1
//=============================================================================
// Created by FatalOverdose
// moveable blockingvolume + events
// © 2004 www.fataloverdose.copperstream.com
//=============================================================================

class Fatal_Volume extends PhysicsVolume;

var(ManiacRacing) name       Touch_Event;
var(ManiacRacing) name       Untouch_Event;

simulated event Touch( Actor Other )
{
TriggerEvent(Touch_Event, Self, Instigator);
}

simulated event UnTouch( Actor Other )
{
TriggerEvent(Untouch_Event, Self, Instigator);
}

defaultproperties
{
bStatic=False
}
