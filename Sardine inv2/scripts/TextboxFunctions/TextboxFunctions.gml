function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variables for every letter/character
	for (var c = 0; c < 500; c++)
		{
			col_1[c, page_number] = c_white
			col_2[c, page_number] = c_white
			col_3[c, page_number] = c_white
			col_4[c, page_number] = c_white
			
			float_text[c, page_number] = 0;
			float_dir[c, page_number] = c*20;			
		}
	
	txtb_spr[page_number] = sTextbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_type;
}



//-----------------TEXT VFX--------------//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function TextScriptColor(_start, _end, _col1, _col2, _col3, _col4){
	
for(var c = _start; c <= _end; c++)
	{
	col_1[c, page_number-1] = _col1;
	col_2[c, page_number-1] = _col2;
	col_3[c, page_number-1] = _col3;
	col_4[c, page_number-1] = _col4;
	}
	
}

///@param 1st_char
///@param last_char
function TextScriptFloat(_start, _end)
{
	for(var c = _start; c <= _end; c++)
		{
		float_text[c, page_number-1] = true;
		}

}

/// @param text
/// @param [character]
/// @param [side]
function TextScript(_text){

	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
//Angry
//Confused
//Embrassered
//Sad
//Grumpy
//Joy
//Meh
//Nervous
//Neutral
//Scared
//Shy
//ShyOpenEyesEmotion
//Smile
//Sneaky
//Surprised	
//get character info


	if argument_count > 1 {
		switch(argument[1])
		
		{
		
		//Character
		case "Angry":
			speaker_sprite[page_number] = sAngryEmotion; 
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
					
		case "Confused":
			speaker_sprite[page_number] = sConfusedEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;	
			
		case "Embrassered":
			speaker_sprite[page_number] = sEmbrasseredEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Grumpy":
			speaker_sprite[page_number] = sGrumpyEmotion; 
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Joy":
			speaker_sprite[page_number] = sJoyEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;	
			
		case "Meh":
			speaker_sprite[page_number] = sMehEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Nervous":
			speaker_sprite[page_number] = sNervousEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;	
			
		case "Neutral":
			speaker_sprite[page_number] = sNeutralEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Sad":
			speaker_sprite[page_number] = sSadEmotion; 
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Scared":
			speaker_sprite[page_number] = sScaredEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;	
			
		case "ShyEyes":
			speaker_sprite[page_number] = sShyClosedEyesEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;	
			break;
			
		case "Smile":
			speaker_sprite[page_number] = sSmileEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;	
			
		case "Sneaky":
			speaker_sprite[page_number] = sSneakyEmotion;
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Surprised":
			speaker_sprite[page_number] = sSurprisedEmotion; 
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;
			
		case "Annoyed":
			speaker_sprite[page_number] = sAnnoyedEmotion;
			txtb_spr[page_number] = sTextbox;
			snd[page_number] = snd_type;
			break;
			
		case "Shy":
			speaker_sprite[page_number] = sShyEmotion;
			txtb_spr[page_number] = sTextbox;
			snd[page_number] = snd_type;
			break;
			
		case "Annoyed Meme":
			speaker_sprite[page_number] = sAnnoyedEmotionMeme;
			txtb_spr[page_number] = sTextbox;
			snd[page_number] = snd_type;
			break;
			
		case "Angry Meme":
			speaker_sprite[page_number] = sAngryEmotionMeme;
			txtb_spr[page_number] = sTextbox;
			snd[page_number] = snd_type;
			break;
			
		//Other character
		case "OtherCharacter": //OTHER NPC
			speaker_sprite[page_number] = sBC; 
			txtb_spr[page_number] = sTextbox; 
			snd[page_number] = snd_type;
			break;		
					
		}
}
		
	


	//side the character is on
	
	if argument_count > 2 {
		speaker_side[page_number] = argument[2];
		}

	page_number++;

	}





/// @param option
/// @param link_id
function OptionScript(_option, _link_id) {
	option [option_number] = _option;
	option_link_id[option_number] = _link_id
	
	option_number++;
}





/// @param text_id
function CreateTextbox(_text_id) {
	
	with(instance_create_depth(0, 0, -9999, oTextbox))
		{
		GameScript(_text_id);
		}
	
}