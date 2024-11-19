function PlayerRoll(){
	
	
	sprite[RIGHT] = playerState.Right
	sprite[UP] = playerState.Up
	sprite[LEFT] = playerState.Left
	sprite[DOWN] = playerState.Down

	sprite_index = sprite[face];

	playerState = playerSprite.roll;
	var _wall = oWall;
	var _cAI = oCharacterParent;
	
	XmoveSpdRoll = xspd * speedRoll
	YmoveSpdRoll = yspd * speedRoll
	
	if timer > 0 
	{
	    XmoveSpdRoll = 0;
	    YmoveSpdRoll = 0;
	}
	
	move_distance_remaining = max(0, move_distance_remaining - speedRoll);
	
	mask_index = sprite[DOWN]
	playerState = playerSprite.roll


	var _signX = sign(XmoveSpdRoll);
	var _signY = sign(YmoveSpdRoll);
		
	//collide w wall
		if place_meeting(x+XmoveSpdRoll, y, _wall)
		{
			//if !cantWalk
			//{
			//	while !place_meeting(x+_signX, y, _wall)
			//	{
			//		x+=_signX;	
			//	}
			//}
			PlayerBonk();
			//move_distance_remaining = distanceBonk;*/
			
			XmoveSpdRoll = 0;
		}
		if place_meeting(x, y+YmoveSpdRoll, _wall)
		{
			//if !cantWalk
			//{
			//	while !place_meeting(x, y+_signY, _wall)
			//	{
			//		y+=_signY;	
			//	}
			//}
			PlayerBonk();
			//move_distance_remaining = distanceBonk;*/
			
			YmoveSpdRoll = 0;
			
		}
		
	//collide w NPC	
		if place_meeting(x+XmoveSpdRoll, y, _cAI)
		{
			while !place_meeting(x+_signX, y, _cAI)
			{
				x+=_signX;	
			}
			move_distance_remaining = 0;
			
			XmoveSpdRoll = 0;
			
		}
		if place_meeting(x, y+YmoveSpdRoll, _cAI)
		{
			while !place_meeting(x, y+_signY, _cAI)
			{
				y+=_signY;	
			}
			move_distance_remaining = 0;
			
			YmoveSpdRoll = 0;
		}
	
	if (XmoveSpdRoll == 0 && YmoveSpdRoll == 0 && !Animation)
	{
		image_index = 0;		
	}		
	
	
	
	if !place_meeting(x+_signX, y, _wall) 
	{
		x+=XmoveSpdRoll;
	}
	if !place_meeting(x, y+_signY, _wall)
	{
		y+=YmoveSpdRoll;
	}
	
	
	if move_distance_remaining <= 0
	{
		playerState = playerSprite.idle;
	}
	
}