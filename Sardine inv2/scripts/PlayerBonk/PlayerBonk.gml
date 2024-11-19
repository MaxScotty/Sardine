function PlayerBonk(_death = false){
	with (oSardine)
	{
		if _death == false
		{
			var _signX = sign(XmoveSpdRoll);
			var _signY = sign(YmoveSpdRoll);
	
			playerState = playerSprite.bonk;

			if cantWalk = false
			{
			    
				recXspd = -_signX*64;
				recYspd = -_signY*64;


				time = 20;
				timer = time;
				cantWalk = true;
			}
		} else
		{
			death_bonk = true;
		}
	}
}