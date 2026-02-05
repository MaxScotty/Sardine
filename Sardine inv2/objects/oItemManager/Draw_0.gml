if (live_call()) return live_result;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

draw_set_font(FONT);
draw_set_valign(fa_left);
draw_set_halign(fa_top);

draw_sprite(Inventory_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);
draw_sprite(Items_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);

for (var xx = 0; xx < 6; xx++)
{
	for (var yy = 0; yy < 6; yy++)
	{
		draw_sprite(Pocket_int, 0, 147+37*xx, 118+37*yy);	
	}
}
