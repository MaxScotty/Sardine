BattleUp = keyboard_check_pressed(ord("W"));
BattleDown = keyboard_check_pressed(ord("S"));
BattleAccept = keyboard_check_pressed(vk_enter);

menu_length = array_length(option_choose[level]);

PosBat += BattleDown - BattleUp;
if PosBat >= menu_length {PosBat = 0};
if PosBat < 0 {PosBat = menu_length - 1};


if option_choose[level, PosBat] == noone
{
	PosBat = 0;	
}


if oBattle2.stating != states.playerchoose exit;

if BattleAccept
{
	var _lvl = level;
	
	switch(level)
	{
		//menu
		case MENU:
			switch(PosBat)
			{
				//Fight
				case 0:
				oSardineBattle.stat = status.attack;
				
				instance_create_depth(oSlimeBattle.x+sprite_get_width(oSlimeBattle.sprite_index)/2, oSlimeBattle.y+sprite_get_height(oSlimeBattle.sprite_index)/2, oSlimeBattle.depth-50, obj_attack);
				
					audio_play_sound(snd_nano_blade, 1, 0)
					oSlimeBattle.hp -= oSardineBattle.attack;
					with oBattle2
					{
						stating = states.playerdealdamage;
						if oSlimeBattle.hp <= 0
						{
							global.battleLV+=oSlimeBattle.lv;
							global.battleMoney+=oSlimeBattle.money;
							item_add(global.item_list.coin, oSlimeBattle.money);// добавление предмета монеточкииииииииииииии
							oSlimeBattle.stat = status.down;
							stating = states.battleend;
							alarm[3] = 360;
						}
						else
						{
							alarm[1] = 60;
						}
					}
					break;
				//Magic
				case 1: level = MAGIC; break;
				//Item
				case 2: level = ITEM; 		
				break;
			}
			break;
		//magic
		case MAGIC:
			switch(PosBat)
			{
				//Healing
				case 0:
					oSardineBattle.stat = status.defend;
					audio_play_sound(snd_sparkling, 1, 0);
					oSardineBattle.hp += 10;
					oSardineBattle.mp -= 10;
					
					instance_create_depth(oSardineBattle.x+sprite_get_width(oSardineBattle.sprite_index)/2, oSardineBattle.y+sprite_get_height(oSardineBattle.sprite_index)/2, oSardineBattle.depth-50, obj_hill);
					
					with oBattle2
					{
						stating = states.playerdealdamage;
						alarm[1] = 60;
					}
					break;
				//Tornado
				case 1:
				audio_play_sound(snd_cognito, 1, 0); 
				oSardineBattle.stat = status.attack;
				instance_create_depth(oSlimeBattle.x+sprite_get_width(oSlimeBattle.sprite_index)/2, oSlimeBattle.y+sprite_get_height(oSlimeBattle.sprite_index)/2, oSlimeBattle.depth-50, obj_scratch);
				break;
				//Back
				case 2: level = MENU break;
			}
			break;
			
		//item
		case ITEM:
		
				if option_choose[ITEM, PosBat] == "Back"
				level = MENU;
				else
				{
					for (var j = 0; j <= 1; j++)
					{
					for (var i = 0; i < 7; i++)
					{
					if oItemManager.inv[j, i] != noone and option_choose[ITEM, PosBat] == oItemManager.inv[j, i].Name
					{
					oItemManager.inv[j, i].effect();
					audio_play_sound(snd_sparkling, 0, 0);
					break;
					}
					}
					}
				}
		break;
				

}//menu


			

	
	if _lvl != level {PosBat = 0};
	
	menu_length = array_length(option_choose[level]);
}


for (var i = 0; i < array_length(option_choose[ITEM]); i++)
{
	option_choose[ITEM, i] = noone;	
}

var _noone = 0;
var _last = 0;
for (var j = 0; j <= 1; j++)
{
	for (var i = 0; i < 7; i++)
	{
	if oItemManager.inv[j, i] != noone and oItemManager.inv[j, i].inBattle == true
	{
	option_choose[ITEM, i-_noone] = oItemManager.inv[j, i].Name;
	_last = i-_noone+1;
	}
	else
	_noone+=1;
	}
}

option_choose[ITEM, _last] = "Back";


//if oSlimeBattle.hp <= 0
//{
//	minus = true;
//}


