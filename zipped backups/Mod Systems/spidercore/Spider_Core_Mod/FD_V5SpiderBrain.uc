//
//

class FD_V5SpiderBrain extends triggers;




var FD_VTMover    SC_Seg[25];
Var Int                Fd_ReactionsTotal;
var Int                SC_SegCounter;
var int                FD_RandNumber;
var Int                FDTempCounter;
var int                i;
var float              FDSleepTime;

struct                 kickformat
{
var int                  FDleg;

var() Class<FD_FX>       FD_TheFX;
var() Bool               FDFX_HardAttatch;
Var() float              FD_Kickdelay;
var() float              FD_OpenSpeed;
var() float              FD_CloseSpeed;
Var() Float              FD_StayOpenTime;
Var() bool               FDFX_bAtBody;
Var() bool               FDFX_bAtFemur;
Var() bool               FDFX_bAtTibia;
Var() bool               FDFX_bAtTarsus;
Var() bool               FDFX_bWhenOpening;
Var() bool               FDFX_bWhenOpened;
Var() bool               FDFX_bWhenClosing;
Var() bool               FDFX_bWhenClosed;


} ;

struct reactions
{
Var()           Int FD_Kick1;
var()           kickformat FD_Kick1Extra;
Var()           Int FD_Kick2;
var()           kickformat FD_Kick2Extra;
Var()           Int FD_Kick3;
Var()           kickformat FD_Kick3Extra;
Var()           Int FD_Kick4;
Var()           kickformat FD_Kick4Extra;
Var()           Int FD_Kick5;
Var()           kickformat FD_Kick5Extra;
Var()           Int FD_Kick6;
Var()           kickformat FD_Kick6Extra;
Var()           Int FD_Kick7;
var()           kickformat FD_Kick7Extra;
Var()           Int FD_Kick8;
var()           kickformat FD_Kick8Extra;
} ;
var(ReactionsList) reactions FDReactionList[17];

struct reallist
{
var () kickformat kick[9];
}; var reallist FD_ReactionsReordered[17];


function postbeginplay()
{
local FD_VTMover m;local int II;

for (i=1;i<17;i++)     // taking kickextra + kick and adding them to new
    {                      // array for easyer processing
    FD_ReactionsReordered[i].Kick[1]=FDReactionList[i].FD_Kick1Extra;
    FD_ReactionsReordered[i].Kick[1].FDleg=FDReactionList[i].FD_Kick1;
    FD_ReactionsReordered[i].Kick[2]=FDReactionList[i].FD_Kick2Extra;
    FD_ReactionsReordered[i].Kick[2].FDleg=FDReactionList[i].FD_Kick2;
    FD_ReactionsReordered[i].Kick[3]=FDReactionList[i].FD_Kick3Extra;
    FD_ReactionsReordered[i].Kick[3].FDleg=FDReactionList[i].FD_Kick3;
    FD_ReactionsReordered[i].Kick[4]=FDReactionList[i].FD_Kick4Extra;
    FD_ReactionsReordered[i].Kick[4].FDleg=FDReactionList[i].FD_Kick4;
    FD_ReactionsReordered[i].Kick[5]=FDReactionList[i].FD_Kick5Extra;
    FD_ReactionsReordered[i].Kick[5].FDleg=FDReactionList[i].FD_Kick5;
    FD_ReactionsReordered[i].Kick[6]=FDReactionList[i].FD_Kick6Extra;
    FD_ReactionsReordered[i].Kick[6].FDleg=FDReactionList[i].FD_Kick6;
    FD_ReactionsReordered[i].Kick[7]=FDReactionList[i].FD_Kick7Extra;
    FD_ReactionsReordered[i].Kick[7].FDleg=FDReactionList[i].FD_Kick7;
    FD_ReactionsReordered[i].Kick[8]=FDReactionList[i].FD_Kick8Extra;
    FD_ReactionsReordered[i].Kick[8].FDleg=FDReactionList[i].FD_Kick8;


log ("FDReactionList["$i$"].FD_Kick1="$FDReactionList[i].FD_Kick1); // reports Number of first leg in each sequence

if (FDReactionList[i+1].FD_Kick1==0)      // checks for empty leg1 slot in the NEXT set of reactionrecorded so that the Rand isnt to high
   {                                    // then considderes the array full
   log("ok");log("as FDReactionList["$i$"].FD_Kick1.=="$FDReactionList[i].FD_Kick1);

   Fd_ReactionsTotal=i;
   log("im setting Fd_ReactionsTotal="$Fd_ReactionsTotal);

   break;
   }
   }
// the rection list shouldnow be easyer to process as a single array can
// be used in a for next loop

// checking the new array
log ("checking the new array");
for (i=1;i<Fd_ReactionsTotal+1;i++)
{
log("i is...==============================================="$i);
for (II=1;II<9;II++)
{
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDLeg is "$FD_ReactionsReordered[i].Kick[ii].FDLeg);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FD_CloseSpeed is "$FD_ReactionsReordered[i].Kick[ii].FD_CloseSpeed);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FD_OpenSpeed is "$FD_ReactionsReordered[i].Kick[ii].FD_OpenSpeed);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FD_stayopentime is "$FD_ReactionsReordered[i].Kick[ii].FD_stayopentime);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FD_Kickdelay is "$FD_ReactionsReordered[i].Kick[ii].FD_Kickdelay);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bAtBody;"$FD_ReactionsReordered[i].Kick[ii].FDFX_bAtBody);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bAtFemur"$FD_ReactionsReordered[i].Kick[ii].FDFX_bAtFemur);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bAtTibia"$FD_ReactionsReordered[i].Kick[ii].FDFX_bAtTibia);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bAtTarsus"$FD_ReactionsReordered[i].Kick[ii].FDFX_bAtTarsus);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bWhenOpening"$FD_ReactionsReordered[i].Kick[ii].FDFX_bWhenOpening);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bWhenOpened"$FD_ReactionsReordered[i].Kick[ii].FDFX_bWhenOpened);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bWhenClosing"$FD_ReactionsReordered[i].Kick[ii].FDFX_bWhenClosing);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bWhenClosed"$FD_ReactionsReordered[i].Kick[ii].FDFX_bWhenClosed);
log ("FD_ReactionsReordered["$i$"].Kick["$ii$"].FDFX_bWhenClosed"$FD_ReactionsReordered[i].Kick[ii].FDFX_bWhenClosed);
}

}




