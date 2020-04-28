if (hp <= 0)
{
	instance_destroy();
	audio_sound_pitch(snd_mob_die,random_range(0.5,1.1));
	audio_play_sound(snd_mob_die,1,false);
}