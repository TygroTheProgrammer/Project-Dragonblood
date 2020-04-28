
if creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || (creator.faction == other.faction)
{
	exit;	
}

ds_list_add(hit_objects, other);


if (other.hitRember == false)
{
other.hp -= damage;
other.hit = true;
other.knockback_speed = knockback* image_xscale;
other.stun = stun;
other.vkb = vkb;
other.flash = 5;
other.alarm[1] = 100;
other.hitRember = true;
}
creator.Xkickback = Xkickback * -creator.image_xscale;
creator.Ykickback = Ykickback;
creator.hitObject = true;
creator.shake_mag = shake_mag;
creator.shake_leng = shake_leng;
if (impactDelay == 0)
{
screenshake(shake_mag, shake_leng);
freeze(freeze_length);
impactDelay = 5;
}
impactDelay = approach(impactDelay, 0, 1);