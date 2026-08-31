// native final function string GetMeshName();
//GetStateName()   IsJoinedTo( actor Other )
//function float ImpactDamageModifier()
//{
//    return ImpactDamageMult;
//}

class VehicleToolBox extends Triggers
placeable;
Var (VehicleBooster) bool                  bUseBoost;
Var (VehicleBooster) vector                BoostForce;
var(VocCount) Sound                        FD_VOC_O_n_e, FD_VOC_T_w_o,FD_VOC_Three,FD_VOC_Extra ;
var(VocCount) bool                         bUseVocalCount,bBooster;
var(SFX)Class<SFX>                         AmbiantFX;
Var(SFX)       bool                        bUseAmbiant, bFX_Attach;
var array < class<SFX> >                   RND_SFX;
Var(SFX)       bool                        bUseRND_SFX;

Function VecAmbiantFX()
{
Local SFX SpawnedEffect; NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn( AmbiantFX , self , ,Location ,Rotation ) ;
}

Function VecBoost(onsvehicle TheTarget)
{
Local Vector PointOfBoostForce;
if (BoostForce!=vect(0,0,0))
   {
   if (bDirectional==True) TheTarget.KAddImpulse( BoostForce >> self.Rotation, PointOfBoostForce >> self.Rotation );
else
TheTarget.KAddImpulse( BoostForce >> TheTarget.Rotation, PointOfBoostForce >> TheTarget.Rotation );
    }
}

Function DoFX ( actor Target,optional Bool AttachFX )
{
local SFX SpawnedFX;
local int RNDNo;RNDNo=rand(RND_SFX.length);
NetUpdateTime = Level.TimeSeconds - 1;
SpawnedFX = Spawn  ( RND_SFX[RNDNo] , self , , Target.Location , Target.Rotation ) ;
If (AttachFX!=False) SpawnedFX.SetBase( Target );
}

state VocCount
{
Ignores Trigger;
ignores VecBoost;
Begin:
PlayOwnedSound ( FD_VOC_Three ,, 150 ,,,,); sleep (1) ;
PlayOwnedSound ( FD_VOC_T_w_o ,, 150 ,,,,); sleep (1) ;
PlayOwnedSound ( FD_VOC_O_n_e ,, 150 ,,,,); sleep (1) ;
PlayOwnedSound ( FD_VOC_Extra ,, 150 ,,,,);
}

defaultproperties
{
     FD_VOC_O_n_e=Sound'AnnouncerFemale2K4.Generic.one'
     FD_VOC_T_w_o=Sound'AnnouncerFemale2K4.Generic.two'
     FD_VOC_Three=Sound'AnnouncerFemale2K4.Generic.three'
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'ManiacRacing_StatMesh.MR.Powerop'
}
