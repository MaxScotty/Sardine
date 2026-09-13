
if timerNotUse > 0 
{
	timerNotUse--;
	exit;
}

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

var _in_cam = (x >= _cam_x && x <= _cam_x+_cam_w && y >= _cam_y && y <= _cam_y+_cam_h);

if !_in_cam
{
	if !is_anyone_of_my_great_sweet_childs_exists_anymore()
	{
		enemies_number = irandom_range(create_range_from, create_range_to);
		myEnemies = [];
		
		for (var i = 0; i < enemies_number; i++)
		{
			var _inst = instance_create_depth(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), 0, enemie);	
			array_push(myEnemies, _inst);
		}	
	}
}