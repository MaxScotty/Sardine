inputX = 0;
inputY = 0;

move_speed = 2;

moving = false;
targetX = x;
targetY = y;

get_sprite = function(dir) 
{
//dir = moveDirection;
	
	if (dir == 0) return NPCstate.right;
	else if (dir == 90) return NPCstate.up;
	else if (dir == 180) return NPCstate.left;
	else if (dir == 270) return NPCstate.down;
	
	return sprite_index;
}

set_state = function(NewState)
{
	if (NPCstate == NewState) return;
	
	NPCstate = NewState;
	image_index = 0;
}

move_to_points = function(_targetX, _targetY)
{
	var _canMove = mp_grid_path(global.AIgrid, path, x, y, _targetX, _targetY, false);
	
	if (_canMove)
	{
		pathNextPoint = 1;
		
		pathPointX = 0;
		pathPointY = 0;
	}
}

//shader
flash = 0;
uFlash =  shader_get_uniform(shWhiteFlash, "flash");