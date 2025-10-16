application_surface_draw_enable(false);

var _camera = view_get_camera(0);
var _cam_width = camera_get_view_width(_camera);
var _cam_height = camera_get_view_height(_camera);

light_surface = surface_create(_cam_width, _cam_height);

//camera
camera = camera_create_view(0, 0, _cam_width, _cam_height, 0, oSardine, -1, -1, _cam_width/2, _cam_height/2);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, camera);

//-------NPC-------

//collision
collision = layer_tilemap_get_id("Walls");

//MP grid
var _gridWidth = to_tile(room_width);
var _gridHeight = to_tile(room_height); 
global.AIgrid = mp_grid_create(0, 0, _gridWidth, _gridHeight, TILESIZE, TILESIZE);

mp_grid_add_instances(global.AIgrid, oWall, false);

for (var _x = 0; _x < _gridWidth; _x++)
{
	for (var _y = 0; _y < _gridHeight; _y++)
	{
		var _col = tilemap_get(collision, _x, _y);
		
		if (_col) mp_grid_add_cell(global.AIgrid, _x, _y);
	}
}

