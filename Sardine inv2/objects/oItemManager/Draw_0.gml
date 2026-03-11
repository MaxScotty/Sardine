if (live_call()) return live_result;

if !show_inv { exit; };

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

if !surface_exists(surface)
{
	surface = surface_create(236, 80);
}

draw_sprite(LB_inventory, 0, _cam_x+96, _cam_y+48);
draw_sprite(RB_inventory, 0, _cam_x+_cam_w-128, _cam_y+48);


draw_set_font(FONT);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

for (var i = 0; i < array_length(sections); i++)
{
	if posSection != i
	{
		section_ext_y[i] = lerp(section_ext_y[i], 12, 0.1);	
	} else
	{
		section_ext_y[i] = lerp(section_ext_y[i], -4, 0.1);	
	}
	
	draw_sprite_ext(BookMarks_inventory__opened_, 0, _cam_x + 186 + 132*i, _cam_y+48+section_ext_y[i], 1, 1, 0, c_white, 1);	
	draw_text_transformed(_cam_x + 186 + 132*i, _cam_y+60+section_ext_y[i], sections[i], 0.75, 0.75, 0);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite(Inventory_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);

if posSection == 0
{
	draw_sprite(Items_base, 0, _cam_x+_cam_w/2, _cam_y+_cam_h/2);
}

surface_set_target(surface);
draw_clear_alpha(c_black, 0);

var _ext_y = showItemsRoll*48;

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
				draw_sprite_ext(Pocket_int, 0, 0+37*xx+lengthdir_x(6, i), 4+28*yy-ext_y_items+lengthdir_y(6, i), 1, 1, 0, c_black, 1);	
			}
		}
		
		draw_sprite(Pocket_int, 0, 0+37*xx, 4+28*yy-ext_y_items);	
		
		if global.inv[_count] != -1
		{
			draw_sprite(global.inv[_count].sprite, 0, 7+37*xx, 12+28*yy-ext_y_items);
			
		}
		
		_count++;
	}
}

surface_reset_target();

//show_debug_message(global.inv)

if posSection == 0
{
	draw_surface(surface, _cam_x+148, _cam_y+118);
	
	slider_y = lerp(slider_y, ((sprite_get_height(Slider_base_inv)-sprite_get_height(Slider_inv))*(showItemsRoll/2)), 0.1);
	
	draw_sprite(Slider_base_inv, 0, _cam_x+164+205, _cam_y+120);
	draw_sprite(Slider_inv, 0, _cam_x+164+205, _cam_y+120+slider_y);
	
	draw_sprite(HP_Inv_empty, 0, _cam_x+164, _cam_y+204);
	draw_sprite_part(HP_Inv_full, 0, 0, 0, sprite_get_width(HP_Inv_full)*(global.playerHealth/global.playerHealthMax), sprite_get_height(HP_Inv_full), _cam_x+164, _cam_y+204);

	draw_sprite(MP_Bar_Empty, 0, _cam_x+164+64, _cam_y+204);
	draw_sprite_part(MP_Bar_Full, 0, 0, 0, sprite_get_width(MP_Bar_Full)*(global.playerMPoints/global.playerMPointsMax), sprite_get_height(MP_Bar_Full), _cam_x+164+64, _cam_y+204);

	draw_sprite(LVL_Inv_empty, 0, _cam_x+164+128, _cam_y+204);
	draw_sprite_part(LVL_Inv_full, 0, 0, 0, sprite_get_width(LVL_Inv_full)*(inv_get_using_space()/array_length(global.inv)), sprite_get_height(LVL_Inv_full), _cam_x+164+128, _cam_y+204);


	if global.inv[pos] != -1
	{
		draw_sprite(global.inv[pos].spriteDetail, 0, _cam_x+512-108, _cam_y+120);
	
		draw_text_ext_transformed(_cam_x+512-104, _cam_y+120+84, global.inv[pos].description, 14, 92*3, 0.5, 0.5, 0);
	}
}



