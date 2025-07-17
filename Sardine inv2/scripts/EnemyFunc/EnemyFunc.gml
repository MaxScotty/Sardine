function HurtEnemy(_enemy, _damage, _source, _knockback){
	
	with(_enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			if canHurtMeTimer <= 0
			{
				enemyHP -= _damage;
				canHurtMeTimer = canHurtMeTime;
			}
			flash = 1;
			
			//hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
				oSardine.add_xp(XpValue);
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0)
			{
				var _knockDirection = point_direction(x, y, (_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}