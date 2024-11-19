function item_use(){
	
for(var i = 0; i <= 1; i++)
{
	for(var j = 0; j <= 6; j++)
	{
		switch oInventory.inv[j, i].inv_name[j, i]
		{
			case "Cuclet":
				global.player_hp += 5;
				
				oInventory.inv_num[j, i] -= 1;
				
				if oInventory.inv_num[j, i] = 0 exit;
			break;
		}
	}
}

}

function set_fullscreen()
{
	if window_get_fullscreen() == false
	window_set_fullscreen(true);
	else
	window_set_fullscreen(false);
}