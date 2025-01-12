//сделай пожалуйста по возможности WASD передвижение (вверх,вниз,вправо,влево) спасибо <3
//Без проблем <3
selected_item = noone; // ADDED BY ALFIE
depth = -99999999999999999999999;

posX = 0;
posY = 0;

/*

для удаления предметов
	в oItemManager
		delete_item(item_get_from_pos(posX, posY));
	в других объектах
		delete_item(global.item_list.item);
		
для добавления предметов
	item_add(global.item_list.item);
	
для использования предметов
	в oItemManager
		use_item(item_get_from_pos(posX, posY));
	в других объектах
		use_item(global.item_list.item);
	
*/



function create_item(_name, _description, _battle, _sprite, _effect) constructor
{
	Name = _name;
	description = _description;
	number = 0;
	inBattle = _battle;
	sprite = _sprite;
	effect = _effect;
}



global.item_list =
{
	coin : new create_item(
		"Coin",
		"Pay",
		false,
		sCoin,
		
		function()
		{
			//do nothing
			//if we can give the item
			if global.canUseItem
			{
				with (oItemManager)
				{
					instance_destroy(oTextbox);
					can_swap = true;
					showInv = false;
					//delete_item(item_get_from_pos(posX, posY));	
				}
			}
		}
	),
	
	cuclet : new create_item(
		"Cuclet",
		"It isn't a potato!!!!",
		true,
		sCuclet,
		
		function()
		{
			//if we can give the item
			if global.canUseItem
			{
				with (oItemManager)
				{
					instance_destroy(oTextbox);
					can_swap = true;
					showInv = false;
					//delete_item(item_get_from_pos(posX, posY));	
				}
			}
			// ЧТОБЫ УДАЛИТЬ ПРЕДМЕТ:
			/*
			
			
			delete_item(item_get_from_pos(posX, posY));
			
			
			*/
			
			
			
			
			/*if !instance_exists(oBattleMenu)
			{
			global.player_hp += 5;
			
			inv[posY, posX].number -= 1;
			if inv[posY, posX].number <= 0 {inv[posY, posX] = noone}
			} else
			{
			global.player_hp += 5;
			oSardineBattle.hp += 5;
	
			for (var j = 0; j <= 1; j++)
			{
				for (var i = 0; i < 7; i++)
				{
					if inv[j, i] != noone and oBattleMenu.option_choose[ITEM, oBattleMenu.PosBat] == inv[j, i].Name
					{
					inv[j, i].number -= 1;
					if inv[j, i].number <= 0 {inv[j, i] = noone};	
					break;	
					}
				}
			}
			}*/
		}
	),
	
	flower: new create_item(
		"Flower",
		"A beautiful flower",
		false,
		sFlower,
		function()
		{
			if global.can_use_flower
			{
				with (oItemManager)
				{
					instance_destroy(oTextbox);
					can_swap = true;
					showInv = false;
					delete_item(item_get_from_pos(posX, posY));	
				}
			}
		}
	)
}


for (var i = 0; i < 14; i++)
{
	inv[i] = noone;	
}

sep = 28;
screen_bord = 19;

showInv = false;



can_swap = true;

scale = 3;

x_buffer = 2;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_width = 235;
inv_height = 205;

inv_x = (gui_width * 0.625) - (inv_width * 0.35);
inv_y = (gui_height * 0.62) - (inv_height * 0.2);


item_add(global.item_list.cuclet, 4);
item_add(global.item_list.coin, 50);