//================================================================================
// SpiderCoreMover.
//================================================================================
// This is the base class for the segments that make up the spider core legs
// each leg has a Femur tibia and tarsus
//spidercore movers can toggle hide
//                      Toggle Collision;
//                      Spawn FX
//                      KickVehicles;
// Also surplus to a regular mover
// Variable Open & close times
//
//can get confusing as the scm has to decode the fxcode backwards from the way it was generated
//the due to a small lack of forward planning in the spider brain class i have to re-code the action specific
//arrays in reverse for storage. this is because the fxcode is decoded on the fly to save memory and
//

class SpiderCoreMover extends Mover;

struct                              SequenceData
{
var float                           MyOpenspeed;
var float                           MyCloseSpeed;
Var Float                           MyStayOpenTime;
var Int                             MyFXSpawnCode;
var Int                             MySoundSpawnCode;
var Int                             MyCollisionSpawnCode;
var Int                             MyHideSegSpawnCode;
var Int                             MyKickVehiclesSpawnCode;
var class < emitter >               TheFx[4];
Var array < class<sound> >          TheSound[4];
}; var array < SequenceData>        Kicksequence;

var Int                             CurrentSequenceNum;

var () vector                      AppliedBoostForce;
Var () bool                        bDirectionalBoost;
Var () Sound                       VOC_Boost;


function SpawnFx ()
{
local Emitter SpawnedEffect;
NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn(MySFX,self,,Location,Rotation);
if ( bHardAttachedFX == True ) SpawnedEffect.SetBase(self);
}


function DataPacket(Openspeed,Closespeed,StayOpenTime,FXCode,optional Emitter0Fx,optional Emitter1Fx,optional Emitter2Fx,optional Emitter3Fx,optional Sound0Fx,optional Sound1Fx,optional Sound2Fx,optional Sound3Fx);
{
MyOpenspeed  = NewOpenSpeed;        // first the required variables
MyCloseSpeed = NewCloseSpeed;
StayOpenTime = NewStayOpenTime;
MyFXCode     = FXCode;

if (Emitter0Fx != none) Kicksequence[CurrentSequenceNum].TheFx[0]=Emitter0Fx    // optional variables
if (Emitter1Fx != none) Kicksequence[CurrentSequenceNum].TheFx[1]=Emitter1Fx    // optional variables
if (Emitter2Fx != none) Kicksequence[CurrentSequenceNum].TheFx[2]=Emitter2Fx    // optional variables
if (Emitter3Fx != none) Kicksequence[CurrentSequenceNum].TheFx[3]=Emitter3Fx    // optional variables

if (Sound_0Fx != none) Kicksequence[CurrentSequenceNum].TheSound[0]=Sound0Fx    // optional variables
if (Sound_1Fx != none) Kicksequence[CurrentSequenceNum].TheSound[1]=Sound1Fx    // optional variables
if (Sound_2Fx != none) Kicksequence[CurrentSequenceNum].TheSound[2]=Sound2Fx    // optional variables
if (Sound_3Fx != none) Kicksequence[CurrentSequenceNum].TheSound[3]=Sound3Fx    // optional variables

CurrentSequenceNum++;
}

function RefreshMoveTimes ()
{
Kicksequence[CurrentSequenceNum].MyOpenspeed  *= MoveTime;
Kicksequence[CurrentSequenceNum].MyCloseSpeed *= MoveTime;
}



 //                                             closed    closing    opened    opening
//these functions deal with the fx code
//                                              2            4         8       16        fx
                             //                32           64       128      256        sfx
                             //               512         1024      2048     4096        kickvec's
                             //              8192        16384     32768    65536        collision
                             //            131072       262144    524288  1048576        hide



//










//Toggle Hide
if (fxcode > 1048575 )            // splits up that single huge number into 5 smaller ones
   {                              // still using the binary number system
   fxcode -= 1048575;             // the list is decoded backwards from the way it was generated
   Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode += 16           //closed
   }
if (fxcode > 524288 )
   {
   fxcode -= 524288;
   Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode += 8         //closing
   }
if (fxcode > 262144 )
   {
   fxcode -= 262144;
   Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode += 4       // opened
   }
