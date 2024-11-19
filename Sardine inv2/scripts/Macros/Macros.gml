#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

#macro TILESIZES 32

#macro DIES 4
#macro DEAD 5


enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT 
}