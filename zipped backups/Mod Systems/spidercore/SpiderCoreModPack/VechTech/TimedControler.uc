class TimedControler extends FatalsVehicleToolBox
placeable;

var(FD_VocalCount) Sound                       FD_VOC_Boost, FD_VOC_O_n_e, FD_VOC_T_w_o,FD_VOC_Three,FD_VOC_Speed ;


state FDCountdown
{
Begin:
PlayOwnedSound ( FD_VOC_Three ,, 150 ,,,,); sleep (1) ;                                                           // << VocThree
PlayOwnedSound ( FD_VOC_T_w_o ,, 150 ,,,,); sleep (1) ;                                                           // << VocT_w_o
PlayOwnedSound ( FD_VOC_O_n_e ,, 150 ,,,,); sleep (1) ;                                                           // << VocO_n_e
}



defaultproperties
{
     FD_VOC_O_n_e=Sound'AnnouncerFemale2K4.Generic.one'
     FD_VOC_T_w_o=Sound'AnnouncerFemale2K4.Generic.two'
     FD_VOC_Three=Sound'AnnouncerFemale2K4.Generic.three'
}
