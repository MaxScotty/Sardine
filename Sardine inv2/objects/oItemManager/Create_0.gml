if (live_call()) return live_result;

//сделай пожалуйста по возможности WASD передвижение (вверх,вниз,вправо,влево) спасибо <3
//Без проблем <3



global.damage = 5;

global.level = 1;
global.xp = 0;
global.xp_required = 100;

depth = -99999999999999999999999;


surface = -1;
surface2 = -1;

showItemsRoll = 0;

ext_y_items = 0;





global.item_list =
{
	
	
	coin : new create_item(
		"Coin",
		"Pay",
		false,
		0,
		1,
		sCoin,
		Coin,
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
		false,
		0,
		3,
		sCuclet,
		Cuclet,
		
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
		0,
		0,
		sFlower,
		Flower,
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
		0,
		2,
		sBottleMenuPH,
		-1,
		function()
		{
			global.playerHealth += 10;
			
			with (oItemManager)
			{
				delete_item(global.item_list.green_tea)
			}
		}
	),
	
	crystal: new create_item(
		"Crystal",
		"Lights in the darkness",
		false,
		0,
		5,
		sCrystal,
		-1,
		function(){}
	),
	
	wood: new create_item(
		"Wood",
		"First we mine, then we craft. Is this Minecraft?",
		false,
		0,
		2,
		sWood,
		-1,
		function(){}
	),
	
	//potion : new create_item(
	//"Potion",
	//"Kills slimes and owls.",
	//false,
	//0,
	//6,
	//sCuclet,
	//Potion,
	//function()
	//{
			
	//}),
}

global.eqiup_inv = [];

global.equip_list =
{
	greatSword : new create_equip( 
		"Great Sword",
		"A fat sword.",
		Greatsword,
		EQUIP_STATUS.WEAPON,
		0.000000000000000000000000000000001
	),
	spear : new create_equip( 
		"Spear",
		"Ya sry",
		Spear,
		EQUIP_STATUS.WEAPON,
		69),
}

global.artifacts_list =
{
	hades : new create_artifact( 
		"Hades",
		"Blyadskiy Cherep Koshki",
		Hades_Artifact,
		Hades_Artifact_s_overline,
		false
	),
	draining_blow : new create_artifact( 
		"draining blow",
		"draining_blow",
		Draining_blow,
		Draining_blow,
		false
		
	),
}

global.artifacts_inv = [];

var _s_n = struct_get_names(global.artifacts_list);
for (var i = 0; i < array_length(_s_n); i++)
{	
	var _name = _s_n[i];
	array_push(global.artifacts_inv, global.artifacts_list[$ _name]);
}

pos = 0;

showArtifact_info = false;
showArtifact_scale = 1;
showArtifact_scale_to = 1.5;

posSection = 0;

sections = ["Items", "Weapons", "Artifacts"];

section_ext_y = [0, 0, 0];

global.inv = array_create(36, -1);

//global.inv_max = 36;

item_add(global.item_list.flower);
item_add(global.item_list.cuclet);
item_add(global.item_list.coin);


//equip_add(global.equip_list.draining_blow);
equip_add(global.equip_list.greatSword);
equip_add(global.equip_list.spear);

artifact_add(global.artifacts_list.hades);
artifact_add(global.artifacts_list.draining_blow);
	
	
show_inv = false;