if posSection == 1
{
	var _www = 384; 
	var _hhh = 128; 
	
	if !surface_exists(surface2)
	{
		surface2 = surface_create(_www, _hhh);	
	}
	
	surface_set_target(surface2);
	draw_clear_alpha(c_black, 0);
	
	var _spr;
	
	var _posNext = pos+1;
	if _posNext >= array_length(global.eqiup_inv) { _posNext = 0; };
	
	_spr = global.eqiup_inv[_posNext].sprite;
	
	draw_sprite_ext(_spr, 0, 0+_www-sprite_get_width(_spr)*0.5, 0+sprite_get_height(_spr)*0.5/2, 0.5, 0.5, 0, c_white, 1);
	
	var _posPrev = pos-1;
	if _posPrev < 0 { _posPrev = array_length(global.eqiup_inv)-1; };
	
	_spr = global.eqiup_inv[_posPrev].sprite;
	
	draw_sprite_ext(_spr, 0, -_www/6+sprite_get_width(_spr)*0.5, 0+sprite_get_height(_spr)*0.5/2, 0.5, 0.5, 0, c_white, 1);
	
	_spr = global.eqiup_inv[pos].sprite;
	
	draw_sprite_ext(_spr, 0, 0+_www/2-sprite_get_width(_spr)/2, 0, 1, 1, 0, c_white, 1);
	
	
	
	surface_reset_target();
	
	draw_sprite_ext(Arrow, 0, _cam_x+_www/2 + sin(current_time/500)*8, _cam_y+_hhh, 3, 3, 0, c_white, 1);
	draw_sprite_ext(Arrow, 0, _cam_x+_www+56 - sin(current_time/500)*8, _cam_y+_hhh, -3, 3, 0, c_white, 1);
	
	draw_surface(surface2, _cam_x+124, _cam_y+108)

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_cam_x+256+64, _cam_y+96, global.eqiup_inv[pos].name);
	
	draw_text_ext(_cam_x+256+64, _cam_y+256, global.eqiup_inv[pos].desc, 16, _www-32);
}

if posSection == 2
{
	var _www = 384; 
	var _hhh = 128; 
	
	if !surface_exists(surface2)
	{
		surface2 = surface_create(_www, _hhh);	
	}
	
	surface_set_target(surface2);
	draw_clear_alpha(c_black, 0);
	
	var _spr_overline = global.artifacts_inv[pos].overline_sprite
	draw_sprite_ext(_spr_overline, 0, 0+pos*70+_www/5-sprite_get_width(_spr_overline)/2, 32, 0.5, 0.5, 0, c_white, 1);	
	
	for (var i = 0; i < array_length(global.artifacts_inv); i++)
	{
		var _spr = global.artifacts_inv[i].sprite;
		
		draw_sprite_ext(_spr, 0, 0+_www/5-sprite_get_width(_spr)/2 + 70*i, 32, 0.5, 0.5, 0, c_white, 1);
	
		if !global.artifacts_inv[i].found
		{
			draw_sprite_ext(_spr, 0, 0+_www/5-sprite_get_width(_spr)/2 + 70*i, 32, 0.5, 0.5, 0, c_black, 1);	
		}
	}
	
	surface_reset_target();
	
	draw_surface(surface2, _cam_x+124, _cam_y+108)
	
	if showArtifact_info
	{
		var _spr = global.artifacts_inv[pos].sprite;
		
		showArtifact_scale = lerp(showArtifact_scale, showArtifact_scale_to, 0.1);	
		
		draw_set_alpha(showArtifact_scale/showArtifact_scale_to*0.8);
		
		draw_rectangle_colour(_cam_x, _cam_y, _cam_x+_cam_w, _cam_y+_cam_h, c_black, c_black, c_black, c_black, false);
		
		draw_set_alpha(1);
		
		draw_sprite_ext(_spr_overline, 0, _cam_x+256+60-sprite_get_width(_spr_overline)/2*showArtifact_scale, _cam_y + 128+36 - (sprite_get_height(_spr_overline)*showArtifact_scale/2)*(showArtifact_scale/showArtifact_scale_to), showArtifact_scale, showArtifact_scale, 0, c_white, 1);	
		draw_sprite_ext(_spr, 0, _cam_x+256+60-sprite_get_width(_spr)/2*showArtifact_scale, _cam_y + 128+36 - (sprite_get_height(_spr)*showArtifact_scale/2)*(showArtifact_scale/showArtifact_scale_to), showArtifact_scale, showArtifact_scale, 0, c_white, 1);	
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_color(_cam_x+256+60, _cam_y+48, global.artifacts_inv[pos].name, c_white, c_white, c_white, c_white, showArtifact_scale/showArtifact_scale_to);
		
		
		draw_text_ext_color(_cam_x+256+60, _cam_y+290, global.artifacts_inv[pos].desc, 16, _cam_w-32, c_white, c_white, c_white, c_white, showArtifact_scale/showArtifact_scale_to);
		
	} else
	{
		showArtifact_scale = 1;	
	}
	
}	

draw_sprite(Use_inventory, 0, _cam_x+64*6.6, _cam_y+240);