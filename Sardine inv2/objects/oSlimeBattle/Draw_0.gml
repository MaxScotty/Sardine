draw_sprite_ext(sprite_index, image_index, x+random_range(-shakePower, shakePower), y+random_range(-shakePower, shakePower), image_xscale, image_yscale, image_angle, image_blend, image_alpha);



switch (stat)
{
	case status.idle:
	sprite_index = sSlimeIdle2;
	break;
	
	case status.attack:
	sprite_index = sSlimeAttack;
	break;
	
	case status.defend:
	sprite_index = sSlimeIdle2;
	break;
	
	case status.down:
	sprite_index = sSlimeDead;
	break;
}











