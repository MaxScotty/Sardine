var _xx = camera_get_view_x(view_camera[0]);
var _yy = camera_get_view_y(view_camera[0]);

var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

draw_sprite_ext(sDark, 0, _xx, _yy, _w, yy, 0, c_black, 1);
draw_sprite_ext(sDark, 0, _xx, _yy+_h, _w, -yy, 0, c_black, 1);


