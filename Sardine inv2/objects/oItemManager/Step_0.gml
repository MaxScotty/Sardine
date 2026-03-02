if (live_call()) return live_result;

if !showArtifact_info && keyboard_check_pressed(ord("I"))
{
	show_inv = !show_inv;	
}

if !show_inv 
{
	if surface_exists(surface)
	{
		surface_free(surface);	
	}
	if surface_exists(surface2)
	{
		surface_free(surface2);	
	}
	exit; 
}

//if input_check("up")
//{
//	showItemsRoll = 0;
//}
//if input_check("down")
//{
//	showItemsRoll = 1;	
//} 

var _posS = posSection;

if !showArtifact_info
{
	posSection += keyboard_check_pressed(ord("R")) - keyboard_check_pressed(ord("Q"));

	posSection = clamp(posSection, 0, array_length(sections)-1);

	if _posS != posSection
	{
		pos = 0;	
		showItemsRoll = 0;
	}

	if input_check_pressed("left")
	{
		pos--;	
	}
	if input_check_pressed("right")
	{
		pos++;	
	}
}

if posSection == 0
{
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
}

if posSection == 1
{
	if pos < 0 { pos = array_length(global.eqiup_inv)-1; };	
	if pos >= array_length(global.eqiup_inv) { pos = 0; };	
}
if posSection == 2
{
	if pos < 0 { pos = array_length(global.artifacts_inv)-1; };	
	if pos >= array_length(global.artifacts_inv) { pos = 0; };		
}

for (var i = 0; i < array_length(global.inv); i++)
{
	if global.inv[i] == -1 { continue; };
	
	if global.inv[i].number <= 0
	{
		global.inv[i] = -1;	
	}
}


if input_check_pressed("accept")
{
	switch (posSection)
	{
		case 0:
			global.inv[pos].effect();
		break;
		case 1:
			//equip
		break;
		case 2:
			showArtifact_info = !showArtifact_info;
		break;
	}
}

