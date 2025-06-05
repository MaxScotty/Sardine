//if (live_call()) return live_result;

//depthstart = depth;


sprite_normal = sBraden;
sprite_sleep = sBradenSleeps;
sprite_awake = sBradenAwake;
sprite_blink = sBradenBlinks;


timer_blink = 30;

sleep = true;

//сколько раз повторится анимация сна
sleepAnimationTimes = 3;

//счётчик этой анимации
sleepAnimationCount = 0;

//непрозрачность фона
alphaBg = 0.3;

//для стартового текстбокса
is_start_textbox_created = false;
timerWaitAfterAwake = 120;

//таймер для ожидания после диалога
timerWaitAfterDialog = 60;

//переменная для передвижения
yy = y;

//показ меню магазина
showShop = false;

//получаем все id элементов слоя асетов
layer_assets_IDs = layer_get_all_elements("Assets_1");


//непрозрачность меню магазина
alphaShop = 0;

//имя магазина
shop_name = "Braden Shop";

//позиция в меню по вертикали
pos = 0;

//по горизонтали
posSubMenu = 0;

//предметы кладмена
braden_items = [];

//добавляем предметы
repeat 5
	array_push(braden_items, global.item_list.green_tea);

//кнопка выхода
array_push(braden_items, { Name : "Leave" });

//параметры для выхода
leave = false;
alpha_leave = 0;

//получаем индекс слота с монетами
posCoins = item_get_slot_number(global.item_list.coin);

subMenuExtY[0] = 0;
subMenuExtY[1] = 0;

subMenuText[0] = "Buy";
subMenuText[1] = "Sell";

player_items = [];
