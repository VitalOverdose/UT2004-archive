//================================================================================
// SpiderBrain.
//================================================================================
///
/// lost and found
//Struct                                          BinCodes
//{
//Var() Int                                       BinaryCodes[5];
//};
//Struct                            Bools                  //to be Coded  ;
//{
//Var() Bool                        16xBools[4];
//};



Class SpiderBrain extends SpiderCoreToolBox
Placeable;

Var(TestMode) Bool                EngageTestMode;
Var Int                           RNDNo,KickCouter;

Struct                            TimeFrame
{
Var() Bool                        _OnOpening;
Var() Bool                        _OnOpened;
Var() Bool                        _OnClosing;
Var() Bool                        _OnClosed;
};

///////////////////////////////////MapperFormat
//This is the kicksequnce properties as the mapper sees them.

Struct                             KickDetails_MapperFormat
{
Var() Int                          LegNo;
Var() Float                        OpenSpeed
Var() Float                        CloseSpeed
Var() Float                        StayOpenTime
Var() Float                        Kickdelay;

Var() Class<Emitter>               OpeningFX;
Var() Class<Emitter>               OpenedFX;
Var() Class<Emitter>               ClosingFX;
Var() Class<Emitter>               ClosedFX;
Var() TimeFrame                    hAttachFX2ParentSeg;

Var() Class<Sound>                 OpeningSFX;
Var() Class<Sound>                 OpenedSFX;
Var() Class<Sound>                 CloseingSFX;
Var() Class<Sound>                 ClosedSFX;

Var() TimeFrame                    SpawnFXOnFemur;
Var() TimeFrame                    SpawnFXOnTibia;
Var() TimeFrame                    SpawnFXOnTarsus;
Var() TimeFrame                    SpawnFXOnBody;

Var() TimeFrame                    SoundFXOnFemur;
Var() TimeFrame                    SoundFXOnTibia
Var() TimeFrame                    SoundFXOnTarsus
Var() TimeFrame                    SoundFXOnBody;

Var() TimeFrame                    ToggleHideOnFemur;
Var() TimeFrame                    ToggleHideOnTibia;
Var() TimeFrame                    ToggleHideOnTarsus;
Var() TimeFrame                    ToggleHideOnNone;

Var() TimeFrame                    ToggleCollisionONFemur;
Var() TimeFrame                    ToggleCollisionONTibia;
Var() TimeFrame                    ToggleCollisionOnTarsus;
Var() TimeFrame                    ToggleCollisionONNone;

Var() TimeFrame                    KickVecsONFemur;
Var() TimeFrame                    KickVecsONTibia;
Var() TimeFrame                    KickVecsOnTarsus;
Var() TimeFrame                    KickVecsONBody;
};


//
Struct                                          MapperFormat           //They are set out this way so the mapper can see the order the legs are triggered
{
Var() Int                                       Kick1Leg;              //Kick1Leg  = 0                                   (FirstLegNumToTrigger)
Var() Int                                       Kick2Leg;              //Kick1Details+                                    (associated details)
Var() Int                                       Kick3Leg;              //Kick2Leg  = 0                                   (SecondLegNumToTrigger)
Var() Int                                       Kick4Leg;              //Kick2Details+                                    (associated details)
Var() Int                                       Kick5Leg;              //Kick3Leg  = 0                                   (SecondLegNumToTrigger)
Var() Int                                       Kick6Leg;              //Kick3Details+                                    (associated details)
Var() Int                                       Kick7Leg;
Var() Int                                       Kick8Leg;
Var() Array< KickDetails_MapperFormat >         Kick1Details;
Var() Array< KickDetails_MapperFormat >         Kick2Details;
Var() Array< KickDetails_MapperFormat >         Kick3Details;
Var() Array< KickDetails_MapperFormat >         Kick4Details;
Var() Array< KickDetails_MapperFormat >         Kick5Details;
Var() Array< KickDetails_MapperFormat >         Kick6Details;
Var() Array< KickDetails_MapperFormat >         Kick7Details;
Var() Array< KickDetails_MapperFormat >         Kick8Details;
}; Var() Array < MapperFormat >                 KickSequence;

