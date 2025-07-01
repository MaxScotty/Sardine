#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

#macro TILESIZES 32

#macro DIES 4
#macro DEAD 5

#macro TRANSITION_SPEED 0.02
#macro OUT 0.0
#macro IN 1.0


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