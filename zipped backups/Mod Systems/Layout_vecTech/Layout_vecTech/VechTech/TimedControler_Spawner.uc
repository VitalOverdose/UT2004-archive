class TimedControler_Spawner extends FatalsVehicleToolBox

placeable;

var float                     OldGravValue,SingleTimeSlice,decreaseAmount,OriginalGrav;
var() float                   NewGrav, LifeTime, TimeSlices, StartSlide;
var() Bool                    bFX,bAttachFX;

function touch(actor other)
{
Local TimedVehicleControler SpawnedActor;local Actor ActorWhoTouchedMe;
ActorWhoTouchedMe=other;

if (ActorWhoTouchedMe.Isa('onsvehicle'))
   {
   SpawnedActor=spawn(class'TimedVehicleControler',self,,Location , Rotation) ;
   SpawnedActor.DataPacket ( ActorWhoTouchedMe, NewGrav, LifeTime, timeSlices, bFX, bAttachFX, StartSlide );
   }
}

defaultproperties
{
     Lifetime=5.000000
     timeSlices=10.000000
     StartSlide=3.000000
     Texture=Texture'ULogo.Menu.FadeLogo'
     CollisionRadius=200.000000
     CollisionHeight=200.000000
}