Struct                                          SecondArrayType
{
Var() KickDetails_MapperFormat                  TempKDetails[9];
};Var() Array < SecondArrayType >               SecondArray;

Struct                                          FinalArrayFormat
{
Var Class<Emitter>                              TheFX[4];                       // FinalArray.ThelegNum.TheFX[1-4]
Var Class<Sound>                                TheSFX[4];                      // FinalArray.ThelegNum.TheSFX[1-4]
Var Int                                         FemCode;
Var Int                                         TibCode;
Var Int                                         TarCode;
Var Int                                         BodCode;
Var Int                                         IntOpenSpeed;
Var Int                                         IntCloseSpeed;
Var Int                                         IntStayOpenTime;
Var Int                                         IntKickDelay;
};

Struct                              Finaly
{
Var FinalArrayFormat                TheLegNum[8];
};Var array < finaly >              FinalArray;            //FinalArray.ThelegNum

Function postBeginplay()
{
if(bEngageTestMode) SetupChecking();
}




Function SetupChecking()
{

scanforsegs();

}

//////////////  CodeTheSequence()

//TheBools
// There R 5 poss actions the mapper can set (ToggleHide,ToggleCollision,KickVecs,spawnFX,SoundFX) on
// any segment of the 4 segments ((Femur,Tibia,Tarsus) + spiderbrain) that make up Each Leg.
// The actions are then further split Into Time frames (ie 'When' to perform the action).
// For Each individual Kick Sequence the mapper programs is first stored in groups of 8

// So that comes to;-
//                     5 possible actions * on 8 Legs      8 * 5  = 40  (Boolean Variables)
//                     On any of the 4 Leg segments          * 4  =160  (Boolean Variables)
//                     At any of the 4 Time frames           * 4  =640  (Boolean Variables)
// ....Theres more.lol
// also as there are 4 convenient Time frames For Triggering events and Sounds in the Mover Class already
//(Opening,Closing,Opened,Closed)  so one you have picked the Leg and then the effect you can then choose in
// which Timeframe (any or all) to set it off.

// Emitter  + Sound Variables
// For the moment there is a limit of 4 to the amount of different Sound and Emitter effects that can be use in
// Each of the 8 Kicks. Thats 1 Emitter FX and 1 Sound effect per Timeframe (1*4) per Leg (1*4*8). So thats
// a max of 32 Different Sounds and 32 Different EmitterFX For Each Kick Sequnece.
// + the Emitters can be attached to the seg that spawned it (parent) . So thats a further set of 4 Bools.

// Then the Floating poInt Variables (Floats are more expensive to store than Ints)
// Open Time and close Time per Leg
// + stay OpenTime and KickDelay Time
// So max Total per Kick Sequnce is 644  Bools    or   (1256) options
//                                   32  Sound FX
//                                   32  Emiter
//                                   8 Ints (the Leg no)
//                                   4 FloatingpoInt Variables
//
//

// The data is reformated so that the data is restored using the Seg type (Femur,Tibia,Tarsus,Body as the key)
//EmitterArray
//SoundArray      = Slots 4-7;
//hideArray       = Slots 8-11;
//CollisionArray  = Slots 12-15;
//KickArray       = Slots 16-19;

Function IMove(out float A, out Float B)
{
A=b;                                       // automaticly clear arrays when moves the value
A=0;
}