if (fxcode > 131072 )
   {
   fxcode -= 131072;
   Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode += 2     //opening
   }
//toggle collision
if (fxcode > 65535 )
   {
   fxcode -= 65536;
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode += 16
   }
if (fxcode > 32767 )
   {
   fxcode -= 32768;
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode += 8
   }
if (fxcode > 16383 )
   {
   fxcode -= 16384
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode += 4
   }
if (fxcode > 8191 )
   {
   fxcode -= 8192;
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode += 2
   }
//Kickvecs
if (fxcode > 4195 )                             // 4196-512
   {
   fxcode -= 4196;
   Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode += 16
   }
if (fxcode > 2047 )
   {
   fxcode -= 2048;
   Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode += 8
   }
if (fxcode > 1023 )
   {
   fxcode -= 1024
   Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode += 4
   }
if (fxcode > 511 )
   {
   fxcode -= 512;
   Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode += 2
   }

if (fxcode > 255 )                             // 256-32
   {
   fxcode -= 256;
   Kicksequence[CurrentSequenceNum].MySoundSpawnCode += 16
   }
if (fxcode > 127 )
   {
   fxcode -= 128;
   Kicksequence[CurrentSequenceNum].MySoundSpawnCode += 8
   }
if (fxcode > 63 )
   {
   fxcode -= 64
   Kicksequence[CurrentSequenceNum].MySoundSpawnCode += 4
   }
if (fxcode > 31 )
   {
   fxcode -= 32;
   Kicksequence[CurrentSequenceNum].MySoundSpawnCode += 2
   }

if (fxcode > 15 )                             // 2-32
   {
   fxcode -= 16;
   Kicksequence[CurrentSequenceNum].MyFXSpawnCode += 16
   }
if (fxcode > 7 )
   {
   fxcode -= 8;
   Kicksequence[CurrentSequenceNum].MyFXSpawnCode += 8
   }
if (fxcode > 3 )
   {
   fxcode -= 4
   Kicksequence[CurrentSequenceNum].MyFXSpawnCode += 4
   }
if (fxcode > 1 )
   {
   fxcode -= 2;
   Kicksequence[CurrentSequenceNum].MyFXSpawnCode += 2
   }
//////////////////////////////////////////////////////////////////////////////
// these functions check to see if an action is required
function bool checkhide(int stageNo)   // stage number;- use the current number in the action specific number set  (ie 2,4,8,16)
{
if (Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode > stageNo)
   {
   Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode - stageNo;
   return true;
   }
}

function bool checkcollide(int stageNo)      // stage number;- use the current number in the action specific number set  (ie 2,4,8,16)
{
if (Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode > stageNo)
   {
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode - stageNo;
   return true;
   }
}

function bool checkBoostVec(int stageNo)      // stage number;- use the current number in the action specific number set  (ie 2,4,8,16)
{
if (Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode > stageNo)
   {
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode - stageNo;
   return true;
   }
}

function bool checkSpawnSound(int stageNo)      // stage number;- use the current number in the action specific number set  (ie 2,4,8,16)
{
if (Kicksequence[CurrentSequenceNum].MySoundSpawnCode > stageNo) // was going to have check for 0 value but all stage numbers are higer than 0 already
   {                                                             // so to be in the function at all there must be a number higher than 0
   Kicksequence[CurrentSequenceNum].MySoundSpawnCode - stageNo;
   return true;
   }
}

function bool checkSpawnFX(int stageNo)      // stage number;- use the current number in the action specific number set  (ie 2,4,8,16)
{
if ((Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode != 0) && (Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode > stageNo))
   {
   Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode - stageNo;
   return true;
   }
}



/////////////////////////////////////////////////////////////////////////////
// these functions actually perform the actions  if the results of the checks were ok
Function DoThesound(int timeframe)
{
if  (Kicksequence[CurrentSequenceNum].Thesound[timeframe] !=None) playsound(Kicksequence[CurrentSequenceNum].thesound[timeframe]);
else
   errorLog (1,keynum,int(string(self.tag)),Kicksequence);
}

