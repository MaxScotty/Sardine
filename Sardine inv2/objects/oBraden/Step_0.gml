

//Полсе всего
if timer_blink > 0
{
	timer_blink--;	
} else
{
	if sprite_index == sprite_normal
	{
		sprite_index = sprite_blink;
	}
}

