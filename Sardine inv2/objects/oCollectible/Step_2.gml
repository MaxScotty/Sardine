flash = max(0, flash - 0.05);
fric = 0.05;

//Magnetise
if(instance_exists(oSardine))
{
	var _px = oSardine.x;
	var _py = oSardine.y;
	var _dist = point_distance(x, y, _px, _py);
	if (_dist < 16)
	{
		spd += 0.25;
		direction = point_direction(x, y, _px, _py);
		spd = min(spd, 3);
		fric = 0;
		if (_dist < 5)
		{
			if (collectScriptArg != -1)
			{
				script_execute(collectScript, collectScriptArg);
			}
			else
			{
				if (collectScript != -1) script_execute(collectScript);
			}
			item_add(global.item_list.coin, 1);
			instance_destroy();
		}
	}
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0);