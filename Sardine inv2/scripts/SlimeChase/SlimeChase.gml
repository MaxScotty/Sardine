function SlimeChase(){
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			xspd = lengthdir_x(enemySpeed, dir);
			yspd = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			xspd = lengthdir_x(_distanceToGo, dir);
			yspd = lengthdir_y(_distanceToGo, dir);
		}
		if (xspd != 0) image_xscale = sign(xspd);
		
		
		if (_distanceToGo >= enemyGiveUpRange) state = ENEMYSTATE.WANDER;
		
		//collide and move
		var _collision = EnemyTileCollision();
		
		if !_collision 
		{
			move_to_point(xTo, yTo, enemySpeed);
			
			if(point_distance(x,y,oSardine.x,oSardine.y) <= enemyAggroRadius / 2){
					x = xprevious;
					y = yprevious;
			}
		} 
	}
	
	//check if close enough to launch an attack
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8px past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
}