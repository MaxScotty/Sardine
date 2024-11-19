//input
if (inputX != 0 || inputY != 0)
{
	if (!moving)
	{
		if (inputX != 0 ) inputY = 0;
		
		//new position
		var _newTileX =  to_tile(x) + inputX;
		var _newTileY =  to_tile(y) + inputY;
		
		//collision
		var _col = false;		//collision(_newTileX, _newTileY);
		
		if (!_col)
		{
			targetX = to_room(_newTileX + 0.5);
			targetY = to_room(_newTileY + 0.5);
			
			moving = true;
		}
	}
}

//move
if (moving)
{
	set_state(NPCstates.walk);
	
	var _distance = point_distance(x, y, targetX, targetY);
	
	if (_distance > move_speed)
	{
		x += sign(targetX - x) * move_speed;
		y += sign(targetY - y) * move_speed;
		
		moveDirection = point_direction(x, y, targetX, targetY);
		
		if NPCstate == NPCstates.walk
		{
			image_speed = 1
			switch (round(moveDirection/90))
			{
				case 0: sprite_index = NPCstates.walk.right break;
				case 1: sprite_index = NPCstates.walk.up break;
				case 2: sprite_index = NPCstates.walk.left break;
				case 3: sprite_index = NPCstates.walk.down break;
			}
		}
	}
	else
	{
		x = targetX;
		y = targetY;
		
		moving = false;
		image_speed = 0
	}
}
else
{
	set_state(NPCstates.idle);
}