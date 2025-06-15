//save load scripts
function SaveGame()
{
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "FirstTimeInShop"] = global.first_time_in_shop;
	_map[? "ItemList"] = global.item_list;
	_map[? "CanUseItem"] = global.canUseItem;
	_map[? "AiGridNPC"] = global.AIgrid;
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, oGame.QuestStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	//save everything on string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	
	ds_map_destroy(_map);
	show_debug_message("game saved!");
}

function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}