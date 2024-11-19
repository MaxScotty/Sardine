depth = -9999;

MenuWidth = 190;
MenuHeight = 150;

draw_char = 0;
winText = "You Won! You got "+string(global.battleMoney)+" Emercoins and "+string(global.battleLV)+" LV!"

//alpha = 1;
//timerEndText = 60;
//minus = false;

m_border = 17;
m_space = 25;

PosBat = 0;

#macro MENU 0
#macro MAGIC 1
#macro ITEM 2

option_choose[MENU, 0] = "Fight";
option_choose[MENU, 1] = "Magic";
option_choose[MENU, 2] = "Item";

option_choose[MAGIC, 0] = "Healing mur-mur";
option_choose[MAGIC, 1] = "Scratch tornado";
option_choose[MAGIC, 2] = "Back";

var _noone = 0;
var _last = 0;
for (var j = 0; j <= 1; j++)
{
	for (var i = 0; i < 7; i++)
	{
	if oItemManager.inv[j, i] != noone and oItemManager.inv[j, i].inBattle == true
	{
	option_choose[ITEM, i-_noone] = oItemManager.inv[j, i].Name;
	_last = i-_noone;
	}
	else
	_noone+=1;
	}
}
//for (var j = 0; j <= 1; j++)
//{
//	for (var i = 0; i < _noone; i++)
//	{
//	option_choose[ITEM, i] = inv_battle[j, i];
//	}
//}

timer = 6;

option_choose[ITEM, _last+1] = "Back";
menu_length = 0;
level = 0;
