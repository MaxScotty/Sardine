depth = -999999*100;

currentEnemy = 0;

global.enemies = ds_list_create();

//slime enemy
for (var i = 0; i < instance_number(oSlimeBattlev2); i++)
{
	var find = instance_find(oSlimeBattlev2, i)
	ds_list_add(global.enemies, find)
}
bubble_sort(global.enemies)

global.battleDengi = 0;
global.xp = 0;

//changing enemies
for(var i = 0; i < ds_list_size(global.enemies); i++)
{
	var _id = global.enemies[|i]
	with _id
	{
		x = 399.5 + 500 * i
		y = 7
	
		if(i == 0) active = true;
	}
}
