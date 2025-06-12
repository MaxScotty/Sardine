//depth = -9999;

if(pause) {

	//width and height of menu
	var _new_w = 0;
	for (var i = 0; i < op_length; i++)
	{
	    var _op_w = string_width(option[menu_level, i]);
	    _new_w = max(_new_w, _op_w);
	}
	width = _new_w + op_border*2;
	height = op_border*2 + string_height(option[0, 0]) + (op_length - 1)*op_space;

	//center menu
	x =camera_get_view_width(view_camera[0])*2- width/2;
	y =camera_get_view_height(view_camera[0])*2 - height/2;
	//draw the menu background
	var _xbg = x-430;
	var _ybg = y-300;
	draw_sprite_ext(sprite_index, image_index, _xbg, _ybg, width/sprite_width*3, height/sprite_height * 3.5, 0, c_white, 1);

	//draw the options
	draw_set_font(FONT);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	for (var i = 0; i < op_length; i++)
	{
	    var _c = c_white;
	    if pos == i {_c = c_yellow};
		draw_text_transformed_color(_xbg+op_border*3, _ybg+op_border*3.5 + op_space*i *3.8, option[menu_level, i] , 3,3, 0, _c, _c, _c, _c, 1);
	}
}