//detecting the leg segments and assigning there valid actor references into
// an array
foreach RadiusActors(class'FD_VTMover', M,50000)
{

log ("M.tag is ="$M.tag);
if (M.Tag=='Bleg1')  SC_Seg[1]=M;     // setup fEMUR   1
if (M.Tag=='Bleg2')  SC_Seg[2]=M;     // setup Tibia   1
if (M.Tag=='Bleg3')  SC_Seg[3]=M;     // setup Tarsus  1
if (M.Tag=='Bleg4')  SC_Seg[4]=M;     // setup fEMUR   2
if (M.Tag=='Bleg5')  SC_Seg[5]=M;     // setup Tibia   2
if (M.Tag=='Bleg6')  SC_Seg[6]=M;     // setup Tarsus  2
if (M.Tag=='Bleg7')  SC_Seg[7]=M;     // setup fEMUR   3
if (M.Tag=='Bleg8')  SC_Seg[8]=M;     // setup Tibia   3
if (M.Tag=='Bleg1b') SC_Seg[9]=M;     // setup Tarsus  3
if (M.Tag=='Bleg2b') SC_Seg[10]=M;    // setup fEMUR   4
if (M.Tag=='Bleg3b') SC_Seg[11]=M;    // setup Tibia   4
if (M.Tag=='Bleg4b') SC_Seg[12]=M;    // setup Tarsus  4
if (M.Tag=='Bleg5b') SC_Seg[13]=M;    // setup fEMUR   5
if (M.Tag=='Bleg6b') SC_Seg[14]=M;    // setup Tibia   5
if (M.Tag=='Bleg7b') SC_Seg[15]=M;    // setup Tarsus  5
if (M.Tag=='Bleg8b') SC_Seg[16]=M;    // setup fEMUR   6
if (M.Tag=='Bleg1c') SC_Seg[17]=M;    // setup Tibia   6
if (M.Tag=='Bleg2c') SC_Seg[18]=M;    // setup Tarsus  6
if (M.Tag=='Bleg3c') SC_Seg[19]=M;    // setup fEMUR   7
if (M.Tag=='Bleg4c') SC_Seg[20]=M;    // setup Tibia   7
if (M.Tag=='Bleg5c') SC_Seg[21]=M;    // setup Tarsus  7
if (M.Tag=='Bleg6c') SC_Seg[22]=M;    // setup fEMUR   8
if (M.Tag=='Bleg7c') SC_Seg[23]=M;    // setup Tibia   8
if (M.Tag=='Bleg8c') SC_Seg[24]=M;    // setup Tarsus  8
}
log("The SC_Seg array is...");
for (i=1;I<25;I++)
    {
    log ("counter is .."$i);
    log ("scseg(counter).tag is..."$SC_Seg[i].tag);
    }
UpdateLegs();
}

