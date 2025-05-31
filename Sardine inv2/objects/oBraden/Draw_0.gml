//if (live_call()) return live_result;

//рисуем задний фон
draw_sprite_stretched_ext(sShopBgPh, 0, 0, 0, room_width, room_height, c_white, alphaBg);

//рисуем себя
draw_self();


//рисуем окна магазина

//если не показываем магазин, то выходим из события
if !showShop { exit; };

//получаем размер спрайта
var _ww = sprite_get_width(sMenu);
var _hh = sprite_get_height(sMenu);

//объявляем переменные (будем менять их постпенно по коду)
var _cur_w;
var _cur_h;

//нужный размер спрайта для среднего меню
_cur_w = room_width/3;
_cur_h = room_height*0.8;

//рисуем среднее меню
draw_sprite_ext(sMenu, 0, room_width/2 - _cur_w/2, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);

//вещи мистера сэра бармена бромена бре- бру- 0010100101 бурбамела. <\\Брамена//>
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//for (var i = 0; i < array_length(oItemManager.inv); i++)
//{
//	var _c = c_white;
	
//	if pos == i { _c = c_yellow; };
	
//	draw_text_color(room_width/2-_cur_h, room_height/4+32*i, oItemManager.inv[i].Name, _c, _c, _c, _c, alphaShop);
//}

//нужный размер спрайта для левого меню
_cur_w = room_width/6;
_cur_h = room_height*0.6;

//рисуем левое меню
draw_sprite_ext(sMenu, 0, room_width/4 - _cur_w/2, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);



//нужный размер спрайта для правого меню такой же как и у левого

//рисуем правое меню
draw_sprite_ext(sMenu, 0, room_width - room_width/4 - _cur_w/2, room_height/2 - _cur_h/2, _cur_w / _ww, _cur_h / _hh, 0, c_white, alphaShop);



//текст

//имя магазина
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_color(room_width/2, room_height/2 - room_height/3, shop_name, c_white, c_white, c_white, c_white, alphaShop);








