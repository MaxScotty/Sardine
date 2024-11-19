enum BattleStates
{
	idle,
	attack,
	defend,
	down
}

function bubble_sort(list){
    list_size = ds_list_size(list);
    for (var i = 0; i < list_size; i++) {
        for (var j = 0; j < list_size - i - 1; j++) {
            if (list[|j].x > list[|j+1].x) {
                var swapped = list[|j];
                list[|j] = list[|j+1];
                list[|j+1] = swapped;
            }
        }
    }
}

