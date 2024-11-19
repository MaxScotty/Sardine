
if !instance_exists(oBattle2)
{
if showInv == true
{

	posX+=input_check_pressed("right")-input_check_pressed("left");
	posY+=input_check_pressed("down")-input_check_pressed("up");
	posX = clamp(posX, 0, 6);
	posY = clamp(posY, 0, 1);
	
	
		//ALFIE'S CODE ↓
		//keep updating the selected item
        var _item = item_get_slot_number(item_get_from_pos(posX, posY));
        if _item != -1 && inv[_item] != noone 
		{
            selected_item = inv[_item];
        } else {
            selected_item = noone; //if chosen is noone reset the selected item
        }
		
		//ALFIE'S CODE ↑
		
	if input_check_pressed("accept") 
	{
		//var _item = item_get_slot_number(item_get_from_pos(posX, posY)); THIS IS THE OLD CODE COMMENTED BY ALFIE
		
		if _item != -1 && inv[_item] != noone
		{
			inv[_item].effect();
		}
	}




if instance_exists(oSardine)
oSardine.move_spd = 0;
}
if input_check_pressed("special") && can_swap
{
    showInv = !showInv;
}

} else
{
	showInv = false;	
}