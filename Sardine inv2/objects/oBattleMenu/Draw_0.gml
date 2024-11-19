var _free_space = 0;
for (var i = 0; i < array_length(option_choose[level]); i++)
{
	if option_choose[level, i] == noone
	{
	_free_space+=1;	
	}
}

MenuHeight = m_border * 3.5 + string_length(option_choose[0, 0]) + (menu_length - 1 - _free_space) * m_space;

draw_sprite_ext(sprite_index, image_index, x, y, MenuWidth/sprite_width, MenuHeight/sprite_height, 0 ,c_white, 1);

draw_set_font(FONT);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if oSlimeBattle.stat != status.down
{
	for(var i = 0; i < menu_length; i++)
	{
		var _c = c_white;
		if PosBat == i {_c = c_yellow};
		if option_choose[level, i] != noone
		draw_text_color(x+m_border, y+m_border + m_space * i, option_choose[level, i], _c, _c, _c, _c, 1);
	}
} else
{

		draw_set_halign(fa_center);
		//letters
		for (var i = 0; i < string_length(winText); i++)
		{
		char[i] = string_char_at(winText, i+1);	
		}
	
		//draw_char
		draw_char = clamp(draw_char, 0, string_length(winText)-1);
		if draw_char != string_length(winText)-1
		{
	
		timer--;
		if timer <= 0
		{
		audio_play_sound(snd_type, 8, 0);
		timer = 6;
		}
		draw_char+=1;
		}
		draw_sprite_ext(sprite_index, image_index, 0, room_height/2-50, room_width/sprite_width, 120/sprite_height, 0, c_white, 1);
		for (var t = 0; t < draw_char; t++)
		{
		draw_text_ext(40+15*t, room_height/2, char[t], 16, 190);	
		}
}

draw_set_font(FONT);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
