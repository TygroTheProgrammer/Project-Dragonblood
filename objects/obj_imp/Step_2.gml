/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (hp <= 0)
{
	audio_sound_pitch(snd_imp_ambient,3);
	audio_play_sound(snd_imp_ambient,3,false);	
}