Function DoTheFx(int timeframe)      // time frame is a simple 1-4 for opening opened closing closed
{
local Emitter spawnedFX;
      if  (Kicksequence[CurrentSequenceNum].TheFx[timeframe] !=None) spawnedFX=(Kicksequence[CurrentSequenceNum].theFx[timeframe];
else
   errorLog (1,keynum,int(string(self.tag)),Kicksequence);
}

Function ToggleHide()
{
if (bHidden)
   {
   bHidden = false;
   SetCollision(true, true, true);
   return;
   }
bHidden = True;
SetCollision(false,false,false);
}

Function ToggleCollision(int timeframe)
{
if (bHidden)
   {
   bHidden = false;
   return;
   }
SetCollision(false,false,false);
}

Function DoBoost(int timeframe)                                     // kicking the vehicles
{
local onsvehicle        WhatIfound;
local vector PointOfBoostForce;
foreach   TouchingActors(class'onsvehicle',whatifound)
          {
          TheTarget.whatifound(  AppliedBoostForce >> TheTarget.Rotation,  PointOfBoostForce >> TheTarget.Rotation );
          }
}


////////////////////////////////////////////////////////////////////////////////////////////////
// these are the overwritten classes from the move class

function DoOpen ()                           // stage number for open is 16
{
MoveTime = MyOpenspeed;
if (checkhide(16))       ToggleHide();
if (checkcollide(16))    ToggleCollision();
if (checkBoostVec(16))   DoBoost();
if (checkSpawnSound(16)) DoThesound;
if (checkSpawnFX(16))    DoTheFx;
}
  Super.DoOpen();
}

function DoOpened()                           // stage number for opened is 8
{
MoveTime = MyOpenspeed;
if (checkhide(8))       ToggleHide();
if (checkcollide(8))    ToggleCollision();
if (checkBoostVec(8))   DoBoost();
if (checkSpawnSound(8)) DoThesound;
if (checkSpawnFX(8))    DoTheFx;
}
  Super.DoOpen();
}

function Doclosing ()                           // stage number for closing is 4
{
MoveTime = MyOpenspeed;
if (checkhide(4))       ToggleHide();
if (checkcollide(4))    ToggleCollision();
if (checkBoostVec(4))   DoBoost();
if (checkSpawnSound(4)) DoThesound;
if (checkSpawnFX(4))    DoTheFx;
}
  Super.DoOpen();
}

function FinishedClosing ()
{
  Super.FinishedClosing();
  if ( MySFXCode > 1 )
  {
    MySFXCode -= 2;
    SpawnFx();
  }
  ClearMovetimes();
}

function ClearMovetimes ()
{
  MyOpenspeed = 1.0;
  MyCloseSpeed = 1.0;
  StayOpenTime = 1.0;
  DelayTime = 0.0;
  MoveTime = 1.0;
  bImTheLastSeg = False;
  MySFXCode = 0;
  MySFX = None;
}

