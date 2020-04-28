///@arg x
///@arg y
///@arg creator
///@arg sprite
///@arg lifespan
///@arg xscale
///@arg stun
///@arg xknockback
///@arg Yknockback
///@arg shake_mag
///@arg shake_leng
///@arg freeze_length
///@arg destructible

var hitX = argument0;
var hitY = argument1;
var creator = argument2;
var sprite = argument3;
var lifespan = argument4;
var xscale = argument5;
var stun = argument6;
var xknockback = argument7;
var yknockback = argument8;
var shake_mag = argument9
var shake_leng = argument10;
var freeze_length = argument11;
var destructible = argument12;



var hitbox = instance_create_layer(hitX, hitY, "Hitboxes", obj_parry_hitbox);
hitbox.xx = hitX;
hitbox.yy = hitY;
hitbox.sprite_index = sprite;
hitbox.creator = creator;
hitbox.alarm[0] = lifespan;
hitbox.image_xscale = xscale;
hitbox.stun = stun;
hitbox.knockback = xknockback;
hitbox.vkb = yknockback;
hitbox.shake_mag = shake_mag;
hitbox.shake_leng = shake_leng;
hitbox.freeze_length = freeze_length;
hitbox.destructible = destructible;



