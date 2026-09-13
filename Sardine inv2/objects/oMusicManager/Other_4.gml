if room == rCave //|| room == rCavePassage
{
	set_song_ingame(sng_Hypnotic, 60, 0);
}

if room == rCavePassage
{
	set_song_ingame(snd_Broken, 60, 2 * 60);
}

if room == rCave_test
{
	set_song_ingame(not_exist, 56, 11);
}