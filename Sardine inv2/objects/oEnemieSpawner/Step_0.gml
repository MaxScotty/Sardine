
if timerNotUse > 0 
{
	timerNotUse--;
	exit;
}

var _cam = view_camera[0];

var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);

var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

var _in_cam = (bbox_right  >= _cam_x            &&
               bbox_left   <= _cam_x + _cam_w    &&
               bbox_bottom >= _cam_y            &&
               bbox_top    <= _cam_y + _cam_h);

if !_in_cam
{
	if create_enemies
	{
		enemies_number = irandom_range(create_range_from, create_range_to);
		//myEnemies = [];
		
		array_foreach(myEnemies, function(i)
		{
			if instance_exists(i)
			{
				instance_destroy(i);	
			}
		})
		
		myEnemies = [];
	
		for (var i = 0; i < enemies_number; i++)
		{
			var _inst = instance_create_depth(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), 0, enemie);	
			array_push(myEnemies, _inst);
		}	
		
		create_enemies = false;
	}
} else
{
	create_enemies = true;	
}