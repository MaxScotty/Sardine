//if (keyboard_check_pressed(vk_escape))
//{
//    if (!pause)
//    {
//        pause = true;

//        instance_deactivate_all(true);
//    }
//}

//get imputs
upKey = input_check_pressed("up")//keyboard_check_pressed(vk_up); 
downKey = input_check_pressed("down");
//leftKey = keyboard_check_pressed(vk_left);    //after adding stuff
//rightKey = keyboard_check_pressed(vk_right);
acceptKey = input_check_pressed("accept");

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
if pause
pos += downKey - upKey;
//hpos += rightKey - leftKey;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};

//using the options
if pause
if acceptKey{ 

    var _sml = menu_level;

    switch(menu_level){

        //pause menu
        case MAIN:
            switch(pos){
                //resume game
                case 0: 
        pause = false;
        instance_activate_all();
                break;
                //settings
                case 1: menu_level = SETTINGS ; break;
                //quit game
                case 2: 
					SaveGame();
					game_end(); 
					break;
                }
            break;
            
        //settings
        case SETTINGS:
            switch(pos){
                //Text Speed
                case 0:

                    break;
                //sounds
                case 1:
                    menu_level = SOUNDS;
                    break;
                //controls
                case 2:
                    menu_level = CONTROLS;
                    break;
                //back
                case 3:
                    menu_level = 0;
                    break;
            }
            break;

        //sounds
        case SOUNDS:
            switch(pos){
                //music
                case 0:

                    break;
                //sounds
                case 1: 
                    break;
					
				case 2: 
				menu_level = SETTINGS;
                    break;	
}

//Controls
		case CONTROLS:
			switch(pos){
				//up
				case 0:
				
					break;
				//left
				case 1:
				
					break;
				//down
				case 2:
				
					break;
				//right
				case 3:
				
					break;
				//back
				case 4:
					menu_level = SETTINGS;
					break;
		}

}
        
        if _sml != menu_level {pos = 0};
        
        op_length = array_length(option[menu_level]);
}


