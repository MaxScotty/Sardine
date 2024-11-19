//random movement
if (moves)
{
	//move to new point
	var _targetX = irandom_range(xstart - moveRange, xstart + moveRange);
	var _targetY = irandom_range(ystart - moveRange, ystart + moveRange);
	var _tileX = to_tile(_targetX) + 0.5;
	var _tileY = to_tile(_targetY) + 0.5;
	
	move_to_points(to_room(_tileX), to_room(_tileY));
	
	//reset alarm
	alarm[0] = irandom_range(minMoveTime, maxMoveTime);
}