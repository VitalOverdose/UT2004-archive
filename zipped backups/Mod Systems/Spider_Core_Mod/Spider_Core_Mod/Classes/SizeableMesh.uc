//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SizeableMesh extends spider_Core_MeshUtils;


var(SpiderCoreFx) class<emitter>           ChangeFX;
var(SpiderCoreFx) bool                     HardAttachChangeFX;

var() bool                                 ReactsOnshot;
var() bool                                 ReactsOntrigger;
var() bool                                 LoopSequence;
var() float                                TimeUntillNextAvailableResize;
var() float                                Maxsize;
var() int                                  Sizesteps;
var float                                  SizeStepAmount;
var float                                  HeightStepAmount;
var float                                  RadiusStepAmount;
var sound                                  ChangeSound;

function postbeginplay()
{
local float tempHeightMaxSize;
local float tempRadiusMaxSize;

if ( Sizesteps > 1 )
   {
   tempHeightMaxSize       = collisionHeight * Sizesteps;
   tempRadiusMaxSize       = collisionRadius * Sizesteps;

   sizeStepAmount   = maxsize           / Sizesteps;
   heightStepAmount = tempHeightMaxSize / Sizesteps;
   RadiusStepAmount = tempRadiusMaxSize / Sizesteps;
   }
}



function SizeLoop ()
{
local float NewDrawScale;
local float NewHeightScale;
local float NewRadiusScale;

if ( Sizesteps > 1 )                  // most of time this is true (so is 1st 2b checked)
   {
    NewDrawScale   = DrawScale       + SizeStepAmount;
    NewHeightScale = CollisionHeight + HeightStepAmount;
    NewRadiusScale = CollisionRadius + RadiusStepAmount;
    if (drawscale != maxsize)
       {
       if ( LoopSequence == false ) return;
       setdrawscale    ( NewDrawScale );
       setcollisionsize( NewHeightScale , NewRadiusScale);
       }
   else
       {
       setdrawscale    ( default.drawscale);
       setcollisionsize( default.collisionRadius,default.collisionheight);
       }
   }
else
 if ( Sizesteps ==1 )
    {                                                      // next most likley outcome (so 2nd 2 b checked)
    NewDrawScale   = DrawScale       * MaxSize;
    NewHeightScale = CollisionHeight * maxsize;
    NewRadiusScale = CollisionRadius * maxsize;

     if (drawscale == default.drawscale)
        {
        setdrawscale    ( NewDrawScale );
        setcollisionsize( NewRadiusScale , NewHeightScale );
        }
       else
        {
        setdrawscale    ( default.drawscale);
        setcollisionsize( default.collisionRadius , default.collisionHeight );
        }
    }
else
    if ( Sizesteps < 1 ) warn ("Sizesteps was set to a number less than 1!");

if ( changeFX != None )
   {
   if( HardAttachChangeFX == true ) SpawnFX(changeFX,self,,self);
   else
      SpawnFX(changeFX,self,,);
   }
}

defaultproperties
{
     Sizesteps=1
}
