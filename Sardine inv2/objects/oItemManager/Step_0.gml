if (live_call()) return live_result;

//if input_check("up")
//{
//	showItemsRoll = 0;
//}
//if input_check("down")
//{
//	showItemsRoll = 1;	
//} 

posSection += keyboard_check_pressed(ord("R")) - keyboard_check_pressed(ord("Q"));
posSection = clamp(posSection, 0, array_length(sections)-1);


if input_check_pressed("left")
{
	pos--;	
}
if input_check_pressed("right")
{
	pos++;	
}
if pos < array_length(global.inv)-6
{
	if input_check_pressed("down")
	{
		pos += 6;	
	}
}
if pos >= 6
{
	if input_check_pressed("up")
	{
		pos -= 6;	
	}
}

pos = clamp(pos, 0, array_length(global.inv)-1);

if pos >= 4*6
{
	showItemsRoll = 2;	
}
else if pos >= 2*6
{
	showItemsRoll = 1;	
} else
{
	showItemsRoll = 0;	
}

for (var i = 0; i < array_length(global.inv); i++)
{
	if global.inv[i] == -1 { continue; };
	
	if global.inv[i].number <= 0
	{
		global.inv[i] = -1;	
	}
}