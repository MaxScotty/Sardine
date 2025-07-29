function Recipe() constructor {

	recipes = [];
	
	recipe_find = function(_name)
	{
		for(var i = 0; i < array_length(recipes); i++)
		{
			if(_name == recipes[i].name){return i;}
		}
		
		return -1;
	}
	
	
	
	recipe_add = function(_name, _requirement, _products, _sprite)
	{
		array_push (recipes, {
			name: _name,
			requirements: _requirement,
			products: _products,
			sprite: _sprite,
		});
	}
	
	
	
	recipe_has = function(_name)
	{
		var _index = recipe_find(_name);
		var _can_craft = false;
		
		if (_index >= 0)
		{
			_can_craft = true;
			
			for(var _requirement_index = 0; _requirement_index < array_length(recipes[_index].requirements); _requirement_index++)
			{
				if(global.item_list.recipes[_index].requirements[_requirement_index].name == false) {_can_craft = false; break;}
			}
		}
		return _can_craft;
	}
	
	
	recipe_craft = function(_name)
	{
		var _index = recipe_find(_name);
		
		if (_index >= 0)
		{
			if(recipe_has(_name))
			{
				for(var _requirement_index = 0; _requirement_index < array_length(recipes[index].requirements); _requirement_index++)
				{
					delete_item(global.item_list.recipes[index].requirements[_requirement_index].name);
				}
				
				for(var _product_index = 0; _product_index < array_length(recipes[_index].products); _product_index++)
				{
					item_add(recipes[index].products[_product_index].name, 1);
				}
			}
		}
	}
	
	recipe_get = function()
	{
		return recipes;
	}
}