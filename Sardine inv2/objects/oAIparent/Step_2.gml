//reached path point
if (pathNextPoint > 0 && x == pathPointX && y == pathPointY)
{
	//go to next point
	pathNextPoint ++;
	
	//path is over
	if (pathNextPoint >= path_get_number(path))
	{
		pathNextPoint = 0;
	}
}