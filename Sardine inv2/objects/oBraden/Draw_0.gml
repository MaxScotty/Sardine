//if (live_call()) return live_result;

//рисуем задний фон
draw_sprite_stretched_ext(sShopBgPh, 0, 0, 0, room_width, room_height, c_white, alphaBg);

//стол и всё такое
draw_sprite_ext(sTable,			0, 0,	256, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleTwo,		0, 463, 240, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleThree,	0, 527, 160, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleOne,		0, 167, 208, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleFour,	0, 98,	223, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleThree,	0, 66,	184, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleFour,	0, 561, 251, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBottleTwo,		0, 128, 256, 1, 1, 0, c_white, 1);

//рисуем себя
draw_self();


//рисуем окна магазина

//если не показываем магазин, то выходим из события
if !showShop { exit; };

//получаем размер спрайта
var _ww = sprite_get_width(sMenu);
var _hh = sprite_get_height(sMenu);

//объявляем переменные (будем менять их постепенно по коду)
var _cur_w;
var _cur_h;

//нужный размер спрайта для среднего меню
_cur_w = room_width/3;
_cur_h = room_height*0.8;


draw_set_halign(fa_left);
draw_set_valign(fa_top);
//рисуем суб меню
for (var i = 0; i < 2; i++)
{
	var _ext_y = 8;
	var _c = c_white;
	
	if posSubMenu == i { _ext_y = 24; _c = c_yellow; };
	
	subMenuExtY[i] = lerp(subMenuExtY[i], _ext_y, 0.1);
	
	var _cur_ext_y = subMenuExtY[i];
	
	draw_sprite_ext(sMenu, 0, room_width/2 - _cur_w/3 + _cur_w/2.5*i, room_height/2 - _cur_h/2 - 8 - _cur_ext_y, (_cur_w / _ww)/3.5, 48 / _hh, 0, c_white, alphaShop);
	draw_text_color(room_width/2 - _cur_w/3 + 16 + _cur_w/2.5*i, room_height/2 - _cur_h/2 - _cur_ext_y, subMenuText[i], _c, _c, _c, _c, alphaShop);
}


//рисуем среднее меню
draw_sprite_ext(sMenu, 0, room_width/2 - _cur_w/2, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);


//нужный размер спрайта для левого меню
_cur_w = room_width/4;
_cur_h = room_height*0.6;

//рисуем левое меню
draw_sprite_ext(sMenu, 0, room_width/4 - _cur_w/1.5, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);



//нужный размер спрайта для правого меню такой же как и у левого

//рисуем правое меню
draw_sprite_ext(sMenu, 0, room_width/2 + room_width/4 - _cur_w/3, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);


draw_set_halign(fa_left);
draw_set_valign(fa_top);

//получаем сколько монет
var _coin_got = (posCoins != -1) ? (oItemManager.inv[posCoins].number) : (0);
//рисуем предметы
if posSubMenu == 0
{
	for (var i = 0; i < array_length(braden_items); i++)
	{
		var item = braden_items[i];
	
		var _c = c_white;
	
		if pos == i 
		{
			_c = c_yellow; 
	
			//описание и абилитис рисуем если не кнопка выхода 
			if i != array_length(braden_items)-1
			{
				draw_text_ext_color(room_width - room_width/4 - _cur_w/2+48, room_height/2 - _cur_h/2+32, $"Cost: {item.cost}\n\n\n\nYou got: {_coin_got}", 32, _cur_w-16, c_white, c_white, c_white,c_white, 1);	
				draw_text_ext_color(room_width/4 - room_width/5.5 + 32, room_height/2 - room_height*0.3 + 32, $"*{item.description}\n*{item.abilities}", 32, _cur_w-16, c_white, c_white, c_white, c_white, 1);	
			}
		}
		
		//рисуем предметы бурбамелы
		draw_text_color(room_width/2 - room_width/5 + 48, room_height/2 - room_height*0.4+48+32*i, /* добавляем "-", если i не на кнопке выхода */ $"{(i != array_length(braden_items)-1) ? ("-") : ("")}{item.Name}", _c, _c, _c,_c, 1);	
	}
}
else
{
	for (var i = 0; i < array_length(player_items); i++)
	{
		var item = player_items[i];
	
		var _c = c_white;
	
		if pos == i 
		{
			_c = c_yellow; 
	
			//рисуем описания доходов
			if i != array_length(player_items)-1
			{
				draw_text_ext_color(room_width - room_width/4 - _cur_w/2+48, room_height/2 - _cur_h/2+32, $"You will get: {item.cost}\n\n\n\nYou got: {_coin_got}", 32, _cur_w-16, c_white, c_white, c_white,c_white, 1);	
				//draw_text_ext_color(room_width/4 - room_width/5.5 + 32, room_height/2 - room_height*0.3 + 32, $"*{item.description}\n*{item.abilities}", 32, _cur_w-16, c_white, c_white, c_white, c_white, 1);	
			}
		}
	
		//рисуем наши предметы
		var _number = "";
		if i != array_length(player_items)-1
		{
			_number = $" ({item.number})";	
		}
		
		draw_text_color(room_width/2 - room_width/5 + 48, room_height/2 - room_height*0.4+48+32*i, /* добавляем "-", если i не на кнопке выхода */ $"{(i != array_length(player_items)-1) ? ("-") : ("")}{item.Name}{_number}", _c, _c, _c,_c, 1);	
	}
}
//draw_text_color(room_width/2 - room_width/5 + 48, room_height/2 - room_height*0.4+48+32*i, );

//текст

//имя магазина
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_color(room_width/2, room_height/2 - room_height/3, shop_name, c_white, c_white, c_white, c_white, alphaShop);