function UpdateLegs()
{
local int segmentNumbers[4];local int temp;

log("=====================================");
FD_RandNumber=Rand(FD_ReactionsTotal);
log ("your random number is..."$FD_RandNumber);
FD_RandNumber++;                                                  // adding 1 to the rand number so as not to include 0
log ("added 1 so FD_RandNumber now ="$FD_RandNumber);            // in the final result
log("=====================================");
//

// finding out the first leg number     =================================================================
segmentNumbers[1]=FD_ReactionsReordered[FD_RandNumber].kick[1].fdLeg;                                   //=
log ("first leg number is"$segmentNumbers[1]);
//                                                                                                      //=
//working out other leg numbers
temp=segmentNumbers[1];                         //so we dont mes with the original number
for (i=2;i<4;i++)                              // start at 2 as we already have segmentnumbers[1] set ok
{                                                                                 // will do 2 loops
temp+=8;
segmentNumbers[i]=temp;log ("The segment number assigned is..."$segmentNumbers[i]);

}
log("read back numbers for checking");           // read back numbers for checking
for (i=1;I<4;i++)
    {
    log ("checking;-"$segmentNumbers[i]);       //segmentnumbers[1] now = the mating first legnumber
    }
log("Checking complete");
// setup loop to assign the value to the 3 different segments
for (i=1;I<4;I++)
{
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_OpenSpeed   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FD_OpenSpeed);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_CloseSpeed  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FD_CloseSpeed);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_StayOpenTime="$FD_ReactionsReordered[FD_RandNumber].kick[1].FD_StayOpenTime);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_TheFX       ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FD_TheFX);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FDFX_HardAttatch  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_HardAttatch);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_Kickdelay   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FD_Kickdelay);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FDFX_HardAttatch  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtBody);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_Kickdelay   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtFemur);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FDFX_HardAttatch  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtTibia);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_Kickdelay   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtTarsus);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FDFX_HardAttatch  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenOpening);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_Kickdelay   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenOpened);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FDFX_HardAttatch  ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenClosing);
Log("FD_ReactionsReordered["$FD_RandNumber$"].kick[1].FD_Kickdelay   ="$FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenClosed);
}


//  assign to the segs
for (i=1;I<4;i++)
    {
    SC_Seg[segmentNumbers[i]].FD_OpenSpeed=FD_ReactionsReordered[FD_RandNumber].kick[1].FD_OpenSpeed;
    SC_Seg[segmentNumbers[i]].FD_CloseSpeed=FD_ReactionsReordered[FD_RandNumber].kick[1].FD_CloseSpeed;
    SC_Seg[segmentNumbers[i]].FD_StayOpenTime=FD_ReactionsReordered[FD_RandNumber].kick[1].FD_StayOpenTime;
    SC_Seg[segmentNumbers[i]].FD_TheFX=FD_ReactionsReordered[FD_RandNumber].kick[1].FD_TheFX;
    SC_Seg[segmentNumbers[i]].FDFX_bHardAttatch=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_HardAttatch;
    SC_Seg[segmentNumbers[i]].FDFX_bAtBody=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtBody;
    SC_Seg[segmentNumbers[i]].FDFX_bAtFemur=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtFemur;
    SC_Seg[segmentNumbers[i]].FDFX_bAtTibia=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtTibia;
    SC_Seg[segmentNumbers[i]].FDFX_bAtTarsus=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bAtTarsus;
    SC_Seg[segmentNumbers[i]].FDFX_bWhenOpening=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenOpening;
    SC_Seg[segmentNumbers[i]].FDFX_bWhenOpened=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenOpened;
    SC_Seg[segmentNumbers[i]].FDFX_bWhenClosing=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenClosing;
    SC_Seg[segmentNumbers[i]].FDFX_bWhenClosed=FD_ReactionsReordered[FD_RandNumber].kick[1].FDFX_bWhenClosed;
    SC_Seg[segmentNumbers[i]].FD_Update();
}
log("ok lets read back the segs to see if the values are set ok");
for (i=1;I<4;i++)
    {
    log("the seg["$SC_Seg[segmentNumbers[i]]$"] FD_OpenSpeed is.."$SC_Seg[segmentNumbers[i]].FD_OpenSpeed);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FD_CloseSpeed is.."$SC_Seg[segmentNumbers[i]].FD_CloseSpeed);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FD_StayOpenTime is.."$SC_Seg[segmentNumbers[i]].FD_StayOpenTime);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FD_TheFX is.."$SC_Seg[segmentNumbers[i]].FD_TheFX);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"] FDFX_bAtBody is.."$SC_Seg[segmentNumbers[i]].FDFX_bAtBody);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bAtFemur is.."$SC_Seg[segmentNumbers[i]].FDFX_bAtFemur);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bAtTibia is.."$SC_Seg[segmentNumbers[i]].FDFX_bAtTibia);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bAtTarsus is.."$SC_Seg[segmentNumbers[i]].FDFX_bAtTarsus);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"] FDFX_bWhenOpening is.."$SC_Seg[segmentNumbers[i]].FDFX_bWhenOpening);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bWhenOpened is.."$SC_Seg[segmentNumbers[i]].FDFX_bWhenOpened);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bWhenClosing is.."$SC_Seg[segmentNumbers[i]].FDFX_bWhenClosing);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bWhenClosed is.."$SC_Seg[segmentNumbers[i]].FDFX_bWhenClosed);
    log("the seg["$SC_Seg[segmentNumbers[i]]$"]FDFX_bWhenClosed is.."$SC_Seg[segmentNumbers[i]].FDFX_bHardAttatch) ;
}
}

