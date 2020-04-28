event_inherited();

if (!instance_exists(obj_player))
{
	exit;	
}

soundCounter = approach(soundCounter,0,1);



switch (state)
{
case (State.Chase):

if (soundCounter <= 0)
{
soundCounter = 100;

}
set_state_sprite(spr_imp,1,0);
if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,obj_wall))
{
		direction_facing = -direction_facing;
}
hsp = movement_speed * direction_facing;


if (place_meeting(x,y+1,obj_wall))
{
	grounded = true;
}
else
{
	grounded = false;
}
break;
case (State.Knockback):

set_state_sprite(spr_imp_hit,1,0);
set_state_foe_knockback();
break;

}
if (hit == true)
{
	audio_sound_pitch(snd_imp_ambient,random_range(0.8,1.5));
	audio_play_sound(snd_imp_ambient,1,false);
	audio_sound_pitch(snd_mob_hit,random_range(0.5,1.1));
	audio_play_sound(snd_mob_hit,1,false);
	hit = false;
}