Function CodeTheSequence()
{
Local Int I;
Local Int SeqNumuence;
Local Int TotalCode;
Local TimeFrame TempArray[20];            //To hold all 20 sets of 4xBools (that specify 'TimeFrame') in Sequential order
Local KickDetails TempKSeqDetails;

For (SeqNumuence=0;SeqNumuence<KickSequence.Length;SeqNumuence++)       //adding Leg no to Sequential Details
    {                                                             //moving raw details to temporary Sequential array
/// read Into Temp   + add Leg Num Ready For processing
    SecondArray[SeqNumuence].TempKDetails[1]=KickSequence[SeqNumuence].Kick1Details;
    IMove(KickSequence[SeqNumuence].Kick1Leg,SecondArray.TempKDetails[1].LegNo);                                             //emptying array

    SecondArray[SeqNumuence].TempKDetails[2]=KickSequence[SeqNumuence].Kick2Details;
    IMove(KickSequence[SeqNumuence].Kick2Leg,SecondArray.TempKDetails[2].LegNo);

    SecondArray[SeqNumuence].TempKDetails[3]=KickSequence[SeqNumuence].Kick3Details;
    Imove(KickSequence[SeqNumuence].Kick3Leg,SecondArray.TempKDetails[3].LegNo);

    SecondArray[SeqNumuence].TempKDetails[4]=KickSequence[SeqNumuence].Kick4Details;
    IMove(KickSequence[SeqNumuence].Kick4Leg,SecondArray.TempKDetails[4].LegNo);

    SecondArray[SeqNumuence].TempKDetails[5]=KickSequence[SeqNumuence].Kick5Details;
    Imove(KickSequence[SeqNumuence].Kick5Leg,SecondArray.TempKDetails[5].LegNo);

    SecondArray[SeqNumuence].TempKDetails[6]=KickSequence[SeqNumuence].Kick6Details;
    Imove(KickSequence[SeqNumuence].Kick6Leg,SecondArray.TempKDetails[6].LegNo);

    SecondArray[SeqNumuence].TempKDetails[7]=KickSequence[SeqNumuence].Kick7Details;
    Imove(KickSequence[SeqNumuence].Kick7Leg,SecondArray.TempKDetails[7].LegNo);

    SecondArray[SeqNumuence].TempKDetails[8]=KickSequence[SeqNumuence].Kick8Details;
    Imove(KickSequence[SeqNumuence].Kick8Leg,SecondArray.TempKDetails[8].LegNo);


// start processing data from the Temp Array Into the Final Array
   For (LegNum=1;LegNum<9;LegNum++)   // values are now split into segment specific groups
       {
       FinalArray[SeqNumuence].delays[LegNum]= SecondArray[SeqNumuence].TempKDetails[LegNum].Kickdelay * 1000;
//Femur BinaryTotal[0]
        TotalCode  =processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SpawnFXOnFemur,2);             // 2 4 8 16
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SoundFXOnFemur,32);            // 32 64 128 256
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].KickVecsFXOnFemur,512);    // 512 1024 2048 4096
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleCollisionFXOnFemur,8192); //8192  16384 32768 65536
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleHideFXOnFemur,131072)     //131072  262144  524288 1048576
        TotalCode +=FinalArray[SeqNumuence].TheLegNum[LegNum].BinaryTotal[0]=TotalCode;
//Tibia BinaryTotal[1]
        TotalCode  =processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SpawnFXOnTibia,2);             // 2 4 8 16
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SoundFXOnTibia,32);            // 32 64 128 256
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].KickVecsFXOnTibia,512);    // 512 1024 2048 4096
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleCollisionFXOnTibia,8192); //8192  16384 32768 65536
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleHideFXOnTibia,131072)     //131072  262144  524288 1048576
        TotalCode +=FinalArray[SeqNumuence].TheLegNum[LegNum].BinaryTotal[1]=TotalCode;
//Tarsus BinaryTotal[2]
        TotalCode  =processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SpawnFXOnTarsus,2);             // 2 4 8 16
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SoundFXOnTarsus,32);            // 32 64 128 256
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].KickVecsFXOnTarsus,512);    // 512 1024 2048 4096
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleCollisionFXOnTarsus,8192); //8192  16384 32768 65536
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleHideFXOnTarsus,131072)     //131072  262144  524288 1048576
        TotalCode +=FinalArray[SeqNumuence].TheLegNum[LegNum].BinaryTotal[2]=TotalCode;
