Class FatalsToolbox extends actor
placeable;



state FDCountdown
{
Begin:
PlayOwnedSound ( Sound'AnnouncerFemale2K4.Generic.one' ,, 150 ,,,,); sleep (1) ;                                                           // << VocThree
PlayOwnedSound ( Sound'AnnouncerFemale2K4.Generic.two' ,, 150 ,,,,); sleep (1) ;                                                           // << VocT_w_o
PlayOwnedSound ( Sound'AnnouncerFemale2K4.Generic.three' ,, 150 ,,,,); sleep (1) ;                                                           // << VocO_n_e
}

defaultproperties
{
}
