///@arg pos_x
///@arg pos_y
///@arg h_speed
///@arg v_speed
///@arg g_speed
///@arg dir


var pos_x = argument0;
var pos_y = argument1;
var h_speed = argument2;
var v_speed = argument3;
var g_speed = argument4;
var dir = argument5;




var particle =  instance_create_layer(pos_x,pos_y,"Particles", obj_blood);


particle.hspeed = h_speed;
particle.vspeed = v_speed;
particle.gravity = g_speed;
particle.direction = dir;
