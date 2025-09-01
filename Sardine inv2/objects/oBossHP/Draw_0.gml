var _spr = sBossHP;
var _sprW = sprite_get_width(_spr) * 3;
var _sprH = sprite_get_height(_spr) * 3;

var xPosition = room_width/2;
var yPosition = 50;

var xOffset = (xPosition - round(_sprW/2));
var yOffset = (yPosition - round(_sprH/2));

/*draw_sprite_ext(_spr, 0, xOffset, yOffset, 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 1, xOffset, yOffset, (global.BossHPPrev/global.BossHPMax) * 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 2, xOffset, yOffset, (global.BossHP/global.BossHPMax) * 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 3, xOffset, yOffset, 3, 3, 0, c_white, 1);*/

//var _number = sprite_get_number(_spr) - 1;
var _img = (global.BossHP/global.BossHPMax); //*_number
var _imgPrev = (global.BossHPPrev/global.BossHPMax); //*_number

draw_sprite_ext(_spr, 0, xOffset, yOffset, 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 1, xOffset, yOffset, _imgPrev * 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 2, xOffset, yOffset, _img * 3, 3, 0, c_white, 1);
draw_sprite_ext(_spr, 3, xOffset, yOffset, 3, 3, 0, c_white, 1);




//shader_set(sha_disering);

//shader_set_uniform_f(shader_get_uniform(sha_disering, "scale"), 2);

//draw_sprite_ext(_spr, 2, xOffset, yOffset, (global.BossHP/global.BossHPMax) * 3, 3, 0, c_white, 1);

//draw_rectangle(0, 0, 128, 128, false)

//shader_reset();


//Marker 
/*
var xLength = 288*3;
var _MarkerValue = 250;
var _MarkerCount = global.BossHPMax/_MarkerValue;
var _MarkerOffset = xLength/_MarkerCount;

for(var i = 1; i < _MarkerCount; i++)
{
	draw_sprite_ext(sMarker, 0, xOffset + (_MarkerOffset*i)-1, yOffset - 4, 3, 3, 0, c_white, 1);
}
*/
depth = -99999;