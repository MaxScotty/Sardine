// Inherit the parent event
event_inherited();

ActivateFlower();

depth = -bbox_bottom;

NPC_spr[RIGHT] = NPCstate.right;
NPC_spr[UP] = NPCstate.up;
NPC_spr[LEFT] = NPCstate.left;
NPC_spr[DOWN] = NPCstate.down;

var _face = DOWN

/*if instance_exists(oTextbox)
{
	sprite_index = NPC_spr[_face];
}*/

//TALK
if (place_meeting((x - 2), (y), oSardine) && oSardine.face == RIGHT && (!instance_exists(oTextbox)) && input_check("accept")) //or (place_meeting((x - 1), (y), oSardine) && oSardine.face == RIGHT && (!instance_exists(oTextbox)) && keyboard_check(vk_space)) 
	{
	    if input_check_pressed("accept") && oItemManager.showInv == false //or keyboard_check_pressed(vk_space)
		{
	        CreateTextbox(text_id)
			sprite_index = NPC_spr[_face];
			_face = LEFT
	        move_speed = 0;
		}
	}

if (place_meeting((x), (y + 2), oSardine) && oSardine.face == UP && (!instance_exists(oTextbox)) && input_check("accept")) //or (place_meeting((x), (y + 1), oSardine) && oSardine.face == UP && (!instance_exists(oTextbox)) && keyboard_check(vk_space))
	{
	    if input_check_pressed("accept") && oItemManager.showInv == false   //or keyboard_check_pressed(vk_space)
		{
	        CreateTextbox(text_id)
			sprite_index = NPC_spr[_face];
			_face = DOWN
			move_speed = 0;
		}
	}

if (place_meeting((x + 2), (y), oSardine) && oSardine.face == LEFT && (!instance_exists(oTextbox)) && input_check("accept")) //or (place_meeting((x + 1), (y), oSardine) && oSardine.face == LEFT && (!instance_exists(oTextbox)) && keyboard_check(vk_space))
	{
	    if input_check_pressed("accept") && oItemManager.showInv == false //or keyboard_check_pressed(vk_space)
		{
			CreateTextbox(text_id)
			sprite_index = NPC_spr[_face];
			_face = RIGHT
			move_speed = 0;
		}
	}

if (place_meeting((x), (y - 2), oSardine) && oSardine.face == DOWN && (!instance_exists(oTextbox)) && input_check("accept")) //or (place_meeting((x), (y - 1), oSardine) && oSardine.face == DOWN && (!instance_exists(oTextbox)) && keyboard_check(vk_space))
	{
	    if input_check_pressed("accept") && oItemManager.showInv == false //or keyboard_check_pressed(vk_space)
		{
	        CreateTextbox(text_id)
			sprite_index = NPC_spr[_face];
			_face = UP
	        move_speed = 0;
		}
	}

if (!instance_exists(oTextbox))
	{
		move_speed = 2;
	}

if place_meeting(x + move_speed, y, oSardine) 
{
	move_speed = 0; 
}
if place_meeting(x, y + move_speed, oSardine) 
{
	move_speed = 0;
}

if (move_speed = 0)
{
	image_speed = 0;
	image_index = 0;
}



