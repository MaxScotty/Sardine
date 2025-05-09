function HurtPlayer(_direction, _force, _damage)
{
	if(oSardine.invulnerable <= 0)
	{
		global.playerHealth =  max(0, global.playerHealth - _damage);
		
		if (global.playerHealth > 0)
		{
			with(oSardine)
			{
				//cantWalk = false;
				
				death_bonk_length = _force;
				
				PlayerBonk(true);
			
				direction = _direction;
				

				
				flash = 0.7;
				invulnerable = 60;
				flashShader = shRedShader;
			}
		}
		else
		{
			//kill the player
			with(oSardine) PlayerStateDead();
			
			with(oSlime) state = ENEMYSTATE.IDLE

			if !instance_exists(obj_transition_death)
			{
				instance_create_depth(0, 0, -9999, obj_transition_death);	
			}
		}
	}
}