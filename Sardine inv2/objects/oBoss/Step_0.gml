if (keyboard_check_pressed(vk_space) && !is_jumping) {
	
    is_jumping = true;
    jump_timer = 0;
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
        x = lerp(x, target_Bx, 0.02);
        if (y > -100) y = -sprite_height;
    } 
    else {
        y += crash_speed;
        if (y >= target_By) {
            y = target_By;
            is_jumping = false;
            //damage
        }
    }
}