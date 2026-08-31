class TimedVehicleControler extends TimedControler
Placeable;

var ONSVehicle               MyTarget;
var float                    NewGravity,OldGravValue,SingleTimeSlice,decreaseAmount,GravStepAmount,OriginalGrav;
var array < class<Emitter> > SFX;  /// have use defaults to preset fx
var int                      SpareValues[2],Counter,Slices;
var sound                    SpawnedSounD,DestroySound;
var Emitter                  SpawnedEffect;


Function PostbeginPlay()
{
if (SpawnedSounD!=None) Playsound(SpawnedSounD);
}

function DataPacket ( Actor Target,float NewGrav,Float LifeTime,Int timeSlices,Bool bFX,Bool bAttachFX, Optional float  StartSlide )
{
local float GravDifference;
NewGravity=newgrav;
MyTarget=onsvehicle(Target);
Slices=timeSlices;

OriginalGrav=MyTarget.KgetActorGravscale();        // backup original

SingleTimeSlice    =LifeTime / Slices;                // cal single time slice

GravDifference=OriginalGrav   - NewGrav;
GravStepAmount  =GravDifference / Slices;           // calc decrease per tick

MyTarget.KSetActorGravScale(NewGrav);              // set new grav

if (bFX==True) DoFX(bAttachFX);               //The Visual SFX
if (slices>0) if ( StartSlide < 1 )
   {
   SingleTimeSlice = LifeTime;
   gotostate( 'Timing' , 'Noslide' );
   }
gotostate ( 'Timing' );
}

State Timing
{
Begin:

for ( Counter = 1 ; Counter < Slices; Counter++ )
    {
    Sleep(SingleTimeSlice);
    newgravity+=GravStepAmount;
    MyTarget.KsetMass(newgravity);
    }

Noslide:
Sleep(SingleTimeSlice);
MyTarget.KSetActorGravScale(OriginalGrav);
}

Function DoFX ( bool HardAttachTheFX  )                                                           // ====== FD_DoRNDFX() =====
{
local int RandomNumber;
RandomNumber=rand(SFX.length);   //   randomnumber=RAND(length of SFX array)
NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn  ( SFX[RandomNumber] , self , , Location , Rotation ) ;                   // Spawn FX
If (HardAttachTheFX!=False) SpawnedEffect.SetBase( self );                             // HardattachFX
}

state Suicide
{
begin:
SpawnedEffect.Destroy();
if (DestroySound!=None) Playsound (DestroySound);
Destroy();
}

