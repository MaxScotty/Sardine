KeyRight = input_check("right");
KeyLeft = input_check("left");
KeyUp = input_check("up");
KeyDown = input_check("down");
keyRoll = input_check_pressed("shift");
keyAttack = input_check_pressed("action");



if set_0_frame
{
	if(sprite_index != sSardineDie) && (sprite_index != sSardineDeath)
	{
		image_index = 0;
		set_0_frame = false;
	}
}


var _horizKey = KeyRight - KeyLeft;
var _vertKey = KeyDown - KeyUp;
dir = point_direction(0, 0, _horizKey, _vertKey);

var _dist = point_distance(0, 0, _horizKey*move_spd, _vertKey*move_spd);

xspd = lengthdir_x(_dist, dir);
yspd = lengthdir_y(_dist, dir);

if timer > 0 
{
	timer--;
    xspd = 0;
    yspd = 0;
    XmoveSpdRoll = 0;
    YmoveSpdRoll = 0;
}

if timer <= 0
{
    if cantWalk { cantWalk = false; };
}


//==========Bonk==========
//if playerState = playerSprite.bonk
//{	
	


//}

	if cantWalk && timer > 0
	{
		
		if timer < time
		{
			if place_meeting(x+recXspd, y, oWall)
			{
				recXspd = 0;
			}
			if place_meeting(x, y+recYspd, oWall)
			{
				recYspd = 0;
			}
		}

		var _dist = point_distance(x, y, x+recXspd, y+recYspd);

		var _dir = point_direction(x, y, x+recXspd, y+recYspd);

		var _lenX = lengthdir_x(min(4, _dist), _dir);
		var _lenY = lengthdir_y(min(4, _dist), _dir);

		
		x+=_lenX;
		y+=_lenY;
	}


//if place_meeting(x, y, oWall)
//{
//	if place_meeting(x+32, y, oWall)
//	{
//		x+=32;	
//	}
	
//	if place_meeting(x, y+32, oWall)
//	{
//		y+=32;	
//	}
//}


if move_distance_remaining > 0
{	
	
	PlayerRoll();	
	exit;
	
} else
{
	if xspd == 0 && yspd == 0 && !Animation && (sprite_index != sSardineDie) && (sprite_index != sSardineDeath)
	{
		image_index = 0;	
	}
}



/*
XmoveSpdRoll = xspd * 5
YmoveSpdRoll = yspd * 5;

move_distance_remaining = max(0, move_distance_remaining - XmoveSpdRoll);
move_distance_remaining = max(0, move_distance_remaining - YmoveSpdRoll);
*/

//rXspd = (keyRoll * move_spd) * 1.2
//rYspd = (keyRoll * move_spd) * 1.2

if instance_exists(oTextbox)
	{
	move_spd = 0;
	}
if (!instance_exists(oTextbox))
	{
	move_spd = 3;
	}	
if instance_exists(oPauser)
{
	xspd = 0;
	yspd = 0; 
}


if sprite_index == sSardineDie || sprite_index == sSardineDeath
{	
	xspd = 0;
	yspd = 0;
	move_spd = 0;
	image_speed = 1;
}


//collisions 
PlayerCollision();


sprite[RIGHT] = playerState.Right
sprite[UP] = playerState.Up
sprite[LEFT] = playerState.Left
sprite[DOWN] = playerState.Down

