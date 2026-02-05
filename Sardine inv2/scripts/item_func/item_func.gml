//Добавляем предметы

/// @param предмет
/// @param сколько_добавить
/// @function item_add(Предмет, Число)
/// @description Добавляет предмет или увеличивает стак предметов в инвентаре
function item_add(_item, _number)
{
	if _number < 1
	{
		_number = 1;	
	}
	
	with (oItemManager)
	{
		var _to = -1;
		var _exists = false;
	
		//В пустой слот или если есть в тот, в котором есть
		for (var i = 0; i < 14; i++)
		{
			if inv[i] == _item
			{
				_exists = true;
				_to = i;
				break;
			}
		}	
		
		if _to == -1
		{
			for (var i = 0; i < 14; i++)
			{
				if inv[i] == noone
				{
					_to = i;
					break;
				}
			}	
		}
		
		if _to == -1
		{
			show_debug_message("Нет места.")
			exit;	
		}
		
		if !_exists
		{
			inv[_to] = _item;
			inv[_to].number+=_number;
		} else
		{
			inv[_to].number+=_number;	
		}
	}
}

function item_get_slot_number(_item, _default = -1)
{
	//with (oItemManager)
	//{
	//	for (var i = 0; i < array_length(inv); i++)
	//	{
	//		if inv[i] == _item
	//		{
	//			return i;
	//		}
	//	}
	//}

	//return _default;	
}

function item_get_from_pos(_posX, _posY)
{
	//var _item = -1;
	
	//with (oItemManager)
	//{
	//	switch (_posY)
	//	{
	//		case 0:
	//			_item = inv[_posX];
	//		break;
	//		case 1:
	//			_item = inv[_posX+7];
	//		break;
	//	}
	//}
	//return _item;
	
}

function delete_item(_item)
{
	//var _num = item_get_slot_number(_item, -1);
	
	//if _num == -1 { exit; };
	
	//with (oItemManager)
	//{
	//	inv[_num].number-=1;
	//	if inv[_num].number <= 0 { inv[_num] = noone; };
	//}
}

function use_item(_item)
{
	//var _num = item_get_slot_number(_item);
	
	//if _num == -1 { exit; };
	
	//with (oItemManager)
	//{
	//	inv[_num].effect();
	//}
}
/// @function item_get_list_name(Предмет)
/// @description Ищет в листе предметов название предмета которое вы ввели, и возвращает его значение как аргумент в каком-либо условии
/// @param имя
function item_get_list_name(_find){

    // Get the list returned from variable_struct_get_names
    var _names = variable_struct_get_names(global.item_list);

    // loop throuh each name
    for(var i=0;i<array_length(_names);i++)
	{
        var _name = _names[i];

        // use the name in the global.item_list[$ name] and compare it to the function argument
        if global.item_list[$ _name] == _find
		{
            // if the same, return the name
            return _name;
			break;
		}	
    }
}