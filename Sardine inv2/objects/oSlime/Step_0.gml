
event_inherited();



	if place_meeting(x+1, y, oWall)
	{
		x-=enemySpeed;	
		
	}
	if place_meeting(x-1, y, oWall)
	{
		x+=enemySpeed;	
	}
	if place_meeting(x, y+1, oWall)
	{
		y-=enemySpeed;	
	}
	if place_meeting(x, y-1, oWall)
	{
		y+=enemySpeed;	
	}