if (surface_exists(lighting_surface) == false)
{
	lighting_surface = surface_create(room_width, room_height);
}

surface_set_target(lighting_surface);

draw_clear_alpha(c_black, 0.7);

#region Crystals
with (oBigCrystal)
{

	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLight, 0, x, y, 3, 3, 0, c_white, 1);
	
}

gpu_set_blendmode(bm_normal);

with (oMediumCrystal)
{

	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLight, 0, x, y, 2, 2, 0, c_white, 1);
	
}

gpu_set_blendmode(bm_normal);

with (oSmallCrystal)
{

	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLight, 0, x, y, 1, 1, 0, c_white, 1);
	
}

gpu_set_blendmode(bm_normal);

gpu_set_blendmode(bm_normal);
#endregion

surface_reset_target();

draw_surface(lighting_surface, 0, 0);