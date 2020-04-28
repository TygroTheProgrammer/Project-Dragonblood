
if (!instance_exists(creator)) || ds_list_find_index(parried_objects, other) || (other.creator == creator)
{	
	exit;


}


	freeze(10);
	instance_destroy(other);
	ds_list_add(parried_objects, other);
	other.creator.state = State.Knockback;
	//other.creator.alarm[0] = stun;
	freeze(freeze_length);
	screenshake(shake_mag, shake_leng);
	other.creator.hkb = knockback * -other.creator.image_xscale;
	other.creator.vkb = vkb;
	//other.creator.hit = true;
	audio_play_sound(snd_player_parry,2,false);
	creator.Xkickback = other.knockback * other.creator.image_xscale * 0.7;
	creator.hitObject = true;