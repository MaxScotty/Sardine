jump_power = 35;          
crash_speed = 60;         
jump_duration = 360;      
damage = 40;              

is_jumping = false;
jump_timer = 0;
target_Bx = 0;
target_By = 0;
final_target_x = 0;      
final_target_y = 0;
lock_position_timer = 0;  
lock_position_delay = 120; //2 second

launch_curve = 1.8;

shadow_x = x;
shadow_y = y;
shadow_minus_range = 0;

xx = 0;
yy = 0;

img_xscale = image_xscale;

//camera
Camera = view_camera[0];
camera_position_x = camera_get_view_x(Camera);
camera_position_y = camera_get_view_y(Camera);

is_shaking = false;
shake_amount = 10;
shake_timer = 0.2;

//phases
boss_phase = 1;
phase_transition = false;
transition_timer = 0;
transition_duration = 90;

spr_phase_1 = sBoss;
spr_phase_2 = sBoss2;
//transition sprite


