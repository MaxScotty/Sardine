//if (live_call()) return live_result;

/*
sleep = (спрайт это спит + спрайт это встал). sleep = false + true (true);
sleep = true + false (true); sleep = false + false (false); sleep = true + true (true);
*/

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
	//ставим точку к которой будет двигаться персонаж
	yy = room_height-sprite_height;
		
	//понижаем таймер если он больше чем 0
	if timerWaitAfterDialog > 0
	{
		//если y равен yy
		if round(y) == yy
		{
			//понижаем непрозрачность всех элементов слоя ассетов
			for (var i = 0; i < array_length(layer_assets_IDs); i++)
			{
				var _id = layer_assets_IDs[i];
		
				layer_sprite_alpha(_id, clamp(layer_sprite_get_alpha(_id)-0.05, 0, 1));
			}
			timerWaitAfterDialog--;
		}
	} else
	{	
		//если не существует диалога
		if !instance_exists(oTextbox)
		{
			//показываем магазин
			showShop = true;	
			
			//прибавляем непрозрачность магазина 
			alphaShop += 0.05;
		}
	}
}

//перемещаемся вертикально по переменной yy
y = lerp(y, yy, 0.1);


if showShop && alphaShop >= 1
{
	var _pos_sbm = posSubMenu;
	
	
	
	
	//если позиция суб меню изменена, то вертикальная позиция обнуляется
	if posSubMenu != _pos_sbm
	{
		pos = 0;
	}
}	


if keyboard_check(vk_shift)
{
	if keyboard_check_pressed(ord("L"))
	{
		room_set_live(room, true);
		room_restart();
	}
}
