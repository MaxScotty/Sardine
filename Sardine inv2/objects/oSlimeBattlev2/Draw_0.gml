draw_self()

switch stating
{
	case BattleStates.idle:
		sprite_index = sSlimeIdle2;
	break
	case BattleStates.attack:
		sprite_index = sSlimeAttack;
	break
	case BattleStates.defend:
		sprite_index = sSlimeIdle2;
	break
	case BattleStates.down:
		sprite_index = sSlimeDead;
	break
}