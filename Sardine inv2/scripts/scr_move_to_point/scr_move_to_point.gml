/// @param x
/// @param y
/// @param spd
/// @param [face]
function move_to_point(_x, _y, _spd)
{
	var _end = false;
	
	var _dist = point_distance(x, y, _x, _y);
	var _dir = point_direction(x, y, _x, _y);
	
	var _final_spd = min(_spd, _dist);
	
	var _len_x = lengthdir_x(_final_spd, _dir);
	var _len_y = lengthdir_y(_final_spd, _dir);
	
	if x == _x && y == y 
	{
		_end = true;	
	}
	
	x+=_len_x;
	y+=_len_y;
	
	if argument_count > 3
	{
		face = argument[3];	
	}
	
	return _end;
	
}
