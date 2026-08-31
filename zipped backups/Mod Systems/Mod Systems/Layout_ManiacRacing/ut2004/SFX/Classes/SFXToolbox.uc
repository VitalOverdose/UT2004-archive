//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SFXToolbox extends Triggers;
var(VocCount) Sound                        FD_VOC_O_n_e, FD_VOC_T_w_o,FD_VOC_Three,FD_VOC_Extra ;
var(VocCount) bool                         bUseVocalCount;
var(SFX)       Class<SFX>                  AmbiantFX;
Var(SFX)       bool                        bAmbiantFX_Attach;

//function float ImpactDamageModifier()
//{
//    return ImpactDamageMult;
//}

state VocCount
{
Ignores Trigger;
Begin:
PlayOwnedSound ( FD_VOC_Three ,, 150 ,,,,); sleep (1) ;                                                           // << VocThree
PlayOwnedSound ( FD_VOC_T_w_o ,, 150 ,,,,); sleep (1) ;                                                           // << VocT_w_o
PlayOwnedSound ( FD_VOC_O_n_e ,, 150 ,,,,); sleep (1) ;                                                           // << VocO_n_e
Extra:
PlayOwnedSound ( FD_VOC_Extra ,, 150 ,,,,);
}


Function SpawnAmbiantFX(bool HardAttach)
{
Local emitter SpawnedEffect;NetUpdateTime = Level.TimeSeconds - 1;
SpawnedEffect = Spawn( AmbiantFX , self , ,Location ,Rotation );
if (bAmbiantFX_Attach==True) SpawnedEffect.SetBase(Self);
}
