if room != rm
{
	if alpha < 1
	{
		alpha += spd;	
	} else
	{
		var _id = id;
		with (oSardine)
		{	
			x = _id.xx;
			y = _id.yy;
			face = _id.face;
		}
		room_goto(rm);
	}
} else
{
	if alpha > 0
	{
		alpha -= spd;	
	} else
	{
		instance_destroy();	
	}
}