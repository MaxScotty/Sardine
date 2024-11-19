enum states 
{
	battlestart,
	playerchoose,
	playerdealdamage,
	enemyattack,
	enemyend,
	battleend
}

enum status
{
	idle,
	attack,
	defend,
	down,
}

stating = states.battlestart;

alarm[0] = 60;

global.font = font_add_sprite(sAncientLanguage, 32, true, 1);

//Сколько заработано в битве
