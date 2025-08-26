
draw_set_color(c_black);
draw_set_alpha(0.5);

if is_jumping
{	
	shadow_y = lerp(shadow_y, target_By, 0.05);
} else
{
	shadow_x = lerp(shadow_x, x, 0.05);	
	shadow_y = lerp(shadow_y, y, 0.05);	
}

shadow_x = lerp(shadow_x, x, 0.05);	

if jump_timer < jump_duration
{
	shadow_minus_range += 0.1;	
} else
{
	shadow_minus_range = lerp(shadow_minus_range, 0, 0.2);	
}

draw_ellipse(shadow_x-sprite_width/2+shadow_minus_range, shadow_y-sprite_height/2+shadow_minus_range, shadow_x+sprite_width/2-shadow_minus_range, shadow_y+sprite_height/10-shadow_minus_range, false);

draw_set_color(c_white);
draw_set_alpha(1);

draw_self();