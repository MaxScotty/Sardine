if stat == status.attack
{
	stat = status.idle;	
}
if stat == status.defend
{
	stat = status.idle;	
}
if stat == status.down
{
	image_speed = 0;
	image_index = image_number-1;
}