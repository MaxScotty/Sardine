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

enum EQUIP_STATUS
{
	ARMOR = 0,
	WEAPON = 1,
}

///////////		equip status и equip power используется только если это оружие или броня.
///////////		equip status может быть равен EQUIP_STATUS.ARMOR или EQUIP_STATUS.WEAPON.
///////////		equip power это атака или защита в зависимости от предыдущего аргумента.
function create_item(_name, _description, _battle, _abilities, _cost, _sprite, _effect, _equip_status = -1, _equip_power = 0) constructor
{
	Name = _name;
	description = _description;
	number = 0;
	inBattle = _battle;
	abilities = _abilities;
	cost = _cost;
	sprite = _sprite;
	effect = _effect;
	
	equip_status = _equip_status;
	equip_power = _equip_power;
}

global.item_list =
{
	coin : new create_item(
		"Coin",
		"Pay",
		false,
		"Payment",
		0,
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
		"+5 hp",
		3,
		sCuclet,
		
		function()
		{
			//health restore
			if (global.playerHealth < global.playerHealthMax)
			{
				global.playerHealth += 5;
				delete_item(global.item_list.cuclet);
			}
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
		"",
		0,
		sFlower,
		function()
		{
			if instance_exists(oBlackCatNPCTest)
			{
				if point_distance(oSardine.x, oSardine.y, oBlackCatNPCTest.x, oBlackCatNPCTest. y) <= 32
				{
					with (oItemManager)
					{
						if room == rCave
						{
							//if point_distance(oSardine.x, oSardine.y, oBlackCatNPCTest.x, oBlackCatNPCTest. y) <= 32
							//{
								global.canUseItem = true;
								
								oGame.create_textbox = true;
								oGame.textbox_text_id = "Quest Completed - yes yes";
								
								can_swap = true;
								showInv = false;
								delete_item(global.item_list.flower)
								//delete_item(item_get_from_pos(posX, posX));
							//}
					
							//global.canUseItem = true;
						}
					}
				}
			}
		}
	),
	
	green_tea : new create_item(
		"Green Tea",
		"A healthy tea",
		false,
		"+10 hp",
		2,
		sBottleMenuPH,
		
		function()
		{
			global.playerHealth += 10;
			
			with (oItemManager)
			{
				delete_item(global.item_list.green_tea)
			}
		}
	),
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