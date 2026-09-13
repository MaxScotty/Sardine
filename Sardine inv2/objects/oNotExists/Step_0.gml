if instance_exists(oTextbox)
{
	doit = true;	
}

if doit
{
	if !instance_exists(oTextbox)
	{
		doit2 = true;
	}	
}

if doit2
{
	audio_play_sound(not_exist, 8, 1);
	
	value += 0.01;
		
	if value >= 1
	{
		game_end();	
	}	
}