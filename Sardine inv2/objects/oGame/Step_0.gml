if TalkedWithNpc
{
    if instance_exists(oBlackCatNPCTest)
    {
        oBlackCatNPCTest.Talked = 1;
    }

}

//для экрана, можешь удалитьш
if keyboard_check_pressed(vk_f4)
{
	set_fullscreen();	
}




if create_textbox
{
	if !instance_exists(oTextbox) && oItemManager.showInv == false
	{
		CreateTextbox(textbox_text_id);	
		textbox_text_id = "";
		create_textbox = false;
	}
}