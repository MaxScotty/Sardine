function PlayerCollision(){
	var _obj = noone;
	with oSardine
	{
		if place_meeting(x + xspd, y, oWall) 
		{
			while !place_meeting(x+sign(xspd), y, oWall)
			{
				x+=sign(xspd);	
			}
			
			xspd = 0;
		}
		if place_meeting(x, y + yspd, oWall)
		{
			while !place_meeting(x, y+sign(yspd), oWall)
			{
				y+=sign(yspd);	
			}
			
			yspd = 0;
			_obj = oWall;
		}
	
	
	
		if place_meeting(x + xspd, y, oCharacterParent) 
		{
			while !place_meeting(x+sign(xspd), y, oCharacterParent)
			{
				x+=sign(xspd);	
			}
			
			xspd = 0; 
			
			var c = instance_position(round(x), round(y), oCharacterParent);
			if (c == oCollectible) x += sign(xspd);
			
		}
		if place_meeting(x, y + yspd, oCharacterParent) 
		{
			while !place_meeting(x, y+sign(yspd), oCharacterParent)
			{
				y+=sign(yspd);	
			}
			
			yspd = 0;
			
			var c = instance_position(round(x), round(y), oCharacterParent);
			if (c == oCollectible) y += sign(yspd);
		
			_obj = oCharacterParent;
		}
		
		//var c = instance_position(round(x), round(y), oCharacterParent);
		//if (c == oCoin) exit;
	}
	return _obj;
}