//Body BinaryTotal[3]
        TotalCode  =processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SpawnFXOnBody,2);             // 2 4 8 16
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].SoundFXOnBody,32);            // 32 64 128 256
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].KickVecsFXOnBody,512);    // 512 1024 2048 4096
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleCollisionFXOnBody,8192); //8192  16384 32768 65536
        TotalCode +=processCode(SecondArray[SeqNumuence].TempKDetails[LegNum].ToggleHideFXOnBody,131072)     //131072  262144  524288 1048576
        TotalCode +=FinalArray[SeqNumuence].TheLegNum[LegNum].BinaryTotal[3]=TotalCode;

        If(SecondArray[Counter].TempKDetails.OpeningFX != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theFX[0]=SecondArray[Counter].TempKDetails.OpeningFX
        If(SecondArray[Counter].TempKDetails.OpenedFX  != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theFX[1]=SecondArray[Counter].TempKDetails.OpenedFX
        If(SecondArray[Counter].TempKDetails.ClosingFX != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theFX[2]=SecondArray[Counter].TempKDetails.ClosingFX
        If(SecondArray[Counter].TempKDetails.ClosedFX  != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theFX[3]=SecondArray[Counter].TempKDetails.closedFX

        If(SecondArray[Counter].TempKDetails.OpeningSFX != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theSFX[0]=SecondArray[Counter].TempKDetails.OpeningFX
        If(SecondArray[Counter].TempKDetails.OpenedSFX  != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theSFX[1]=SecondArray[Counter].TempKDetails.OpenedFX
        If(SecondArray[Counter].TempKDetails.ClosingSFX != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theSFX[2]=SecondArray[Counter].TempKDetails.ClosingFX
        If(SecondArray[Counter].TempKDetails.ClosedSFX  != None) FinalArray[SeqNumuence].TheLegNum[LegNum].theSFX[3]=SecondArray[Counter].TempKDetails.closedFX

        If(SecondArray[Counter].TempKDetails.OpenSpeed=0)    SecondArray[SeqNumuence].TempKDetails.OpenSpeed=1;
        If(SecondArray[Counter].TempKDetails.CloseSpeed=0)   SecondArray[SeqNumuence].TempKDetails.CloseSpeed=1;

        FinalArray[SeqNumuence].TheLegNum[LegNum].OpenSpeed=SecondArray[SeqNumuence].TempKDetails.OpenSpeed
        FinalArray[SeqNumuence].TheLegNum[LegNum].CloseSpeed=SecondArray[SeqNumuence].TempKDetails.CloseSpeed;
        FinalArray[SeqNumuence].TheLegNum[LegNum].CloseSpeed=SecondArray[SeqNumuence].TempKDetails.StayOpenTime;
        }
// then move to next Sequence
   }
}

Function Int processCode ( Bool My4xBools[4],Int SeedNum )  // Function Int will Return an Int Num when called
{
Local Int I;
Local Int Count;
Local Int RunningTotal;
Local Int PosInNoSet;    // number set now split down to ;- 2 4 8 16
                         // so 2 = possition 0 ; 4 = possition 1; 8 = position 2 ; 16 = position 3
PosInNoSet = SeedNum*2*2*2;

For (i=PosInNoSet; I> PosInNoSet/2/2/2; I/2; )       // have to reverse the numberset as we have to start the decode process at the highest number in the set
    {                                                 // and we HAVE to start the first time frame.so first time frame has to = highest number in the set.
    If( My4xBools[Count] ) RunningTotal += I;
    count++;
    }
Return RunningTotal;
}

Function NewRND (){RNDNo = Rand(KickSequence.Length);Log(String(Self) $ "======== Choosing the RND Num " $ String(RNDNo));}

Function ScanForSegs()
{
Local SpiderCoreMover WhatIFound;
forEach visiblecollidingActors(Class'SpiderCoreMover',WhatIFound,10000)
        {
        SendData(WhatIFound);
        }
}

Function SendData(SpiderCoreMover FoundSeg)
{
Local Int SeqNum,ParentLeg,TempBinaryTotalSubsitute;

For (SeqNum=0; SeqNum<KickSequence.Length; SeqNum++)
     {
     ParentLeg=Int(String(WhatIFound.tag));   // Convert the tag of the found seg Into an Int Num For checking

//   If(WhatIFound.IsA('SCM_Femur')  TempBinaryTotalSubsitute=0        not needed as TempBinaryTotalSubsitute will = 0 until changed
     If(WhatIFound.IsA('SCM_Tibia')  TempBinaryTotalSubsitute=1     // If Tibia will use TempBinaryTotalSubsitute 1
Else If(WhatIFound.IsA('SCM_Tarsus') TempBinaryTotalSubsitute=2     // note no need to check For Femur..as TempBinaryTotalSubsitute is 0 by default
Else If(WhatIFound.IsA('SCM_Body')   TempBinaryTotalSubsitute=3     // bin 0 = Femur    ; bin1=Tibia ;    bin2=Tarsus;    bin4= Body

     WhatIFound.DataPacket(FinalArray[SeqNum].TheLegNum[ParentLeg].Openspeed,
                           FinalArray[SeqNum].TheLegNum[ParentLeg].CloseSpeed,
                           FinalArray[SeqNum].TheLegNum[ParentLeg].StayOpenTime,
                           FinalArray[SeqNum].TheLegNum[ParentLeg].BinaryTotal[TempBinaryTotalSubsitute],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheFx[0],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheFx[1],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheFx[2],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheFx[3],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheSFx[0],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheSFx[1],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheSFx[2],
                           FinalArray[SeqNum].TheLegNum[ParentLeg].TheSFx[3]
                           );
    }

}

Function FindSpiderCore ()                       // locating the closest SpiderCore/powercore
{
Local Float Distance,BestDistance; Local ONSPowerCore C;
BestDistance = 10000;

forEach AllActors(Class'ONSPowerCore',C)
                 {
                 Distance = VSize(C.Class - Class);
                 If( (Distance < BestDistance) && C.IsA('Spider_Core_Red') )
                    {
                    Log(String(Self) $ " Im closest to the RED SpiderCore");
                    //      Spider_Core_Red(C).LinkMeBrain(Self);
                    Return;
                    }
             If( (Distance < BestDistance) && C.IsA('Spider_Core_Blue') )
                    {
                    //         Spider_Core_Blue(C).LinkMeBrain(Self);
                    Log(String(Self) $ " Im closest to the BLUE SpiderCore");
                    }
                 }
}


////////////////////////////////////////Start of State Code////////////////////////////////////////////

///////////////ReadyToGo
// Default  State For When spider has passed all Codes to the right segs and is read to
// Trigger a Kick Sequence (gotoState('Kickingoff'))
// The Trigger Function is overriden here so the SCore wont get re-tiggered while Kicking (ie in State
//Kicking off)

State ReadyToGo
{
  Function Trigger (Actor Other, Pawn EventInstigator)
  {
    Log("Ive been Triggered!! ");
    If( bImReady )
       {
       Log(String(Self) $ "As (bImReady==True) Im going to Kickoff");
       GotoState('KickingfOff');
       }
}

Begin:
Log(String(Self) $ "*** Im In ReadyToGo ***");
}

//////////////////////////////// KickingfOff
// The SCore Uses this State to Trigger a 'KickSequence'
//This is done in a specific State so that i can make use of the Sleep() Function
//that is not available in a reglar Function.
//Also i can switch of Functions ;-takedamage,Trigger,bump,touch with State Code;

State KickingfOff
{
Ignores takedamage;Ignores Trigger;Ignores bump;Ignores touch;

Begin:
Log(String(Self) $ "Im in State  Kickingoff");

For (KickCouter = 1;KickCouter < 9 ;KickCouter++)
  {
  TriggerEvent( Name(String(KickCouter)), Self, Instigator );
  Sleep(FinalArray[RNDNo]);
  }
}


defaultproperties
{
StaticMesh=StaticMesh'SpiderCore_Mesh.SpiderBits.BrainProtector'
bHidden=False
InitialState=ReadyToGo
}
