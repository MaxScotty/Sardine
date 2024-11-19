event_inherited();

state = ENEMYSTATE.WANDER;

//enemy sprites
sprMove = sSlimeTest;
sprAttack = sSlimeAttackTest;
sprDie = sSlimeDeath;
sprHurt = sSlimeHurt;

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

xTo = x;
yTo = y;
