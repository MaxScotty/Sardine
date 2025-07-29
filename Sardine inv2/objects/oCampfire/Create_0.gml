show_recipe = false;

recipe = new Recipe();

recipe.recipe_add("Torch", [
	{
		name: "Wood",
		number: 2,
	},
	{
		name: "Crystal",
		number: 2,
	}], [{
		name: "Torch",
		number: 4,
		sprite: sTorch,
	}], sTorch)