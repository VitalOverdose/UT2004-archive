//-----------------------------------------------------------
//  MoveableBlockingVol
//===========================
// By FatalOverdose 2005 (c)
// DigiMechTech
// http://www.FatalOverdose.copperstream.co.uk
//-----------------------------------------------------------
class MoveableBlockingVol extends BlockingVolume
placeable;

var(ManiacRacing) name       Touch_Event;
var(ManiacRacing) name       Untouch_Event;

event Touch( Actor Other )  {TriggerEvent(Touch_Event, Self, Instigator);}
event UnTouch( Actor Other ){TriggerEvent(Untouch_Event, Self, Instigator);}

defaultproperties
{
bStatic=False
}
