//if (live_call()) return live_result;

/*
sleep = (спрайт это спит + спрайт это встал). sleep = false + true (true);
sleep = true + false (true); sleep = false + false (false); sleep = true + true (true);
*/

player_items = [];
for (var i = 0; i < array_length(oItemManager.inv); i++)
{
	if oItemManager.inv[i] != noone && oItemManager.inv[i].cost > 0
	{
		array_push(player_items, oItemManager.inv[i]);	
	}
}

array_push(player_items, { Name : "Leave" });

sleep = (sprite_index == sprite_sleep or sprite_index == sprite_awake);

//После всего
if timer_blink > 0
{
	if !sleep
	{
		timer_blink--;	
	}
} else
{
	if sprite_index == sprite_normal
	{
		sprite_index = sprite_blink;
	}
}

if !sleep
{
	//прибавляем к фону непрозрачность, чтобы сделать его полностью видимым если ещё не создан диалог
	if !is_start_textbox_created
	{
		alphaBg += 0.005;
	}
	//или если создан
	else
	{
		//если нет диалога, то убавляем
		if !instance_exists(oTextbox)
		{
			alphaBg -= 0.05;	
		}
	}
	alphaBg = clamp(alphaBg, 0.3, 1);
	
	//создаём стартовый текстобкс после ожидания таймера
	if timerWaitAfterAwake > 0
	{
		timerWaitAfterAwake--;
	} else
	{
		if !is_start_textbox_created
		{
			CreateTextbox("BradenShopStartDialog");
			is_start_textbox_created = true;
		}
	}	
}

//показ инвентаря после стартового диалога
if is_start_textbox_created && !instance_exists(oTextbox)
{
	//понижаем таймер если он больше чем 0
	if timerWaitAfterDialog > 0
	{
		timerWaitAfterDialog--;
	} else
	{	
		//если не существует диалога
		if !instance_exists(oTextbox)
		{
			//layer_depth(layer_get_id(layer_assets), depth+100);
			
			//показываем магазин
			showShop = true;	
			
			//прибавляем непрозрачность магазина 
			alphaShop += 0.05;
		}
	}
}

if showShop && alphaShop >= 1 && !leave
{
	var _pos_sbm = posSubMenu;
	
	pos += input_check_pressed("down")-input_check_pressed("up");
	
	if posSubMenu == 0
	{
		if pos < 0 { pos = array_length(braden_items)-1; };
		if pos >= array_length(braden_items) { pos = 0; };
	} else
	{
		if pos < 0 { pos = array_length(player_items)-1; };
		if pos >= array_length(player_items) { pos = 0; };
	}
	
	//прибавляем к суб меню нажатия и ограничиваем от 0 до 1
	posSubMenu = clamp(posSubMenu + (keyboard_check_pressed(ord("R")) - keyboard_check_pressed(ord("Q"))), 0, 1);
	
	//если позиция суб меню изменена, то вертикальная позиция обнуляется
	if posSubMenu != _pos_sbm
	{
		pos = 0;
	}
	
	//если нажата кнопка использования
	if input_check_pressed("action")
	{
		//если позиция не равна кнопке Leave (-1 потому что pos начинается с 0)
		if pos != ((posSubMenu == 0) ? (array_length(braden_items)) : (array_length(player_items)))-1
		{
			//если суб меню = 0
			if posSubMenu == 0
			{
				//получаем индекс слота с монетами
				posCoins = item_get_slot_number(global.item_list.coin);
				//если хватает монет
				if posCoins != -1 && oItemManager.inv[posCoins].number >= braden_items[pos].cost
				{
					//платим
					oItemManager.inv[posCoins].number -= braden_items[pos].cost;
					
					//show_debug_message($"{oItemManager.inv[posCoins].number} - {braden_items[pos].number}");
					
					//добавляем предмет
					item_add(braden_items[pos], 1);	
				}
			} 
			//либо если = 1
			else
			{
				//var _slot = item_get_slot_number(player_items[pos]);
				
				//добавляем монеты
				item_add(global.item_list.coin, player_items[pos].cost);
				delete_item(player_items[pos]);
				
			}
		}
		//либо уходим
		else
		{
			//уходим
			leave = true;
		}
	}
}	

//если уходим
if leave
{
	if alpha_leave < 1
	{
		alpha_leave += 0.05;	
	} else
	{
		room_goto(rCave);
	}
}

//if keyboard_check(vk_shift)
//{
//	if keyboard_check_pressed(ord("L"))
//	{
//		room_set_live(room, true);
//		room_restart();
//	}
//}

//show_debug_message(layer_assets_IDs);
