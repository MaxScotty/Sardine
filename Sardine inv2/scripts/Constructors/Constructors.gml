function create_item(_name, _description, _battle, _abilities, _cost, _sprite, _sprite_detail, _effect, _equip_status = -1, _equip_power = 0) constructor
{
	Name = _name;
	description = _description;
	number = 1;
	inBattle = _battle;
	abilities = _abilities;
	cost = _cost;
	sprite = _sprite;
	spriteDetail = _sprite_detail;
	effect = _effect;
}

enum EQUIP_STATUS
{
	ARMOR = 0,
	WEAPON = 1,
}

function create_equip(_name, _desc, _sprite, _equip_status, _power) constructor
{
	name = _name;
	desc = _desc
	sprite = _sprite;
	equip_status = _equip_status;
	equip_power = _power;
}

function equip_add(_equip)
{
	if !array_contains(global.eqiup_inv, _equip)
	{
		array_push(global.eqiup_inv, _equip);	
	}
}

function create_artifact(_name, _desc, _sprite, _overline_sprite, _found = false) constructor
{
	name = _name;
	desc = _desc;
	sprite = _sprite;
	overline_sprite = _overline_sprite;
	found = false;
}

function artifact_add(_artifact)
{
	var _ind = array_get_index(global.artifacts_inv, _artifact);
	
	if _ind != -1
	{
		global.artifacts_inv[_ind].found = true;	
	}
}



function inv_get_using_space()
{
	var _count = 0;
	for (var i = 0; i < array_length(global.inv); i++)
	{
		if global.inv[i] != -1
		{
			_count++;	
		}
	}
	
	return _count;
}