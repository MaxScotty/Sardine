
if (phase_transition)
{
	var progress = transition_timer/transition_duration;
	var pulse = sin(transition_timer * 0.3) * 0.2 + 1.0;
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * pulse, image_yscale * pulse, image_angle, c_white, 1);
}
else
{
	draw_set_color(c_black);
	draw_set_alpha((!(x == xprevious && y == yprevious)) ? ((jump_timer < jump_duration) ? (0.25-0.5*jump_timer/jump_duration) : (point_direction(x, y, x, target_By)/point_direction(x, yy, x, target_By)*0.25)) : (0.25));

	if is_jumping {
	    image_xscale = lerp(image_xscale, img_xscale/2, 0.1);
	    shadow_y = lerp(shadow_y, target_By, 0.05);
	} else {
	    shadow_x = lerp(shadow_x, x, 0.05);    
	    shadow_y = lerp(shadow_y, y, 0.05);    
	    image_xscale = lerp(image_xscale, img_xscale, 0.2);
	}

	shadow_x = lerp(shadow_x, x, 0.05);    

	if jump_timer < jump_duration {
	    shadow_minus_range += 0.1;    
	} else {
	    shadow_minus_range = lerp(shadow_minus_range, 0, 0.2);    
	}

	/*if (is_jumping && lock_position_timer >= 10) {
	    draw_set_color(c_red);
	    draw_set_alpha(0.3);
	    draw_circle(final_target_x, final_target_y, 20, false);
	}*/

	draw_ellipse(shadow_x-sprite_width/2+shadow_minus_range, shadow_y-sprite_height/2+shadow_minus_range, shadow_x+sprite_width/2-shadow_minus_range, shadow_y+sprite_height/10-shadow_minus_range, false);

	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_self();
}

