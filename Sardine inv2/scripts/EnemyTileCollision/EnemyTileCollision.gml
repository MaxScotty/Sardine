function EnemyTileCollision(){
	var _collision = false;
	
	if (place_meeting(x + xspd, y, oWall))
	{

		xspd = 0;
		_collision = true
	}
	
	if (place_meeting(x, y + yspd, oWall))
	{

		yspd = 0;
		_collision  = true;
	}
	
	return _collision;
}
