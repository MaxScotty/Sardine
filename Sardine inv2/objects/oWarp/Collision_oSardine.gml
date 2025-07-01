global.TargetX = target_x;
global.TargetY = target_y;
global.TargetRoom = target_rm;
global.TargetDirection = target_face;

if (!instance_exists(oTransition))
{
	oSardine.x = target_x;
	oSardine.y = target_y;
	oSardine.face = target_face;
	RoomTransition(TRANS_TYPE.FADE, target_rm);
	instance_destroy();
}