//================================================================================
// Femur.
//================================================================================

class Femur extends SpiderCoreMover;

function SFXPacket (float NewOpenSpeed, float NewCloseSpeed, float NewStayOpenTime, optional bool NewbLastLeg, optional Class<Emitter> NewSpecial_FX, optional float NewSFXCode)
{
  MyOpenspeed = NewOpenSpeed;
  MyCloseSpeed = NewCloseSpeed;
  StayOpenTime = NewStayOpenTime;
  if ( MySFXCode != 0 )
  {
    Log("Femur(" $ string(self.Tag) $ " got the FX");
    if ( NewSFXCode / 2 != int(NewSFXCode / 2) )
    {
      NewSFXCode -= 1;
      bHardAttachedFX = True;
    }
    MySFXCode = int(NewSFXCode);
    MySFX = NewSpecial_FX;
  }
  Log("Femur (" $ string(self.Tag) $ ")  : NewOpenSpeed=" $ string(NewOpenSpeed) $ " : NewCloseSpeed=" $ string(NewCloseSpeed) $ " : NewStayOpenTime=" $ string(NewStayOpenTime));
  RefreshMoveTimes();
}

