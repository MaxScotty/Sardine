draw_self()

switch stating 
{
	case BattleStates.idle:
		sprite_index = sSardineIdle;
	break
	case BattleStates.attack:
		sprite_index = sSardineAttack;
	break
	case BattleStates.defend:
		sprite_index = sSardineDefend;
	break
	case BattleStates.down:
		sprite_index = sSardineDown;
	break
}