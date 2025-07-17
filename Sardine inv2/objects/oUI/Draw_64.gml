var _number = sprite_get_number(sHP) - 1;

var _img = round(global.playerHealth/global.playerHealthMax * _number);

draw_sprite_ext(sHP, _img, 0, 0, image_xscale*3, image_yscale*3, 0, c_white, 1)
