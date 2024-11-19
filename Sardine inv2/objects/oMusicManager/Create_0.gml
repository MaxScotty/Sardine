global.MasterVol = 1;
global.MusicVol = 1;

//info for thr song we are currently playing/trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0;
startFadeInTime = 0;
fadeInInstVol = 1;

//for fading music out and stopping songs that are no longer playin
fadeOutInstances = array_create(0); //the audio instances to fade out
fadeOutInstVol = array_create(0); //the volumes of each individual aufio instance
fadeOutInstTime = array_create(0); //how fast the fadeout should happen