Function errorLog(int errormessagenumber,optional int sparevalue,optional int spare2value,optional int spare3value,optional bool bscantouchingactors)
{
local int R;
local actor whatIfound; // empty variable of type actor to recieve the details of any found actors if bscantouchingactors=true
log("==========================================================================");
log("==           **       Spider Core Error Report        **
log("== Status:");
log("== Tag is"$tag$" the current keyframe is "$keynum$"the current kicksequence is"$CurrentSequenceNum);
log("My open speed is"$Kicksequence[CurrentSequenceNum].MyOpenspeed$"My close speed is"$Kicksequence[CurrentSequenceNum].Myclosespeed$"My stayopentime is"$stayopentime);
log("FX Code list:"$);
log("MyFXSpawnCode"$Kicksequence[CurrentSequenceNum].MyFXSpawnCode$" MySoundSpawnCode is "$Kicksequence[CurrentSequenceNum].MySoundSpawnCode);
log("MyCollisionSpawnCode"$Kicksequence[CurrentSequenceNum].MyCollisionSpawnCode$" MyHideSegSpawnCode is "$Kicksequence[CurrentSequenceNum].MyHideSegSpawnCode$"MyKickVehiclesSpawnCode"$Kicksequence[CurrentSequenceNum].MyKickVehiclesSpawnCode) ;


//number specific
if (errormessagenumber==1) Warn ("The was a call to spawn At key num"$sparevalue$" on leg number"$spare2value"$but no emitter FX was specified at that timeframe in sequence"$spare3value);
if (errormessagenumber==1) Warn ("there has been a numerical error:-with the fx code. I was expecting "$sparevalue$" but got "$spare2value);

//lol
GenerateRNDInsult();

// scan touching actors
if (bScanforTouchingactors) foreach touchingactors(class'actor', whatifound
                                                  {
                                                  log ("Im being touched by"$whatifound);
                                                  }



log ("dont stress... :)");
}


state() FatalTimedMover extends TriggerOpenTimed
{
  function Trigger (Actor Other, Pawn EventInstigator)
  {
    Log("Ive been triggered!! " $ string(self.Class) $ " " $ string(self.Tag) $ " by " $ string(Other) $ string(EventInstigator));
    if ( SpiderBrain(Other) == MyBrain )
    {
      Log("Trigger authorised");
    } else {
      Log("trigger request was denied as i dont know what sent it");
      return;
    }
    Super.Trigger(Other,EventInstigator);
  }

}


Fucntion GenerateRNDInsult()
{
local int A[5];local string themessege[4];

for ( A[0]=1 ;  A[0] < 5 ; A[0]++ ) A[A[0]]=(Rand(9)+1);

if ( A[1] == 0 ) themessege[1] = "== you ";
else
if ( A[1] == 1 ) themessege[1] = "== Your Mum ";
else
if ( A[1] == 2 ) themessege[1] = "== your Girlfriend ";
else
if ( A[1] == 3 ) themessege[1] = "== your dream Guy ";
else
if ( A[1] == 4 ) themessege[1] = "== your dream girl ";
else
if ( A[1] == 5 ) themessege[1] = "== your best friend ";
else
if ( A[1] == 6 ) themessege[1] = "== your Gran ";
else
if ( A[1] == 7 ) themessege[1] = "== your Dog ";
else
if ( A[1] == 8 ) themessege[1] = "== your only true love ";
else
if ( A[1] == 9 ) themessege[1] = "== your Dream Date ";
else
if ( A[1] == 10 ) themessege[1] = "== your secret admierer ";

if ( A[2] == 0 ) themessege[2] = "Sucks ";
else
if ( A[2] == 1 ) themessege[2] = "Smells of ";
else
if ( A[2] == 2 ) themessege[2] = "eats ";
else
if ( A[2] == 3 ) themessege[2] = "Downloads pictures of ";
else
if ( A[2] == 4 ) themessege[2] = "Gets excited by ";
else
if ( A[2] == 5 ) themessege[2] = "Smokes ";
else
if ( A[2] == 6 ) themessege[2] = "makes secret vidios about ";
else
if ( A[2] == 7 ) themessege[2] = "Downloads pictures of ";
else
if ( A[2] == 8 ) themessege[2] = "Has been to jail for ";
else
if ( A[2] == 9 ) themessege[2] = "Has sweaty dreams about ";
else
if ( A[2] == 10 ) themessege[2] = "wants to marry ";

if ( A[3] == 0 ) themessege[3] = "the mentaly degranged ";
else
if ( A[3] == 1 ) themessege[3] = "Earwax ";
else
if ( A[3] == 2 ) themessege[3] = "Armpits ";
else
if ( A[3] == 3 ) themessege[3] = "Unwashed feet ";
else
if ( A[3] == 4 ) themessege[3] = "public toilets ";
else
if ( A[3] == 5 ) themessege[3] = "RoadKill ";
else
if ( A[3] == 6 ) themessege[3] = "soiled underware ";
else
if ( A[3] == 7 ) themessege[3] = "Old socks ";
else
if ( A[3] == 8 ) themessege[3] = "a cheap whore ";
else
if ( A[3] == 9 ) themessege[3] = "jockstraps ";
else
if ( A[3] == 10 ) themessege[3] = "soiled underware ";
log (themessege[1]$themessege[2]$themessege[3]);
}

defaultproperties
{
    MyOpenspeed=1.00

    MyCloseSpeed=1.00

    MoverEncroachType=3

    NumKeys=5

    StayOpenTime=1.00

    CullDistance=30000.00

    InitialState=FatalTimedMover

    bBlockKarma=True

}
