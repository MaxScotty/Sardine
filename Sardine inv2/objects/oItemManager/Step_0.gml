if (live_call()) return live_result;

//if input_check("up")
//{
//	showItemsRoll = 0;
//}
//if input_check("down")
//{
//	showItemsRoll = 1;	
//} 

if input_check_pressed("left")
{
	pos--;	
}
if input_check_pressed("right")
{
	pos++;	
}
if input_check_pressed("down")
{
	pos += 6;	
}
if input_check_pressed("up")
{
	pos -= 6;	
}

pos = clamp(pos, 0, array_length(global.inv)-1);

if pos >= 3*6
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