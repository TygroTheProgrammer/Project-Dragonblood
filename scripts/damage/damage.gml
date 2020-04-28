///@arg target
///@arg wounds
///@arg horizontal kb
///@arg vertical kb
///@arg stun time
var target = argument0;
var dmg = argument1;
var knockback_h = argument2;
var knockback_v = argument3;
var stn = argument4;

target.hp -= dmg;
target.hkb = knockback_h;
target.vkb = knockback_v;
target.flash = 10;
target.hit = true;
target.hitRember = true;
target.alarm[1] = 100;
target.alarm[0] =  stn; 
