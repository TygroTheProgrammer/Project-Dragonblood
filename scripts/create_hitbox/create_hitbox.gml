///@arg x
///@arg y
///@arg creator
///@arg sprite
///@arg knockback
///@arg lifespan
///@arg damage
///@arg xscale
///@arg stun
///@arg vkb
///@arg Xkickback
///@arg Ykickback
///@arg shake_mag
///@arg shake_leng
///@arg freeze_length
var hitX = argument0;
var hitY = argument1;
var creator = argument2;
var sprite = argument3;
var knockback = argument4;
var lifespan = argument5;
var wounds = argument6;
var xscale = argument7;
var stun = argument8;
var vkb = argument9;
var Xkickback = argument10;
var Ykickback = argument11;
var shake_mag = argument12
var shake_leng = argument13;
var freeze_length = argument14;



var hitbox = instance_create_layer(hitX, hitY, "Hitboxes", obj_hitbox);
hitbox.sprite_index = sprite;
hitbox.creator = creator;
hitbox.knockback = knockback;
hitbox.alarm[0] = lifespan;
hitbox.wounds = wounds;
hitbox.image_xscale = xscale;
hitbox.stun = stun;
hitbox.vkb = vkb;
hitbox.Xkickback = Xkickback;
hitbox.Ykickback = Ykickback;
hitbox.shake_mag = shake_mag;
hitbox.shake_leng = shake_leng;
hitbox.freeze_length = freeze_length;
hitbox.image_speed = hitbox.creator.image_speed;




