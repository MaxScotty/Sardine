
oSardine.move_spd = 0;

if(leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if(percent >= 1)
	{
		oSardine.x = global.TargetX;
		oSardine.y = global.TargetY;
		oSardine.face = global.TargetDirection;
		room_goto(global.TargetRoom);
		leading = IN;
	}
}
else
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0)
	{
		instance_destroy();
	}
}