function SlimeHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		xspd = lengthdir_x(enemySpeed, dir);
		yspd = lengthdir_y(enemySpeed, dir);
		if (xspd != 0) image_xscale = -sign(xspd);
		
		//collise and move]
		var _collision = EnemyTileCollision();
		
		if (_collision == true)
		{
			xTo = x;
			yTo = y;
		}
		else move_to_point(xTo, yTo, enemySpeed);
	}
	else
	{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
}

function SlimeDie()
{
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x, y, xTo, yTo);
		xspd = lengthdir_x(enemySpeed, dir);
		yspd = lengthdir_y(enemySpeed, dir);
		if (xspd != 0) image_xscale = -sign(xspd)
		
		//collide & move
		var _collision = EnemyTileCollision();
		
		if !_collision 
		{
			move_to_point(xTo, yTo, enemySpeed);
		} 
	}
	else 
	{
		x = xTo;
		y = yTo;
	}
	
	if(image_index + (sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}