#macro TILESIZE 32

function to_tile(val)
{
	return (val div TILESIZE);
}

function to_room(val)
{
	return (val * TILESIZE);
}

/*function collision(tileX, tileY)
{
	var roomX = to_room(tileX + 0.5);
	var roomY = to_room(tileY + 0.5);
	
	if position_meeting(roomX, roomY, oCharacterParent) return true;
	
	return false;
}