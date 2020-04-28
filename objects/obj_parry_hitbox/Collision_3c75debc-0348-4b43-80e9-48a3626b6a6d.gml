
if (!instance_exists(creator)) || ds_list_find_index(parried_objects, other) || (other == creator)
{	
	exit;


}

	freeze(100);
	creator.state = State.Attack;
	ds_list_add(parried_objects, other);
	other.state = State.Knockback;
	//other.creator.alarm[0] = stun;
	freeze(freeze_length);
	screenshake(shake_mag, shake_leng);
	other.hkb = knockback * -other.direction_facing;
	other.vkb = vkb;
	//other.creator.hit = true;
	audio_play_sound(snd_player_parry,2,false);
	//creator.Xkickback = other.knockback * other.creator.image_xscale * 0.7;
	//creator.hitObject = true;