//Draw PLayer info:
draw_sprite_stretched(sMenuBattle, image_index, 803, 746, 1102, 320);

draw_set_font(global.font);
draw_set_color(c_white);
draw_text_transformed(820, 760, "Name:", 10, 10, 0);
draw_text_transformed(820, 860, "HP:", 10, 10, 0);
draw_text_transformed(820, 960, "MP:", 10, 10, 0);

draw_set_font(FONT);
draw_set_color(c_white);
draw_text_transformed(1080, 760, "Sardine", 4, 4, 0);


draw_sprite_ext(sHP_battle, oSardineBattle.display_hp, 950, 870, 4, 4, 0, c_white, 1);
draw_sprite_ext(sMP, oSardineBattle.display_mp, 950, 970, 4, 4, 0, c_white, 1);

//Draw Slime info
draw_sprite_stretched(sMenuBattle, image_index, 0, 0, 1102, 310);

draw_set_font(global.font);
draw_set_color(c_white);
draw_text_transformed(15, 10, "Name:", 10, 10, 0);
draw_text_transformed(20, 100, "HP:", 10, 10, 0);

draw_set_font(FONT);
draw_set_color(c_white);
draw_text_transformed(280, 10, "Slime", 4, 4, 0);


draw_sprite_ext(sHPSlime, oSlimeBattle.display_hp, 150, 115, 4, 4, 0, c_white, 1);
