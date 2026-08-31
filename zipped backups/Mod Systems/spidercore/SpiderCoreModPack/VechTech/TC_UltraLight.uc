//-----------------------------------------------------------
//
//-----------------------------------------------------------
class TC_UltraLight extends FatalsVehicleToolBox;

var() float                   UltraLightDuration,newWeight;
var() actor                   whotouchedMe;
var() sound                   SoundFX;
Var   float                   backedUpOldWeight;


function touch(actor other)
{
    log("**********************************************");
    log("************"$ other$"*****************");
    log("**********************************************");
If (Other.Isa('onsrv'))
    {

     log("*********** Ive changed th vehicle mass************"$onsrv(Other).vehiclemass);
     }
     }

