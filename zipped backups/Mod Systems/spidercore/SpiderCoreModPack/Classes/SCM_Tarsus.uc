//================================================================================
// Tarsus.
//================================================================================

class SCM_Tarsus extends SpiderCoreMover;

function SFXPacket (float NewOpenSpeed, float NewCloseSpeed, float NewStayOpenTime, optional bool bNewLastLeg, optional Class<Emitter> NewSpecial_FX, optional float NewSFXCode)
{
  MyOpenspeed = NewOpenSpeed;
  MyCloseSpeed = NewCloseSpeed;
  StayOpenTime = NewStayOpenTime;
  if ( NewSFXCode != 0 )
  {
    Log("Tarsus(" $ string(self.Tag) $ " got the FX");
    if ( NewSFXCode / 2 != int(NewSFXCode / 2) )
    {
      NewSFXCode -= 1;
      bHardAttachedFX = True;
    }
    MySFXCode = int(NewSFXCode);
    MySFX = NewSpecial_FX;
  }
  bImTheLastSeg = bNewLastLeg;
  if ( bImTheLastSeg == True )
  {
    Log("im the last seg. Tarsus" $ string(self.Tag) $ " my delay was" $ string(DelayTime));
    DelayTime += 0.1;
    Log(" my delay now has been changed to   " $ string(DelayTime));
  }
  Log("Tarsus(" $ string(self.Tag) $ ")  : MyOpenspeed=" $ string(MyOpenspeed) $ " : MyClosespeed=" $ string(MyCloseSpeed) $ " : StayOpenTime=" $ string(StayOpenTime) $ " : bImTheLastSeg=" $ string(bImTheLastSeg));
  RefreshMoveTimes();
}

function FinishedClosing ()
{
  if ( bImTheLastSeg == True )
  {
    MyBrain.ReportFinished(self);
  }
  Super.FinishedClosing();
}

