//-------------RandomTimedMover   RandomTimedMover --------------------
//
// Fataloverdose (c) 2005 + EF/event/sound Ramndomiser
// DigiMechTech
// www.fataloverose.copperstream.co.uk
// this is the same as the variable timed mover only you dont get to tell it the exact speed
// you want the open/close movements to be performed at. Instead you get to pick
// a max value and the engine does the rest. So each movement will be at a different speed.
//-----------------------------------------------------------

class RTM  extends mover
placeable;

var   float                        FDRealMovetime;  //mapper has no access to
                                                                // this variable as there is no
                                                                // () next to the Var

var() array < Class<emitter> >      FD_TheFX; // This is a dynamic array
                                                                    // <> after array makes
                                                                    // it dynamic.
                                                                    // dynamic= no limit to
                                                                    // places in the array
var() emitter                                   SpawnedFX;
var() Float                                     MaxOpenspeed;
var() Float                                     MaxCloseSpeed;
var() Float                                     workingCloseSpeed;
var() Float                                     workingOpenSpeed;
var() bool                                      FD_FX_Attatch;
var() bool                                      FDFX_bOnOpened;
var() bool                                      FDFX_bOnClosed;
var() bool                                      FDFX_bOnClosing;
var() bool                                      FDFX_bOnOpening;

function postbeginplay()
{
FDRealMovetime=movetime;
RefreshTM();
super.postbeginplay();
}

function FDSpawnfx ()
{
local int r;
r=Rand(FD_TheFX.length-1);  // .Length gives the length of array or
                                          // (how many FX the mapper picked)
NetUpdateTime = Level.TimeSeconds - 1;       // makes sure FX happen
                                                                  // instantly
SpawnedFX= Spawn(FD_TheFX[R],self,,Location+Vect(0,0,1)*450,Rotation);

SpawnedFX.SetBase(self);                          // hard attaches fx to self

}


function RefreshTM()
{
workingOpenSpeed=FRand();
log(workingOpenSpeed);
workingCloseSpeed=FRand();log(workingCloseSpeed);
}

function DoOpen()                                       // Open the mover.
{
RefreshTM();
FDSpawnfx ();
movetime=FDRealMovetime*workingOpenSpeed;
Super.DoOpen();
}

function DoClose()
{
RefreshTM();
movetime=FDRealMovetime*workingCloseSpeed;
super.DoClose();
}

function finishedclosing()
{
SpawnedFX.destroy();
super.FinishedClosing();
}
