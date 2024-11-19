function SlimeAttack(){
	var _spd = enemySpeed;
	
	sprite_index = sprAttack;
	
	//don't move while still ready to jump
	if (image_index < 2) _spd = 0;
	
	//freeze animation while in mid-air
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0; 
	
	//how far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing end of the animation
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		xspd = lengthdir_x(_spd, dir);
		yspd = lengthdir_y(_spd, dir);
		if (xspd != 0) image_xscale = sign(xspd);
		
		//commit to move and stop moving if we hit the wall
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
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}