/// @description set up cam
cam = view_camera[0];
follow = obj_player;
x = follow.x;
y = follow.y - 80;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = x;
yTo = y;



shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 50;