auto state FD_ReadyAndWaiting
{

function Trigger( actor Other, pawn EventInstigator )
	{
	log ("i was triggered");
	gotostate('FD_ActivateReactionSequence');
	}

begin:
log("I am Now in state ready and waiting");

}

state FD_ActivateReactionSequence

{
ignores trigger;






begin:



for (I=1;I<9;I++)
    {
    TriggerEvent(SC_Seg[FD_ReactionsReordered[FD_RandNumber].kick[I].FDLeg ].Tag, self, instigator);
    Sleep(FD_ReactionsReordered[FD_RandNumber].kick[I].FD_Kickdelay);
    }
log ("going to state ready any waiting");
gotostate('FD_ReadyAndWaiting');
}




defaultproperties
{
     SC_SegCounter=1
     FDSleepTime=1.000000
     FDReactionList(1)=(FD_Kick1=1,FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick2=2,FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick3=3,FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick4=4,FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick5=5,FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick6=6,FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick7=7,FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True),FD_Kick8=8,FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000,FDFX_bAtFemur=True,FDFX_bWhenClosed=True))
     FDReactionList(2)=(FD_Kick1=2,FD_Kick1Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick2=3,FD_Kick2Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick3=4,FD_Kick3Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick4=5,FD_Kick4Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick5=6,FD_Kick5Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick6=7,FD_Kick6Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick7=8,FD_Kick7Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True),FD_Kick8=1,FD_Kick8Extra=(FD_Kickdelay=2.000000,FD_OpenSpeed=2.000000,FD_CloseSpeed=2.000000,FD_StayOpenTime=2.000000,FDFX_bAtTarsus=True,FDFX_bWhenClosing=True))
     FDReactionList(3)=(FD_Kick1=3,FD_Kick1Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick2=4,FD_Kick2Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick3=5,FD_Kick3Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick4=6,FD_Kick4Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick5=7,FD_Kick5Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick6=8,FD_Kick6Extra=(FDFX_HardAttatch=True,FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True),FD_Kick7=1,FD_Kick7Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True),FD_Kick8=2,FD_Kick8Extra=(FD_Kickdelay=3.000000,FD_OpenSpeed=3.000000,FD_CloseSpeed=3.000000,FD_StayOpenTime=3.000000,FDFX_bAtTibia=True,FDFX_bWhenOpening=True))
     FDReactionList(4)=(FD_Kick1=4,FD_Kick1Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick2=5,FD_Kick2Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick3=6,FD_Kick3Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick4=7,FD_Kick4Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick5=8,FD_Kick5Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick6=1,FD_Kick6Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick7=2,FD_Kick7Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True),FD_Kick8=3,FD_Kick8Extra=(FDFX_HardAttatch=True,FD_Kickdelay=4.000000,FD_OpenSpeed=4.000000,FD_CloseSpeed=4.000000,FD_StayOpenTime=4.000000,FDFX_bAtBody=True,FDFX_bAtFemur=True,FDFX_bAtTibia=True,FDFX_bAtTarsus=True,FDFX_bWhenOpening=True,FDFX_bWhenOpened=True,FDFX_bWhenClosing=True,FDFX_bWhenClosed=True))
     FDReactionList(5)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(6)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(7)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(8)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(9)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(10)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(11)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(12)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(13)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(14)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(15)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     FDReactionList(16)=(FD_Kick1Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick2Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick3Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick4Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000),FD_Kick5Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick6Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick7Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000),FD_Kick8Extra=(FD_Kickdelay=1.000000,FD_OpenSpeed=1.000000,FD_CloseSpeed=1.000000,FD_StayOpenTime=1.000000))
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'SpiderCore_Mesh.NO.way'
}
