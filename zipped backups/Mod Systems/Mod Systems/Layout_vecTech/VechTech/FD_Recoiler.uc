



Class FD_Recoiler extends FD_VTM
Placeable;

var svehicle              FD_LinkedVehicle;

function RequestLinkage(out int LinkCondition ,svehicle whosCalling)
{
log("Hello im"$self$" i just recieved a request for linkage from"$whosCalling);
FD_LinkedVehicle=whosCalling;log("FD_LinkedVehicle now has been set to "$FD_LinkedVehicle$" and i will send comfirmation");
if ((whosCalling!=None)&&(LinkCondition!=0)) LinkCondition=2;
}

Function FD_ClearTubes( Int Kicks,vector FD_AppliedBoostForce,optional float ReKickDelay,optional bool bCauseFX,optional Bool FD_bHard_attachTrailFX)
{
local  svehicle FDWhatIfound;local Int I;local vector FD_PointOfBoostForce ;
if (ReKickDelay==0) ReKickDelay=1;
foreach touchingactors(class'svehicle',FDWhatIfound)
        {
   if (FDWhatIfound.IsA('Wyvern'))
       {
       Wyvern(FDWhatIfound).Booster(Kicks ,FD_AppliedBoostForce, ReKickDelay , bCauseFX , FD_bHard_attachTrailFX );
       }
else
    {
    if  (Kicks >1)
        {
        for (I=1;I<Kicks;I++)
            {
            FDWhatIfound.KAddImpulse( FD_AppliedBoostForce >> self.Rotation, FD_PointOfBoostForce >> self.Rotation );  //does the repeates first
            }
        FDWhatIfound.KAddImpulse( FD_AppliedBoostForce >> self.Rotation, FD_PointOfBoostForce >> self.Rotation );     // then the single kick
        }
     }
   }
}

defaultproperties
{
     InitialState="TriggerOpenTimed"
}
