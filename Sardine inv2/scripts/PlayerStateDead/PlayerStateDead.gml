function PlayerStateDead()
{
	with (oSardine)
	{
		xspd = 0;
		yspd = 0;
		
		if(sprite_index != sSardineDeath) && (sprite_index != sSardineDeath)
		{
			//update the sprite
			set_0_frame = true;
			image_index+=6/60;
			sprite_index = sSardineDeath;
			image_speed = 0.7;
		}
	
		//Animation ending the frame?
		if (image_index + image_speed > image_number)
		{
			if(sprite_index == sSardineDeath)
			{
				image_speed = max(0, image_speed - 0.03);
			
				if(image_speed < 0.07)
				{
					image_index = 0;
					sprite_index = sSardineDeath;
					image_speed = 1.0;
				}
			}
			else
			{
				image_speed = 0;
				image_index = image_number - 1;
				game_end();
			}
		}
	}
}