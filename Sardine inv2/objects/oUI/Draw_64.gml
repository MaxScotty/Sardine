draw_set_font(FONT);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Health
var _number = sprite_get_number(sHP) - 1;
var _img = round(global.playerHealth/global.playerHealthMax * _number);

draw_sprite_ext(sHP, _img, 0, 0, image_xscale*3, image_yscale*3, 0, c_white, 1)

draw_text(152, 30, "Health");

//Mana
var _num_mp = sprite_get_number(sMP) - 1;
var _img_mp = round(global.playerMPoints/global.playerMPointsMax * _num_mp);

draw_sprite_ext(sMP, _img_mp, 0, 70, image_xscale*3, image_yscale*3, 0, c_white, 1);

draw_text(152, 100, "Mana");

//Experience
var _num_xp = sprite_get_number(sXP)
var _img_xp = round(global.xp/global.xp_required * _num_xp);

draw_sprite_ext(sXP, _img_xp, 0, 140, image_xscale*3, image_yscale*3, 0, c_white, 1)

draw_text(152, 170, $"Level {global.level}");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
