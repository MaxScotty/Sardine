//part_system_drawit(global.part_system);

var _camera = view_get_camera(0);

if(!surface_exists(self.light_surface))
{
	var _cam_width = camera_get_view_width(_camera);
	var _cam_height = camera_get_view_height(_camera);

self.light_surface = surface_create(_cam_width, _cam_height);
}

surface_set_target(self.light_surface);
draw_clear(c_black);
camera_apply(_camera);

gpu_set_blendmode(bm_subtract);

with(oBigCrystal)
{
	draw_sprite_ext(sLight, 0, x, y, 3, 3, 0, c_white, .8);
}

with(oMediumCrystal)
{
	draw_sprite_ext(sLight, 0, x, y, 2, 2, 0, c_white, .8);
}

with(oSmallCrystal)
{
	draw_sprite_ext(sLight, 0, x, y, 1, 1, 0, c_white, .8);
}

gpu_set_blendmode(bm_normal);

surface_reset_target();

//----------NPC----------
draw_set_alpha(0.5);
mp_grid_draw(global.AIgrid);
draw_set_alpha(1);