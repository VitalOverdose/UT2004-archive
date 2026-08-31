//-------------FD_VTM  VariableTimedMover--------------------
//
// Fataloverdose (c) 2005 + EF/event/sound Ramndomiser
// DigiMechTech
// www.fataloverose.copperstream.co.uk
//-----------------------------------------------------------

class FD_VTM extends mover
placeable;

var() array < Class<FD_FX> > FD_TheFX;
var() Float                  FD_Openspeed;
var() Float                  FD_CloseSpeed;
var() bool                   FD_FX_Attatch;
var() bool                   FDFX_bOnOpened;
var() bool                   FDFX_bOnClosed;
var() bool                   FDFX_bOnClosing;
var() bool                   FDFX_bOnOpening;
var float                    FDRealMovetime;

function postbeginplay()
{
Local Int I,fdtemp;
FDRealMovetime=movetime;                  // backup movetime
for (i=FD_TheFX.Length;i>0;I--)
     {
     FD_TheFX[i+1]=FD_TheFX[i];
     fdtemp=Rand(FD_TheFX.Length-1);fdtemp++; FD_TheFX[0]=FD_TheFX[fdtemp]; // the rnd line
     }
super.postbeginplay();
}

function FDSpawnfx (Optional bool FDHardAttach)
{
local FD_FX FDEffect;
NetUpdateTime = Level.TimeSeconds - 1;
FDEffect = Spawn(FD_TheFX[0],self,,Location,Rotation);
if ( FDHardAttach == True ) FDEffect.SetBase(self);
}

function FinishedClosing()
{
local int fdtemp;
if ((FD_TheFX[1] != None ) && (FDFX_bOnClosed==True)) FDSpawnfx(FD_FX_Attatch);
fdtemp=Rand(FD_TheFX.Length-1);fdtemp++;FD_TheFX[0]=FD_TheFX[fdtemp];    // the rnd line
Super.FinishedClosing();
}

function FinishedOpening()
{
if ((FD_TheFX[1] != None ) && (FDFX_bOnOpened==True)) FDSpawnfx(FD_FX_Attatch);
Super.FinishedOpening();
}

function DoOpen()                                       // Open the mover.
{
movetime=FDRealMovetime*FD_Openspeed;
if ((FD_TheFX[1] != None ) && (FDFX_bOnOpening==True)) FDSpawnfx(FD_FX_Attatch);

Super.DoOpen();
}

function DoClose()
{
movetime=FDRealMovetime*FD_CloseSpeed;
if (( FD_TheFX[1] != None ) && (FDFX_bOnClosing==True)) FDSpawnfx(FD_FX_Attatch);
super.DoClose();
}

defaultproperties
{
     FD_Openspeed=1.000000
     FD_CloseSpeed=1.000000
     bBlockKarma=True
}
