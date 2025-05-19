if sprite_index == sprite_blink
{
	sprite_index = sprite_normal;	
	timer_blink = irandom_range(4 * 60, 15 * 60);
}+