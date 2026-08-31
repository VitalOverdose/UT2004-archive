//-----------------------------------------------------------
//
//-----------------------------------------------------------
class nooNode extends ONSPowerNodeNeutral;

var () name           forcedlink;

simulated function FindCloseActors()
{
	local Actor A;

	CloseActors.Length = 0;

	if (Role == ROLE_Authority)
	{
		foreach AllActors(class 'Actor', A)
			if (( (A.IsA('PlayerStart') || A.IsA('ONSVehicleFactory') || A.IsA('ONSStationaryWeaponPawn') || A.IsA('xTeamBanner') || A.IsA('ONSTeleportPad')) && ClosestTo(A) == self ) || (linkableONSMAS(A).ForcedLinkTo == event))
			{
				if (A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(self);
					TeleportPads[TeleportPads.length] = ONSTeleportPad(A);
				}
				else
				if (linkableONSMAS(A).ForcedLinkTo == event)
                    CloseActors[CloseActors.Length] = A;
			}
	}
	else
	{
		foreach AllActors(class'Actor', A)
			if ((A.IsA('xTeamBanner') || A.IsA('ONSTeleportPad')) && ClosestTo(A) == self)
			{
				if (A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(self);
					TeleportPads[TeleportPads.length] = ONSTeleportPad(A);
				}
				else
					CloseActors[CloseActors.Length] = A;
			}
	}
}

defaultproperties
{
}
