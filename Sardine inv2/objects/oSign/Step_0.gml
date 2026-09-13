
var _id = id;

with (oSardine)
{
	var _len = 5;
	var _len_x = lengthdir_x(_len, face*90);
	var _len_y = lengthdir_y(_len, face*90);
	
	var _inst = instance_place(x+_len_x, y+_len_y, _id);

	if instance_exists(_inst) && input_check_pressed("accept")
	{
		if !instance_exists(oTextbox)
		{
			CreateTextbox(_id.text_id);	
		}
	}
}
