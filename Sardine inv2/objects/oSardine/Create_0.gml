//if(transition_flag  ){
	//&&  !place_meeting(x,y,o_connection)
	//var _connected_inst = FindConnection(o_connection, PLAYER.target_connection_ID);
		
	//x = _connected_inst.x;
	//y = _connected_inst.y;
	
//}

set_0_frame = false;

death_bonk = false;
death_bonk_set_coord = false;
death_bonk_spd = 0;
death_bonk_coordX = 0;
death_bonk_coordY = 0;
death_bonk_length = 0;


transition_delay = 15;
xspd = 0;
yspd = 0;
dir = 0;

Animation = false;

distanceRoll = 50;
move_distance_remaining = 0;	
speedRoll = 3;

cantWalk = false;
time = 120;
timer = 0;
recDir = 0;
recXspd = 0;
recYspd = 0;

hitByAttack = -1;

//rXspd = 0;
//rYspd = 0;

move_spd = 3;

//Animation = false;

//sprites
playerSprite = {
	idle:
	{
		Right: sSardine_right,
		Up:	   sSardine_up,
		Left:  sSardine_left,
		Down:  sSardine_down,
	},
	
	roll:
	{
		Right: sRollingRight,
		Up:    sRollingUp,
		Left:  sRollingLeft,
		Down:  sRollingDown,
	},
	
	bonk:
	{
		Right: sBonkRight,
		Up:    sBonkUp,
		Left:  sBonkLeft,
		Down:  sBonkDown,
	},
	
	Attack:
	{
		Right: sAttackRight,
		Up:	   sAttackUp,
		Left:  sAttackLeft,
		Down:  sAttackDown,
	},	
	
	Hitbox:
	{
		Right: sAttackRightHB,
		Up:	   sAttackUpHB,
		Left:  sAttackLeftHB,
		Down:  sAttackDownHB,
	},
	
	Death:
	{
		Die: sSardineDie,
		Dead: sSardineDeath
	}
}

playerState = playerSprite.idle;

face = DOWN;

//PLAYER.previous_x = x;
//PLAYER.previous_y = y;

//PLAYER.inst_ID = id;



XmoveSpdRoll = 0;
YmoveSpdRoll = 0;


invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;






//text_id = "meme";

//enum ItemStats
//{
	//name,
	//maxStack,
//}

//enum ItemTypes
//{
	//coin,
	//cuclet,
	//orangeCrystal,
//}

//enum Inventory
//{
	//type,
	//quantity,
//}

//Arrays
//global.Item[ItemTypes.coin, ItemStats.name] = "Emercoin";
//global.Item[ItemTypes.coin, ItemStats.maxStack] = 10;
//global.Item[ItemTypes.cuclet, ItemStats.name] = "Cuclet";
//global.Item[ItemTypes.cuclet, ItemStats.maxStack] = 10;
//global.Item[ItemTypes.orangeCrystal, ItemStats.name] = "Orange Crystal";
//global.Item[ItemTypes.orangeCrystal, ItemStats.maxStack] = 5;

//maxInvSlots = 14;

//for (var inv = 0; inv < maxInvSlots; inv++)
//{
	//global.A_inv[inv, Inventory.type] = -1;
	//global.A_inv[inv, Inventory.quantity] = 0;
//}

//showinventory = false;

//selectedItem = 0;

//global.inventory = ds_list_create();


//global.player_hp = 50;
//global.equipped_item = -1;
//show_inventory = true;

//#region

//enum e_items{coin, cuclet, orangecrystal}

//on_use[e_items.coin] = equip_item;
//on_use[e_items.cuclet] = heal;
//on_use[e_items.orangecrystal] = equip_item;

//for (var i = 0; i < 3; i++)
//{
	//show_debug_message("on_use[" + string(i)+ "]: " + string(on_use[i]));
//}

//#endregion


canHurtEnemy = true;



function add_xp(_xp_to_add)
{
	global.xp += _xp_to_add;
	if(global.xp >= global.xp_required)
	{
		global.level++;
		global.xp -= global.xp_required;
		global.xp_required *= 1.4;
		
		global.playerHealthMax *= 0.5;
		global.playerHealth = global.playerHealthMax;
		global.damage *= 2;
		
		
	}
}