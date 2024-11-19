draw_sprite_ext(sprite_index, image_index, x+random_range(-shakePower, shakePower), y+random_range(-shakePower, shakePower), image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//draw_sprite_ext(sHP, display_hp, 319, 287, image_xscale, image_yscale, 0, c_white, 1);
//draw_sprite_ext(sMP, display_mp, 319, 255, image_xscale, image_yscale, 0, c_white, 1);


switch (stat)
{
	case status.idle:
	sprite_index = sSardineIdle;
	break;
	
	case status.attack:
	sprite_index = sSardineAttack;
	break;
	
	case status.defend:
	sprite_index = sSardineDefend;
	break;
	
	case status.down:
	sprite_index = sSardineDown;
	break;
}