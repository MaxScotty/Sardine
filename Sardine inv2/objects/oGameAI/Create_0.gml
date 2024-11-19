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
		
		if (_col) mp_grid_add_cell(global.AIgrid, _x, _y)
	}
}