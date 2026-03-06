//Saving
function SaveGame()
{
	var _map = ds_map_create();
	
	_map[? "room"] = room_get_name(room);
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "FirstTimeInShop"] = global.first_time_in_shop;
	_map[? "CanUseItem"] = global.canUseItem;
	_map[? "AiGridNPC"] = global.AIgrid;
	_map[? "ChestIsOpened"] = global.is_opened;
	_map[? "TargetX"] = global.TargetX;
	_map[? "TargetY"] = global.TargetY;
	_map[? "Level"] = global.level;
	_map[? "XP"] = global.xp;
	_map[? "XP_required"] = global.xp_required;
	
	//inv
	var _len = array_length(global.inv);
	for (var i = 0; i < _len; i++)
	{
		if global.inv[i] != -1
		{
			_map[? "Inv"+string(i)] = item_get_list_name(global.inv[i]);
			_map[? "InvNumber"+string(i)] = global.inv[i].number;
		} else
		{
			_map[? "Inv"+string(i)] = -1;
		}
	}
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.QuestStatus);
	ds_map_add_map(_map, "QuestStatus", _questMap);
	
	//var _ItemMap = ds_map_create();
	//ds_map_copy(_ItemMap, global.item_list);
	//ds_map_add_map(_map, "ItemList", _ItemMap);
	
	//save everything on string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	//show_debug_message(_string);
	
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

//Loading
function LoadGame(_slot)
{
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if(file_exists(_file))
	{
		var _json = LoadJSONFromFile(_file);
		
		//global.variables
		global.playerHealth = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.first_time_in_shop = _json[? "FirstTimeInShop"];
		global.canUseItem = _json[? "CanUseItem"];
		global.AIgrid = _json[? "AiGridNPC"];
		global.is_opened = _json[? "ChestIsOpened"];
		global.TargetX = _json[? "TargetX"];
		global.TargetY = _json[? "TargetY"];
		global.level = _json[? "Level"];
		global.xp = _json[? "XP"];
		global.xp_required = _json[? "XP_required"];
				
		//item data
		var _num = _json[? "InvSize"];
		for (var i = 0; i < _num; i++)
		{
			if _json[? "Inv"+string(i)] != -1
			{
				global.inv[i] = struct_get(global.item_list, _json[? "Inv"+string(i)] );
				global.inv[i].number = _json[? "InvNumber"+string(i)];
			} else
			{
				if global.inv[i] != -1 { global.inv[i].number = 0; };
				global.inv[i] = -1;
			}
		}
				
		//questData
		ds_map_copy(global.QuestStatus, _json[? "QuestStatus"]);
		
		//room
		room = asset_get_index(_json[? "room"]);
		ds_map_destroy(_json);

		return true;
	}
	else
	{
		show_debug_message("no save in this slot")
		return false;
	}
}

function LoadJSONFromFile(_filename)
{
	var _bufferLoad = buffer_load(_filename);
	var _stringLoad = buffer_read(_bufferLoad, buffer_string);
	buffer_delete(_bufferLoad);
	var _json = json_decode(_stringLoad);
	return _json;
}