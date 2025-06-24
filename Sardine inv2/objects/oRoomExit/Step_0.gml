if(instance_exists(oSardine)) && (position_meeting(oSardine.x, oSardine.y, id))
{
	global.TargetRoom = TargetRoom;
	global.TargetX = TargetX;
	global.TargetY = TargetY;
	TargetFace = oSardine.face
	global.TargetDirection = TargetFace;
	room_goto(TargetRoom);
	instance_destroy();
}