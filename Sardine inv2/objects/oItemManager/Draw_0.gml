draw_set_font(FONT);

if showInv
{	var _xx =  camera_get_view_x(view_camera[0]) + screen_bord;
	var _yy =  camera_get_view_y(view_camera[0]) + screen_bord;
	
	var _sep = sep;
	
	var _max_line = 7;
	
	var c = #E5762D;
	
	draw_sprite_ext(sInventory, 0, _xx+310, _yy+160, 1, 1, 0, c_white, 1);
	
	for (var i = 0; i < 14; i++)
	{
		var _level = 0;
		
		if i >= _max_line { _level = 1; };
		
		if inv[i] != noone
		{
			draw_sprite(inv[i].sprite, 0, _xx + 217.5+_sep*(i - _max_line*_level), _yy + 81 + _sep*_level);	
			draw_sprite(sSelect, 0, _xx + 214+_sep*posX, _yy + 74 + _sep*posY); 
				draw_text_transformed_color(_xx + 233.8+_sep*(i - _max_line*_level), _yy + 90.8 + _sep*_level, $"{inv[i].number}", 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 0.5);	
				draw_text_transformed_color(_xx + 233 +_sep*(i - _max_line*_level), _yy + 90 + _sep*_level, $"{inv[i].number}", 0.4, 0.4, 0, c, c, c, c, 1);
			//draw_text_ext_transformed_color((_xx) + 210, (_yy + _sep) + 125, $"{inv[i].description}", 0, 200, 0.5, 0.5, 0, c, c, c, c, 1);
			
			// ALFIES CODE ↓
			// Display description of the selected item if valid
			if selected_item != noone 
			{
		        draw_text_transformed_color(_xx + 208.8, _yy +  155.8, selected_item.description, 0.5, 0.5, 0, c_black, c_black, c_black, c_black, 0.5);
		        draw_text_transformed_color(_xx + 208, _yy +  155, selected_item.description, 0.5, 0.5, 0, c, c, c, c, 1);
			}
			// ALFIES CODE ↑
		}	
		
		
		//номер
		//if inv[i, j] != noone
		//{
			//draw_text_ext_transformed_color((_xx + _sep * j) + 233.5, ( _yy * i) + 110.5, inv[i, j].number, _sep, string_height("M"), 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 0.5);
			//draw_text_ext_transformed_color((_xx + _sep * j) + 233, ( _yy * i) + 110, inv[i, j].number, _sep, string_height("M"), 0.4, 0.4, 0, c, c, c, c, 1);
		//}
	
		//описание
		//if posX == j and posY == i and inv[posY, posX] != noone
		//{
			//draw_text_ext_transformed_color((_xx) + 211, (_yy + _sep) + 126, inv[i, j].description, 0, 200, 0.5, 0.5, 0, c_black, c_black, c_black, c_black, 0.5);
			//draw_text_ext_transformed_color((_xx) + 210, (_yy + _sep) + 125, inv[i, j].description, 0, 200, 0.5, 0.5, 0, c, c, c, c, 1);
		//}
	}
	
	//draw_sprite(sSelect, 0, _xx + 214+_sep*posX, _yy + 74 + _sep*posY);
}