

pause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;

resW = 1920;
resH = 1080;

width = 70;
height = 104;

op_border = 22;
op_space = 23;

pos = 0;
//hpos = 0;

#macro MAIN            0
#macro SETTINGS        1
#macro SOUNDS		   2
#macro CONTROLS        3

//global.dsm_settings = ds_map_create();
//#macro set        global.dsm_settings

//ds_map_add(set, "music", [5, [0, 100]]);    //add after adding music
//ds_map_add(set, "sound", [5, [0, 100]]);
//ds_map_add(set, "text_speed", [1, ["Slow", "Normal", "Fast", "Instant"]]);   //add after adding dialogue system

//pause menu
option[MAIN, 0] = "Continue";
option[MAIN, 1] = "Settings";
option[MAIN, 2] = "Exit";

//settings menu
option[SETTINGS, 0] = "Text Speed";        //["Text Speed ", "text_speed"];
option[SETTINGS, 1] = "Sounds";
option[SETTINGS, 2] = "Controls";
option[SETTINGS, 3] = "Back";

//sounds menu
option[SOUNDS, 0] = "Music";    //["Music ", "music"];
option[SOUNDS, 1] = "SFX";        //["SFX ", "sound"];
option[SOUNDS, 2] = "Back";

//controls menu
option[CONTROLS, 0] = "Up";
option[CONTROLS, 1] = "Left";
option[CONTROLS, 2] = "Down";
option[CONTROLS, 3] = "Right";
option[CONTROLS, 4] = "Back";


op_length = 0;
menu_level = 0;