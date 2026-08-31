Fatals Factory  (c) 2005
========================

By FatalOverdose;-

Ok Hopefuly this is an all map, all vehicle, Vehicle factory.
It can spawn a single vehicle repeatedly or use a spawn list that can be
setup in Unrealed.
It checks every 5 second to see if it need to spawn a new vehicle

The Properties   -(can be set in unrealed)
==============

bool   bRespawnVehicles   =true by default
bool   bNoTeamLock        =true by default

float   RespawnCheckTime   =5 Sec by default
========================
The time interval between each atempted vehicle spawning

array (Vehicle) SpawnListPrimary && array (Vehicle) SpawnListSecondary
======================================================================
There are to vehicle spawn lists.
If you just want to spawn 1 single vehicle type just put it in the first
slot in SpawnListPrimary.
If you want to spawn more than 1 vehicle type, add as many as you like tothe list
and they will be spawned in that order then the list will reset.
If you use the 'SpawnListSecondary' as well you can switch between the two lists by
triggering the Factory by whatever means.

bool   bResetSpawnListOnChange     =true by default
==============================
Set this to true and the SpawnList's will be reset to 0 when the factory changes
from one spawn list to the other.

Emitter  ChangeOver_FX
======================
Optional emitter FX for when the factory changes from one spawn list to the other.

Sound  ChangeOverSound
======================
Optional SoundFX for when the factory changes from one spawn list to the other.

VecBoost                          =true by default
========
I have fitted the factory with a Vehicle booster. The idea that if a vehicle is
blocking the spawn point and is not a child of the factory it will apply a
KImpulse to the vehicle and fire it out of the way. I dont think this works to well
at the moment so dont worry about the settings for now.

bool    bUseBoost
vector  BoostForce
bool    bDirectionalboost
Emitter BoostFX
bool    bhardAttachBoostFXToVehicle
Sound   boostSound
