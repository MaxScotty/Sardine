function SlimeWander(){
	
	sprite_index = sprMove;
	
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance/enemySpeed)
	{
		xspd = 0;
		yspd = 0;
		
		//end of animation
		if (image_index < 1)
		{
			image_speed = 0.0
			image_index = 0;
		}
		
		//wait++;
		//set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = random_range(0, 360)
			//dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45)
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else // move towards new destination
	{
		timePassed++
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		
		if xTo > x 
		{
			image_xscale = 1;	
		} else
		{
			image_xscale = -1;	
		}
		
		
		var _speedThisFrame = enemySpeed;
		_speedThisFrame = min(enemySpeed, _distanceToGo);
		dir = point_direction(x, y, xTo, yTo);
		xpsd = lengthdir_x(_speedThisFrame, dir);
		ypsd = lengthdir_y(_speedThisFrame, dir);
		if (xspd != 0) image_xscale = sign(xspd);
			
		//collide and move
		var _collision = EnemyTileCollision();
		
		if !_collision 
		{
			move_to_point(xTo, yTo, enemySpeed);
		} 
		
	}
	
	//check for aggro
	if(++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oSardine)) && (point_distance(x, y, oSardine.x, oSardine.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = oSardine;
		}
	}
}