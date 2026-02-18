/// @desc		equip status и equip power используется только если это оружие или броня.
/// @desc		equip status может быть равен EQUIP_STATUS.ARMOR или EQUIP_STATUS.WEAPON.
/// @desc		equip power это атака или защита в зависимости от предыдущего аргумента.
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
	
	equip_status = _equip_status;
	equip_power = _equip_power;
}