//set sprite
mask_index = sprite[DOWN];
if yspd == 0
	{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 and face == LEFT {face = RIGHT};
if xspd < 0 and face == RIGHT {face = LEFT};
if xspd == 0
	{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 and face == UP {face = DOWN};
if yspd < 0 and face == DOWN {face = UP};
sprite_index = sprite[face];

if keyRoll 
{
	if xspd != 0 || yspd != 0
	{
		move_distance_remaining = distanceRoll
	}
}
else playerState = playerSprite.idle 

//move the player
x += xspd;
y += yspd; 

//animate
if (xspd == 0 and yspd == 0 and !Animation and (sprite_index != sSardineDie) && (sprite_index != sSardineDeath))
{
	image_index = 0;
} 

if (xspd == 0 and yspd ==0)
{
	if Animation == true
	{
		//animation
		playerState = playerSprite.Attack
		sprite_index = sprite[face]
		
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack)

		spriteHB[RIGHT] = playerSprite.Hitbox.Right
		spriteHB[UP] = playerSprite.Hitbox.Up
		spriteHB[LEFT] = playerSprite.Hitbox.Left
		spriteHB[DOWN] = playerSprite.Hitbox.Down
		
		mask_index = spriteHB[face];
		var hitByAttackNow = ds_list_create();
		var hits = instance_place_list(x, y, oCharacterParent, hitByAttackNow, false);
		if (hits > 0)
		{
			for(var i = 0; i < hits; i++)
			{
				//hit this bitch!
				var hitID = hitByAttackNow[| i];
				if(ds_list_find_index(hitByAttack, hitID) == -1)
				{
					ds_list_add(hitByAttack, hitID);
					with(hitID)
					{
						if (entityHitScript != -1) script_execute(entityHitScript);
					}
				}
			}
		}
	
		ds_list_destroy(hitByAttackNow);

		mask_index = sprite[face]
		
		//enemy Attack
		mask_index = spriteHB[face];
		
		
			var hitByAttackNowEnemy = ds_list_create();
			var hitsEnemy = instance_place_list(x, y, EnemyParent, hitByAttackNowEnemy, false);
			if (hitsEnemy > 0)
			{
				for(var i = 0; i < hitsEnemy; i++)
				{
					//hit this bitch!
					var hitIDenemy = hitByAttackNowEnemy[| i];
					if(ds_list_find_index(hitByAttack, hitIDenemy) == -1)
					{
						ds_list_add(hitByAttack, hitIDenemy);
						with(hitIDenemy)
						{
							HurtEnemy(id, 5, other.id, 10);
						}
					}
				}
			}
		
			ds_list_destroy(hitByAttackNowEnemy);
		
		
		
		
		mask_index = sprite[face]

		//end of the animation
		if image_index >= sprite_get_number(sprite_index)-1
		{
			Animation = false;
			playerState = playerSprite.idle
		}
	}
}
else 
{
	canHurtEnemy = true;
	Animation = false
}

//if _getAttack >= 1
//{
//	image_index=2;
//}	
	
//fight
if (keyAttack)
{
	Animation = true;
}
	
if (oPauseMenu.pause == false)
{
	invulnerable = max(invulnerable - 1, 0)
	flash = max(flash - 0.05, 0)
}
	
//depth
depth = -bbox_bottom;













if death_bonk
{
	cantWalk = false;
	if death_bonk_set_coord == false
	{
		death_bonk_coordX = x+lengthdir_x(death_bonk_length, direction);
		death_bonk_coordY = y+lengthdir_y(death_bonk_length, direction);
		death_bonk_spd = death_bonk_length/8;
		death_bonk_set_coord = true;
	}
	
	death_bonk_spd = lerp(death_bonk_spd, 0, 0.08);
	
	if move_to_point(death_bonk_coordX, death_bonk_coordY, death_bonk_spd) || floor(death_bonk_spd) == 0
	{
		death_bonk_set_coord = false;
		cantWalk = true;
		death_bonk = false;
	}
}





if place_meeting(x+move_spd, y, oWall)
{
	x-=move_spd;	
}

if place_meeting(x-move_spd, y, oWall)
{
	x+=move_spd;	
}

if place_meeting(x, y+move_spd, oWall)
{
	y-=move_spd;	
}

if place_meeting(x, y-move_spd, oWall)
{
	y+=move_spd;	
}

if global.set_quest_flower_to_2
{
	if global.QuestStatus[? "The flower quest"] == 1
	{
		global.QuestStatus[? "The flower quest"] = 2;	
		global.set_quest_flower_to_2 = false;
	}
}



