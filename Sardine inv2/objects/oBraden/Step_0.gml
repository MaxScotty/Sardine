
/*
sleep = (спрайт это спит + спрайт это встал). sleep = false + true (true);
sleep = true + false (true); sleep = false + false (false); sleep = true + true (true);
*/

sleep = (sprite_index == sprite_sleep or sprite_index == sprite_awake);

//После всего
if timer_blink > 0
{
	if !sleep
	{
		timer_blink--;	
	}
} else
{
	if sprite_index == sprite_normal
	{
		sprite_index = sprite_blink;
	}
}

