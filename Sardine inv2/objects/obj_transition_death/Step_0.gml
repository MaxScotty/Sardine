var _h = camera_get_view_height(view_camera[0]);


if timer > 0 { timer--; exit; };



if !change
{
	yy = lerp(yy, _h/2, 0.1);
	if yy == _h/2
	{
		room_restart();
		change = true;	
	}
} else
{
	yy = lerp(yy, 0, 0.1);
	
	if yy == 0
	{
		instance_destroy();	
		game_end();
	}
}




