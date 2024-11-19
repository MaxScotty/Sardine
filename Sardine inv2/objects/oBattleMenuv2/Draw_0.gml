draw_sprite_ext(sprite_index, image_index, x, y, Width/sWidth, Height/sHeight, 0, c_white, 1)

for (var i = 0; i < array_length(option[menu_level]); i++)
{
	var c = c_white;
	if (pos == i) c = c_yellow
	draw_text_color(x + 16, y + 16 + (25*i), option[menu_level, i], c, c, c, c, 1);
}