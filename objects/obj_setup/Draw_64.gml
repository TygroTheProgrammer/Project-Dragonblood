/// @decription draw hearts
var width = display_get_gui_width();
var xx = width - 26 * 10;
var yy = 36;
var xEmpty = 0;
var yEmpty = 0;
var xFull = 0;
var yFull = 0;
var xHalf = 0;
var yHalf = 0;
/*
obj_player.max_hp = clamp(obj_player.max_hp, 10, 26);
obj_player.hp = clamp(obj_player.hp,0,obj_player.max_hp);


repeat (obj_player.max_hp/2)
{
	if (xEmpty == 26 * 10)
	{
		yEmpty = 26;
		xEmpty = 0;
	}

	draw_sprite(spr_hp_empty,image_index * 0.2,xx + xEmpty, yy + yEmpty);

	xEmpty += 26;
}

repeat (floor(obj_player.hp/2) + frac(obj_player.hp/2) * 2)
{
	if (xHalf == 26 * 10)
	{
		yHalf = 26;
		xHalf = 0;
	}
	
	draw_sprite(spr_hp_half,image_index * 0.2,xx + xHalf, yy + yHalf);

	xHalf += 26;
}

repeat (floor(obj_player.hp/2))
{
	if (xFull == 26 * 10)
	{
		yFull = 26;
		xFull = 0;
	}

	draw_sprite(spr_hp_full,image_index * 0.2,xx + xFull, yy + yFull);

	xFull += 26;
}
*/

