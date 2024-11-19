//if (keyboard_check_pressed(ord ("I")))
//{
//	global.show_inventory = !global.show_inventory;
//}

//if (!global.show_inventory) exit;

//if(global.show_inventory)
//{
//	oSardine.move_spd = 0;
//} 
//else 
//{
//	oSardine.move_spd = 3;
//}

//if(global.show_inventory)
//{
//	draw_sprite_ext(sInventory, 0, inv_x, inv_y, scale, scale, 0, c_white, 1);

//	if(keyboard_check_pressed(vk_right))
//	{
//		nx++
//		if(nx >= 7) {nx = 0;}
//	}

//	if(keyboard_check_pressed(vk_left))
//	{
//		nx--
//		if(nx <= -1) {nx = 6;}	
//	}

//	if(keyboard_check_pressed(vk_down))
//	{
//		ny++
//		if(ny >= 2) {ny = 0;}	
//	}

//	if(keyboard_check_pressed(vk_up))
//	{
//		ny--
//		if(ny <= -1) {ny = 1;}	
//	}

//	var xc = (gui_width * 0.7403) - (inv_width * 0.35 * scale);
//	var yc = (gui_height * 0.71) - (inv_height * 0.2 * scale);

//	trans_x = ((xc + 28 * nx) - inv_x) * scale;
//	trans_y = ((yc + (1 * ny) + 26 * ny) - inv_y) * scale;

//	for(var i = 0; i <= 1; i++)
//	{
//		for(var j = 0; j <= 6; j++)
//		{
//			if(inv[j, i] != 0)
//			{
//				draw_sprite_ext(inv_spr[j, i], 0, (xc + 85 * j) - 500, (yc + (4 * i) + 26) - 360, scale, scale, 0, c_white, 1);
//			}
		
//			var c = #E5762D; //#E5762D
		
//			if(inv_num[j, i] != 0)
//			{
//				//draw_text_color((xc + 82 * j) - 458, (yc + (4 * i) + 26) - 338 , string(inv_num[j, i]), c_black, c_black, c_black, c_black, 0.5);
//				draw_text_color((xc + 85 * j) - 458, (yc + (4 * i) + 26) - 338 , string(inv_num[j, i]), c, c, c, c, 1);
//			}
			

//			draw_sprite_ext(sSelect, 0, trans_x, trans_y, scale, scale, 0, c_white, 1);
			

//			draw_set_font(FONT);
//			//draw_text_color(inv_x-315, inv_y - 20, string(inv_text[nx,ny]), c, c, c, c, 1);
//			draw_text_ext_transformed_color(inv_x-302, inv_y - 22, string(inv_text[nx,ny]), string_height("M"), inv_width*(x_buffer*2) / 2, 1, 1, 0, c_black,c_black,c_black,c_black,0.5);
//			draw_text_ext_color(inv_x-300, inv_y - 20, string(inv_text[nx,ny]), string_height("M"),inv_width*(x_buffer*2)/2, c, c, c, c, 1);
//		}
//	}
//}

////draw_text(mouse_x, mouse_y, string([nx, ny]));