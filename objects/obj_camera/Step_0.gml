/// @description Update cam

if (instance_exists(follow))
{
	xTo = follow.x + (25 * follow.image_xscale);
	yTo = follow.y - 80;
}

x += (xTo - x) / 25;
y += (yTo - y) / 50;

x = clamp(x,view_w_half, room_width-view_w_half);
y = clamp(y,view_h_half+100, room_height-view_h_half);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));


camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
//if (layer_exists("Background"))
//{
//	layer_x("Background", x / 2);
//}
if (layer_exists("Background_1"))
{
	layer_x("Background_1", x / 10);
}

//if (layer_exists("Back_Solids"))
//{
//	layer_x("Back_Solids", x / 10);
//}


