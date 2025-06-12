 gpu_set_blendenable(false);

if(pause)
{
    surface_set_target(application_surface);
	draw_clear_alpha(c_black, 0);
	
    if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
    else
    {
        pauseSurf = surface_create(resW, resH);
        buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
    }
    surface_reset_target();
}

if (input_check_pressed("pause"))
{
    if (!pause)
    {
        pause = true;
		
        instance_deactivate_all(true);
		instance_activate_object(input_controller_object)
		instance_activate_object(oUI)
		
	    pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
			draw_clear_alpha(c_black, 0);
            draw_surface(application_surface, 0, 0);
        surface_reset_target();

        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
    }
}

gpu_set_blendenable(true);

//if (input_check_pressed("pause"))
//{
//	pause = true;
//	instance_deactivate_all(true);
//	instance_activate_object(input_controller_object)
//	instance_activate_object(oUI)	
//}

