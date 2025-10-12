//phase
if (boss_phase == 1 && global.BossHP <= 0 && !phase_transition)
{
	boss_phase = 2;
	phase_transition = true;
	transition_timer = 0;
	
	global.BossHPMax = 2000;
	global.BossHP = global.BossHPMax;
	
	is_jumping = false;
}

//transition to phase
if (phase_transition)
{
	transition_timer++;
	
	if(transition_timer < 30)
	{
		if(transition_timer % 10 == 0)
		{
			is_shaking = true;
            alarm_set(0, 0.2 * room_speed);
		}
	}
	
	else if (transition_timer >= transition_duration)
	{
		phase_transition = false;
		
		sprite_index = spr_phase_2;
		
		//improving characteristics
	}
}

// shaking
if(is_shaking)
{
	var _x = camera_get_view_x(Camera) + random_range(-10, 10);
	var _y = camera_get_view_y(Camera) + random_range(-10, 10);
	
	camera_set_view_pos(Camera, _x, _y);
}
else
{
	var _x = camera_get_view_x(Camera)
	var _y = camera_get_view_y(Camera)
	
	_x = lerp(_x, camera_position_x, 0.1);
	_y = lerp(_y, camera_position_x, 0.1);
}

// jumping
if (keyboard_check_pressed(vk_space) && !is_jumping) {
    is_jumping = true;
    jump_timer = 0;
    lock_position_timer = 0;
    target_Bx = oSardine.x;
    target_By = oSardine.y;
}

if (is_jumping) {
    jump_timer += 1;
    
    if (jump_timer < 15) {
        var _factor = jump_timer/15;
        var _result = 1;
        for (var i = 0; i < launch_curve; i++) {
            _result *= _factor;
        }
        y -= jump_power * _result; 
    }
    else if (jump_timer < jump_duration) {
        if (jump_timer % 5 == 0) {
            target_Bx = oSardine.x;
            target_By = oSardine.y;
        }
        
        x = lerp(x, target_Bx, 0.08);
        
        if (jump_timer >= jump_duration - lock_position_delay) {
            lock_position_timer++;
            
            if (lock_position_timer == 10) {
                final_target_x = target_Bx;
                final_target_y = target_By;
            }
            
            if (lock_position_timer >= 10) {
                x = lerp(x, final_target_x, 0.15);
                target_Bx = final_target_x;
                target_By = final_target_y;
            }
        }
        
        if (y > -100) y = -sprite_height;
        xx = x;
        yy = y;
    } 
    else {
        y += crash_speed;
        x = lerp(x, final_target_x, 0.2);
        
        if (y >= final_target_y) {
            y = final_target_y;
            is_jumping = false;
			
			//shake the camera
			event_user(0);
			
            //damage
               
            }
        }
    }
//}
// moving
if (boss_phase == 2 && !phase_transition && !is_jumping) {
    var move_speed = 1.5;
    var dir_x = oSardine.x - x;
    var dir_y = oSardine.y - y;
    var dist = point_distance(x, y, oSardine.x, oSardine.y);
    
    if (dist > 50) { 
        if (dist > 0) {
            dir_x /= dist;
            dir_y /= dist;
        }
        
        x += dir_x * move_speed;
        y += dir_y * move_speed;
    }
}