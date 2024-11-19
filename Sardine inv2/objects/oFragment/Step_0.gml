if !set_dir
{
	dir0 = random_range(0, 360);
	dir1 = random_range(0, 360);
	
	set_dir = true;
}

//bounce
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed);
		if (bounce > pi)
		{
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = sin(bounce) * bounceHeight;
	}
	else z = 0;
	
	deteriorate++;
	if (deteriorate > deteriorateAfter)
	{
		image_alpha -= 1/deteriorateTime;
		if (image_alpha <= 0) instance_destroy();
	}
	
	//friction
	fric = 0.05;
	if (z == 0) fric = 0.10;
	
	//move
	x+=lengthdir_x(spd, dir0);
	y+=lengthdir_y(spd, dir1);
	//if (tilemap_get_at_pixel(collision, x, y) > 0) spd = 0;
	if spd > 0
	{

		spd-=0.1;	
		
	} else
	{
		spd = 0;	
	}

	if place_meeting(x+lengthdir_x(spd, dir0), y, oWall)
	{
		spd = 0;	
	}
	
	if place_meeting(x, y+lengthdir_y(spd, dir1), oWall)
	{
		spd = 0;	
	}
