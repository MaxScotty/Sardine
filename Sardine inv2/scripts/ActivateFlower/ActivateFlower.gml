function ActivateFlower(){
	var _hasFlower = false;
	
	var _item = item_get_slot_number(global.item_list.flower);
	
	if _item != -1 { _hasFlower = true; }
	
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
	}
}