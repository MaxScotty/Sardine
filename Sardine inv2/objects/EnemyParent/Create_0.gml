//VARIABLES
//shader
flash = 0;
uFlash =  shader_get_uniform(shWhiteFlash, "flash");

state = ENEMYSTATE.IDLE;
xspd = 0;
yspd = 0;
xTo = x;
yTo = y;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;
collisionMap = layer_tilemap_get_id(layer_get_id("Walls"));
aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;
enemyGiveUpRange = 100;

//enemy sprite
sprMove = sSlimeHurt;

//enemy scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;

canHurtMeTimer = 0;
canHurtMeTime = 15;