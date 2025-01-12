function GameScript(_text_id){

switch(_text_id) {

	//--------------TEST--------------\\
	case "npc 5":
	TextScript("Hey!", "Neutral");
	TextScript("Hey, Let's start testing you!!", "OtherCharacter");
	TextScript("Okay but how?", "Neutral");
	TextScript("EMOTION TEST!!!!!", "OtherCharacter");
	TextScript("Be Confused", "OtherCharacter");
	TextScript("Okay now im confused", "Confused");
	TextScript("Be Embrassered", "OtherCharacter");
	TextScript("Now im embrassered", "Embrassered");
	TextScript("Be grumpy", "OtherCharacter");
	TextScript("Okay im grumpy", "Grumpy");
	TextScript("can we take a joy face please", "OtherCharacter");
	TextScript("Sure", "Joy");
	TextScript("Meh time", "OtherCharacter");
	TextScript("Meh.......", "Meh");
	TextScript("Be nervous", "OtherCharacter");
	TextScript("i feel nervous", "Nervous");
	TextScript("Let's cry", "OtherCharacter");
	TextScript(":(((((((", "Sad");
	TextScript("BOOOOOOOOO", "OtherCharacter");
	TextScript("im scared", "Scared");
	TextScript("You are shy but you can't close your eyes when you shy right? (SHY THING WONT WORK)", "OtherCharacter");
	TextScript("Yes.", "Modest");
	TextScript("But you can stay your eyes open when you are shy hehe", "OtherCharacter");
	TextScript("Yeah..", "ShyEyes");
	TextScript("SMILE", "OtherCharacter");
	TextScript(":))))))))", "Smile");
	TextScript("Be sneaky", "OtherCharacter");
	TextScript("hihihiihihihi", "Sneaky");
	TextScript("Surprisee!!", "OtherCharacter");
	TextScript("wow im surprised", "Surprised");
	TextScript("Now the functions!!", "OtherCharacter");
	TextScript("This WORD is green!!", "OtherCharacter");
		TextScriptColor(5, 9, c_green, c_green, c_green, c_green);
	TextScript("This WORD is half green!!", "OtherCharacter");
		TextScriptColor(5, 9, c_green, c_green, c_white, c_white);
	TextScript("This WORD is different green!!", "OtherCharacter");
		TextScriptColor(5, 9, c_white, c_green, c_white, c_green);
	TextScript("This TEXT is floating!!", "OtherCharacter");
		TextScriptFloat(5, 9); 
	TextScript("Test is done. Are you tired?");
	TextScript("Yes", "Annoyed");
	
	oGame.TalkedWithNpc = 1;
	break;

	case "npc 2":
	TextScript("We've just tested you", "OtherCharacter");
	break;
	
	case "walk":
	TextScript("Hello!", "OtherCharacter");
	TextScript("I am an NPC Test!", "OtherCharacter");
	TextScript("I am doing nothing but walking around!", "OtherCharacter");
	TextScript("That's a pretty boring job", "Confused");
	TextScript("And sitting all day on a chair trying to code something isn't a boring job", "OtherCharacter");
	TextScript("...", "Neutral");
	TextScript("See ya!", "OtherCharacter");
	TextScript("...", "Neutral");
	TextScript("How Rude", "Grumpy");
	break;
	
	case "Quest":
	TextScript("Hello, Sardine", "OtherCharacter");
	TextScript("While Max is suffering getting bachelor's degree, I have a task for you", "OtherCharacter");
	TextScript("In the cave I saw...", "OtherCharacter");
	TextScript("...A beautiful flower", "OtherCharacter");
	TextScript("Bring it to me and you will get something in return", "OtherCharacter");
	TextScript("Will you help me?", "OtherCharacter");
		OptionScript("Of course!", "Quest - yes");
		OptionScript("I will wait for Max", "Quest - no");
	break;
	case "Quest - yes":
		TextScript("Don't come back withough the flower!", "OtherCharacter");
		oGame.QuestStatus[? "The flower quest"] = 1;
		break;
	case "Quest - no":
		TextScript("Heh, good luck waiting lol!", "OtherCharacter");
		break;
		
	case "Quest Reminder":
		TextScript("It is not so far away", "OtherCharacter");
		break;
		
	case "Quest Completed":
		TextScript("Do you found the flower?", "OtherCharacter");
			OptionScript("Yes", "Quest Completed - yes");
			OptionScript("No", "Quest Completed - no");
		break;
		
	case "Quest Completed - yes":
		var _item = item_get_slot_number(global.item_list.flower);
		
		if _item != -1
        {
            //var _slot_selected = item_get_list_name(global.item_list.flower.Name);
            
            //if _slot_selected == item_get_from_pos(oItemManager.posX, oItemManager.posY)
           // {
                global.can_use_flower = true;
                global.canUseItem = false;
                
                oItemManager.can_swap = false;
                oItemManager.showInv = true;
            
                oGame.create_textbox = true;
                oGame.textbox_text_id = "Quest Completed - yes yes";
                
                TextScript("");
                instance_destroy(oTextbox);
           } else
           {
				global.canUseItem = true
				
                if global.canUseItem
				{
            
                oItemManager.can_swap = false;
                oItemManager.showInv = true;
            
                oGame.create_textbox = true;
                oGame.textbox_text_id = "Wrong";
                
                TextScript("");
                instance_destroy(oTextbox); 
				}
            }
        //} else
        //{
            if oGame.QuestStatus[? "The flower quest"] == 2
            {
                GameScript("Quest Completed - yes yes");    
                //oGame.textbox_text_id = "Quest Completed - finish";
            }
            
            if oGame.QuestStatus[? "The flower quest"] == 3
            {
                GameScript("Quest Completed - finish");
            } 
        //}
		
		break;
	
	case "Quest Completed - yes yes":
		TextScript("Thank you, Thank you", "OtherCharacter");
		TextScript("And you are getting...", "OtherCharacter");
		TextScript("One more 'Thanks'!", "OtherCharacter");
		TextScript("Because the happiness of the person you helped, is the best reward", "OtherCharacter");
		oGame.QuestStatus[? "The flower quest"] = 3;
		break;
	
	case "Quest Completed - no":
		TextScript("Then why are you bothering me???", "OtherCharacter");
		break;
	
	case "Quest Completed - finish":
		TextScript("So long, traveler", "OtherCharacter");
		break;
		
	case "Wrong":
		TextScript("Noooo! I don't need that", "OtherCharacter");
		break;
	
	/*case "meme":
	TextScript("Бесят!", "Annoyed Meme");
	TextScript("Постоянно пунькают мне в носик", "Angry");
	TextScript("А я не просил меня пунькать", "Annoyed");
	TextScript("НЕ ОДОБРЯЛ ПУНЬКАНЬЕ", "Annoyed Meme");
	TextScript("...", "Angry Meme");
	TextScript("тупые я вас ненавижу...", "Angry Meme");
	*/
	/*case "Roll":
	TextScript("Hello!", "OtherCharacter");
	TextScript("Hey, You are walking around here too?", "Confused");
	TextScript("No, Max was too lazy to give me walking animation for such.", "OtherCharacter");
	TextScript("Once that devlog will be recorded, i will be deleted", "OtherCharacter");
	TextScript("That's...awful...", "Sad");
	TextScript("It is a law of test's life", "OtherCharacter");
	TextScript("Anyway, Let's try to Roll! Press Shift while you walking around", "OtherCharacter");
	oGame.TalkedWithNpc = 1;
	break;
	
	case "RollContinue":
	TextScript("What do you think?", "OtherCharacter");
	TextScript("That's pretty practical", "Smile");
	TextScript("Wait a minute...", "Confused");
	TextScript("Since when are the NPC's explaining the new features in devlogs", "Confused");
	TextScript("We got it from Daevis's devlogs :D", "OtherCharacter");
	TextScript("Add his game Wandering Cat to your Wishlist on Steam ;)", "OtherCharacter");
	TextScript("...", "Meh");
	TextScript("We just did an advertisement...", "Meh");
	TextScript("We did :)", "OtherCharacter");
	TextScript("And nobody is going to pay us...", "Meh");
	TextScript("No. Why should we get paid for recommending a good game?)", "OtherCharacter");
	TextScript("...", "Meh");
	TextScript("Max, you will have a very poor future with such attitude...", "Meh");
	break;*/

}

}

//scr_text_color(9, 15, c_blue, c_blue, c_blue, c_blue); //scr_text_float(1, 4);           //scr_text_color(9, 11, c_blue, c_blue, c_blue, c_blue);