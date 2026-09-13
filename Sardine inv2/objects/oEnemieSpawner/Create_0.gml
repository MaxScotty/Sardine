enemies_number = 0;
myEnemies = [];


is_anyone_of_my_great_sweet_childs_exists_anymore = function()
{
	for (var i = 0; i < array_length(myEnemies); i++)
	{
		if instance_exists(myEnemies[i])
		{
			return true;	
		}
	}
	
	return false;
}

timerNotUse = 2;