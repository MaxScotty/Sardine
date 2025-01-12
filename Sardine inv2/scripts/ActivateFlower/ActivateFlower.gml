function ActivateFlower(){
	var _hasFlower = false;
	
	var _item = item_get_slot_number(global.item_list.flower);
	//var _difItem = item_get_slot_number(global.item_list.coin);
	//var _diffItem = item_get_slot_number(global.item_list.cuclet);
	
	if _item != -1 { _hasFlower = true; }
	//if _difItem != -1 {_hasFlower = false;}
	//if _diffItem != -1 {_hasFlower = false;}
	
	switch (oGame.QuestStatus[? "The flower quest"])
	{
		case 0: //not started
		{
			if(_hasFlower)
			{
				//complete quest
			}
			else
			{
				text_id = "Quest";
			}
		} break;
		
		case 1: //quest in progress
		{
			if (_hasFlower)
			{
				//complete quest
				
			}
			else
			{
				text_id = "Quest Reminder";
			}
		} break;
		
		case 2: //quest already completed
		{
			text_id = "Quest Completed";
		} break;
		
		case 3: //quest for sure completed
		{
			text_id = "Quest Completed - finish";
		} break;
	}
}