if (global.BossHP < 100 && oBoss.boss_phase == 2) {
    global.BossHP = min(global.BossHP + 2, global.BossHPMax);
}


followUpTimer = clamp(followUpTimer - 1, 0, followUpTimerMax);

if (followUpTimer == 0)
{
	global.BossHPPrev = lerp(global.BossHPPrev, global.BossHP, 0.2);
}

//test
if(keyboard_check_pressed(vk_numpad9))
{
	global.BossHP -= 50;
	followUpTimer = followUpTimerMax;
}

if(keyboard_check_pressed(vk_numpad0))
{
	global.BossHP += 50;
}