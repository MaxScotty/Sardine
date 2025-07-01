if (type == TRANS_TYPE.FADE){
	draw_set_alpha(percent);
	draw_set_color(c_black);
	draw_rectangle(0, 0, T_width, T_height, false);
}