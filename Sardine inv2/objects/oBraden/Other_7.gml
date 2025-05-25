//перезапускаем анимации принудительно
image_index = 0;

//перезапускаем таймер моргания
if sprite_index == sprite_blink
{
	sprite_index = sprite_normal;	
	timer_blink = irandom_range(4 * 60, 15 * 60);
}

if sprite_index == sprite_sleep
{
	//проверяем если число анимации равно тому, сколько должна повториться
	if sleepAnimationCount == sleepAnimationTimes
	{
		//ставим спрайт просыпания
		sprite_index = sprite_awake;
	}
	//прибавляем к счётчику анимации сна 1
	sleepAnimationCount++;
}

//если просыпание, то нормальный ставим
if sprite_index == sprite_awake
{
	sprite_index = sprite_normal;
}