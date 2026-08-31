//------------- VTM  VariableTimedMover--------------------
//
// Fataloverdose (c) 2005 + EF/event/sound Ramndomiser
// DigiMechTech
// www.fataloverose.copperstream.co.uk
// a variable timed mover with rnd fx
// pick as many fx as you want and the engine will pick one at random at
// whatever time frame you specify (eg opening,opened,close..etc).
//-----------------------------------------------------------

class  VTM extends mover
placeable;

var(ManiacRacing) array < Class< SFX> >   TheFX;
var(ManiacRacing) Float                  OpenSpeedMultiplyer;
var(ManiacRacing) Float                  CloseSpeedMultiplyer;
var(ManiacRacing) bool                   bFXAttatch;
var(ManiacRacing) bool                   bFXOnOpened;
var(ManiacRacing) bool                   bFXOnClosed;
var(ManiacRacing) bool                   FX_bOnClosing;
var(ManiacRacing) bool                   bFXOnOpening;
var float                                RealMovetime;

function postbeginplay()
{
Local Int I,TempValue;
RealMovetime=movetime;                  // backup movetime
for (i= TheFX.Length;i>0;I--)
     {
      TheFX[i+1]= TheFX[i];
     TempValue=Rand( TheFX.Length-1);TempValue++;  TheFX[0]= TheFX[TempValue]; // the rnd line
     }
super.postbeginplay();
}

function FDSpawnfx (Optional bool bHardAttach)
{
local  SFX SpawnedEffect;
NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn( TheFX[0],self,,Location,Rotation);
if ( bHardAttach == True ) SpawnedEffect.SetBase(self);
}

function FinishedClosing()
{
local int TempValue;
if (( TheFX[1] != None ) && (bFXOnClosed==True)) FDSpawnfx( bFXAttatch);
TempValue=Rand( TheFX.Length-1);TempValue++; TheFX[0]= TheFX[TempValue];    // the rnd line
Super.FinishedClosing();
}

function FinishedOpening()
{
if (( TheFX[1] != None ) && (bFXOnOpened==True)) FDSpawnfx( bFXAttatch);
Super.FinishedOpening();
}

function DoOpen()                                       // Open the mover.
{
movetime=RealMovetime*OpenSpeedMultiplyer;
if (( TheFX[1] != None ) && (bFXOnOpening==True)) FDSpawnfx( bFXAttatch);
Super.DoOpen();
}

function DoClose()
{
movetime=RealMovetime* CloseSpeedMultiplyer;
if ((  TheFX[1] != None ) && (FX_bOnClosing==True)) FDSpawnfx( bFXAttatch);
super.DoClose();
}

defaultproperties
{
OpenSpeedMultiplyer=1.000000
CloseSpeedMultiplyer=1.000000
bBlockKarma=True
}
