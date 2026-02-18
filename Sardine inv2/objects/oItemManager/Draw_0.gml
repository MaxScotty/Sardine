if (live_call()) return live_result;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

if !surface_exists(surface)
{
	surface = surface_create(236, 115);
}

draw_set_font(FONT);
draw_set_valign(fa_left);
draw_set_halign(fa_top);

draw_sprite(Inventory_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);
draw_sprite(Items_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);

surface_set_target(surface);
draw_clear_alpha(c_black, 0);

var _ext_y = (showItemsRoll ? 106 : 0);

ext_y_items = lerp(ext_y_items, _ext_y, 0.1);

var _count = 0;

for (var yy = 0; yy < 6; yy++)
{
	for (var xx = 0; xx < 6; xx++)
	{
		if pos == _count
		{
			for (var i = 0; i < 360; i += 30)
			{
				draw_sprite_ext(Pocket_int, 0, 0+37*xx+lengthdir_x(6, i), 4+37*yy-ext_y_items+lengthdir_y(6, i), 1, 1, 0, c_black, 1);	
			}
		}
		
		draw_sprite(Pocket_int, 0, 0+37*xx, 4+37*yy-ext_y_items);	
		
		if global.inv[_count] != -1
		{
			draw_sprite(global.inv[_count].sprite, 0, 7+37*xx, 8+37*yy-ext_y_items);
			
		}
		
		_count++;
	}
}

surface_reset_target();

//show_debug_message(global.inv)

draw_surface(surface, _cam_x+148, _cam_y+118);



if global.inv[pos] != -1
{
	draw_sprite(global.inv[pos].sprite_detail, 0, _cam_x, _cam_y)l
}	



//if global.inv[1] != -1
//{
//	draw_sprite(global.inv[1].sprite, 0, 256, 256);
			
//}

//show_debug_message(global.inv);


//draw_sprite(global.inv[29].sprite, 0, 0+37, 4+37-ext_y_items);