class TC_MonsterWheels extends TimedControler;

Var onsvehicle            MyTarget;
Var float                 MYLifetime,MyTimesMultiplyer,MyInflateTime;
Var float                 MyStartDeflate,secondsleep,TimeStep;
Var float                 OrigDrawscale ,DrawScaleStep,NewDrawScale;
Var float                 OrigCollisionRadius,RadiusStep,NewCollisionRadius;
Var float                 OrigcollisionHeight,HeightStep,NewCollisionHeight;
var float                 Temp;
var int                   I,MyTimeslices;
Var() sound               ChangeSound;


Function DataPacket ( onsvehicle VehicleTarget,float NewValue,float FXDuration,float CurveInTime,float SlideOutStart,int SlideSteps,optional int CurveDivision)
{
MyTarget           = VehicleTarget;
MYLifetime         = FXDuration;
MyTimesMultiplyer  = NewValue;
MyInflateTime      = CurveInTime;
MyTimeslices       = SlideSteps;
MyStartDeflate     = SlideOutStart;
if ( MyTimesMultiplyer       < 0) {Warn("you Set the new wheel size to low");Destroy();}
GotoState('Inflate');
}

State Inflate
{

Function Calc()
{
Local Float RadiusDifference,HeightDifference,DrawScaleDifference;

DrawScaleDifference = MyTarget.Drawscale*MyTimesMultiplyer;
DrawScaleDifference -=MyTarget.default.Drawscale;

RadiusDifference = MyTarget.default.collisionRadius*MyTimesMultiplyer;
RadiusDifference -=MyTarget.default.collisionRadius;

HeightDifference = MyTarget.default.collisionheight*MyTimesMultiplyer;
HeightDifference -=MyTarget.default.collisionheight;

TimeStep       = MyInflateTime       / MyTimeslices;
DrawScaleStep  = DrawScaleDifference / MyTimeslices;
RadiusStep     = RadiusDifference    / MyTimeslices;
HeightStep     = HeightDifference    / MyTimeslices;
secondsleep    = MyStartDeflate- MyInflateTime ;
}

Begin:
Calc();

for(i=0;I<MyTimeslices;I++)
    {
    NewDrawScale       += DrawScaleStep;
    NewCollisionRadius += RadiusStep;
    NewCollisionHeight += HeightStep;
    MyTarget.SetDrawScale(NewDrawScale);
    MyTarget.SetCollisionSize(NewCollisionRadius,NewCollisionHeight);
    MyTarget.setlocation(MyTarget.location+vect(0,0,1)*HeightStep);
    Sleep(TimeStep);
    }
gotostate('monsterTrucking');
}

State monsterTrucking
{
Begin:
Sleep(secondsleep);
Gotostate('Deflating');
}


State Deflating
{
Begin:
for(i=0;I<MyTimeslices;++I)
    {
    NewDrawScale       -= DrawScaleStep;
    NewCollisionRadius -= RadiusStep;
    NewCollisionHeight -= HeightStep;
    MyTarget.SetDrawScale(NewDrawScale);
    MyTarget.SetCollisionSize(NewCollisionRadius,NewCollisionHeight);
    Sleep(TimeStep);
}
}


DefaultProperties
{
     changesound=Sound'ONSVehicleSounds-S.Hydraulics.Hydraulic05'
     bHidden=False
     Texture=Texture'ULogo.Menu.FadeLogo'
     CollisionRadius=200.000000
     CollisionHeight=200.000000
     }
