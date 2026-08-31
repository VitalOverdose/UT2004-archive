//-----------------------------------------------------------
//
//-----------------------------------------------------------
class PseudoCoreMover extends Mover;
var() array < Class<emitter> > FD_TheFX;
var() Enum I_D
{
Red,
Blue
} ID;

Var float  RealCore_ScanRange;
var PseudoCore_Red         MylinkedPseudoCore_Red;
var PseudoCore_Blue        MylinkedPseudoCore_Blue;

function PreBeginplay ()
{
Local Int I,fdtemp;
local PseudoCore_Red A; local PseudoCore_Blue B;

for (i=FD_TheFX.Length;i>0;I--)
     {
     FD_TheFX[i+1]=FD_TheFX[i];
     fdtemp=Rand(FD_TheFX.Length-1);fdtemp++; FD_TheFX[0]=FD_TheFX[fdtemp]; // the rnd line
     }

if (ID==Red)
{
 foreach VisibleCollidingActors (class'PseudoCore_Red', A,RealCore_ScanRange)
		{
        MylinkedPseudoCore_Red=A;
        Break;
		}
	}
else
if (ID==Blue)
{
 foreach VisibleCollidingActors (class'PseudoCore_Blue', B,RealCore_ScanRange)
		{
        MylinkedPseudoCore_Blue=B;
        Break;
		}
	}
}

simulated function FDSpawnfx (Optional bool FDHardAttach)
{
local Emitter FDEffect;
NetUpdateTime = Level.TimeSeconds - 1;
FDEffect = Spawn(FD_TheFX[0],self,,Location,Rotation);
if ( FDHardAttach == True ) FDEffect.SetBase(self);
}
function FinishedClosing()
{
if (ID==Blue)
   {
   MylinkedPseudoCore_Blue.RequestChangeState(true,,);
   }
else
if (ID==Red)
   {
   MylinkedPseudoCore_Red.RequestChangeState(true,,);
   }
}

function FinishedOpening()
{
if (ID==Blue)
   {
   MylinkedPseudoCore_Blue.RequestChangeState(,,true);
   }
else
if (ID==Red)
   {
   MylinkedPseudoCore_Red.RequestChangeState(,,true);
   }
}
function DoOpen()
{
if (ID==Blue)
   {
   MylinkedPseudoCore_Blue.RequestChangeState(,true,);
   }
else
if (ID==Red)
   {
   MylinkedPseudoCore_Red.RequestChangeState(,true,);
   }
}

function DoClose()
{
if (ID==Blue)
   {
   MylinkedPseudoCore_Blue.RequestChangeState(,true,);
   }
else
if (ID==Red)
   {
   MylinkedPseudoCore_Red.RequestChangeState(,true,);
   }
}

defaultproperties
{
     RealCore_ScanRange=10000.000000
     bBlockKarma=True
}
