if(interactable == false)
{
	exit;
}

if (place_meeting((x), (y + 2), oSardine) && oSardine.face == UP && (!instance_exists(oTextbox)) && keyboard_check_pressed(ord("E"))) //or (place_meeting((x), (y + 1), oSardine) && oSardine.face == UP && (!instance_exists(oTextbox)) && keyboard_check(vk_space))
{
	if keyboard_check_pressed(ord("E")) && oItemManager.showInv == false   //or keyboard_check_pressed(vk_space)
	{
		is_opening = true;
		move_speed = 0;
	}
}	
		

if(is_opening)
{
	image_speed = 1;
	
	if(round(image_index) >= image_number - 1)
	{
		is_opening = true;
		global.is_opened = true;
		
		image_speed = 0;
		image_index = image_number - 1;
		interactable = false;
				
		CreateTextbox(text_id);
		//text_id = "ObtainingCoins";
		
		switch(loot)
		{
			case coin_number:
			item_add(global.item_list.coin, coin_number);
			break;
			
			case potion_loot:
			item_add(global.item_list.green_tea, potion_loot);
			break;
		}
		
	}
}