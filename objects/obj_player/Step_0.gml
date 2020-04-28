//event_inherited();
xscaleFinal = xscale * direction_facing;
xscale = lerp(xscale, 1, 0.2);
yscale = lerp(yscale, 1, 0.2);



onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
onground = place_meeting(x,y+1,obj_wall);
onslope = place_meeting(x,y+1,obj_long_slope);

//Set Input
key_roll = keyboard_check_pressed(ord("Z"));
key_parry = keyboard_check_pressed(ord("C"));
key_parry_release = keyboard_check_released(ord("C"));
key_attack = keyboard_check_pressed(ord("X"));
key_jump_held = keyboard_check(vk_up);
key_jump = keyboard_check_pressed(vk_up);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_up = keyboard_check(vk_up);


if (key_left) || (key_right) || (key_attack) || (key_jump) || (key_down)
{
	controller = 0;
}

if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
{
	key_left = abs(min(gamepad_axis_value(0,gp_axislh), 0));
	key_right = round(max(gamepad_axis_value(0,gp_axislh), 0));
	controller = 1;
}

if (abs(gamepad_axis_value(0, gp_axislv)) > 0.1)
{
	key_up = abs(min(gamepad_axis_value(0,gp_axislv), 0));
	key_down = round(max(gamepad_axis_value(0,gp_axislv), 0));
	controller = 1;
}


if (gamepad_button_check_pressed(0, gp_face1))
{
	
	key_jump = 1;
	controller = 1;	
}
if (gamepad_button_check(0, gp_face1))
{
	key_jump_held = 1;
	controller = 1;	
}

if (gamepad_button_check_pressed(0, gp_face3))
{
	key_attack = 1;
	controller = 1;	
}

if (gamepad_button_check_pressed(0,gp_shoulderrb))
{
	key_roll = 1;
	controller = 1;
}



switch (state)
{

	case (State.Idle):
	#region state Idle
	fixedDir = false;

	movement();
	grav();

//REMEBER:This sets the buffer time for jumping

	
//Actions
if (onwall != 0) && (!onground)
{
	//Makes sure that not on ground and on wall
}

else if (key_attack)
{
	
	if (!onground) && (key_attack)
	{

		
		current_spr = spr.Sword_Air_N;
		state = State.Attack_Air;
	}
	else
	{
	
		if (attack_remember > 0)
		{
			
			audio_sound_pitch(snd_player_swing,random_range(0.6,1));
			audio_play_sound(snd_player_swing,2,false);
			current_spr = spr.Sword_2;
			state = State.Attack_2;	

		}
		else
		{
			audio_sound_pitch(snd_player_swing,random_range(0.8,1.3));
			audio_play_sound(snd_player_swing,2,false);
			
			attack_remember = 20;
			current_spr = spr.Sword_1;
			state = State.Attack;	
		}
	
	}
	


}



	//YOU SEE ME ROLLING

	if (onground)
	{

		if (key_down) && (hsp == 0)
		{
			hsp = 0;
			yscale = 0.7;
			xscale = 1.1;
		}

		
		if (key_roll)
		{
			state = State.Roll;
		}
		else if (key_parry)
		{
			state = State.Parry;

		}
	}

	

attack_remember--;

		if (onground) && ((key_left) || (key_right)) && (hsp != 0) && (walking = false)
		{

			walking = true;	
		}
	
		

	collide();
	#endregion
	break;
	
	case (State.Attack):
	#region state attack 1

	if (key_roll) 
	{
	state = State.Roll;
	}
	
	//Makes it so you cant turn while attacking
	fixedDir = true;
	movement();
	
	
	//Slows down when on ground
	if (onground) 
	{
	hsp = approach(hsp,0,0.5);
	}
	else
	{
		state = State.Idle;	
	}
	


	grav();
	
	current_spr = spr.Sword_1;

	
	
	////Checks frame hit range and if your attacking
	//if (animation_hit_frame(2))
	//{
	//	attack_remember = 10;
	//}
	

	

	
	if animation_hit_frame(2)
	{
		create_hitbox(x,y,self,spr_player_hurtbox, 2, 5, 1, direction_facing, 16, 0, 0, 0,4,7,0);
		hsp = 2 * direction_facing; 
	}
	
	if animation_end()
	{
		state = State.Idle;

		
	}
	
	if (key_attack) && ((attack_remember > 0) || (animation_hit_range(3,5)))
	{
		audio_sound_pitch(snd_player_swing,random_range(0.6,1.1));
		audio_play_sound(snd_player_swing,2,false);
		current_spr = spr.Sword_2;
		state = State.Attack_2;
		attack_remember = 0;
	}
	
	collide();
	#endregion;
	break;
		
	case (State.Attack_2):
	#region state attack 2

	attack_remember = 0;
	if (key_roll) 
	{
	state = State.Roll;
	}
	
	//Makes it so you cant turn while attacking
	fixedDir = true;
	movement();
	
	
	//Slows down when on ground

	hsp = approach(hsp,0,0.5);

	
	
	//if (key_jump)
	//{
	//	state = State.Idle;
	//}

	grav();
	
	current_spr = spr.Sword_2;

	////Checks frame hit range and if your attacking
	//if (animation_hit_range(2,3)) && (key_attack)
	//{
	//	state = State.Attack_Sword_2;
		
	//}
	
	
	if animation_hit_frame(2)
	{
		create_hitbox(x,y,self,spr_player_hurtbox, 2, 5, 1, direction_facing, 16, 0, 0, 0,4,7,0);
		hsp = 3 * direction_facing;
	}
	
	if animation_end()
	{
		state = State.Idle;
		attack_remember = 0;
		
	}
		
	//if (key_attack) && (attack_remember == 0) && (animation_hit_range(3,5))
	//{
	//	current_spr = spr.Sword_1;
	//	state = State.Attack;
	//	attack_remember = 20;
	//}

	if (!onground)
	{
		state = State.Idle;	
	}
	
	collide();
	#endregion;
	break;

	case (State.Attack_Air):
	#region state attack down
	
	set_state_sprite(spr_player_air_attack,1,0);
	movement();
	grav();
	fixedDir = true;
	current_spr = spr.Sword_Air_N;

	if (onground)
	{
		state = State.Idle;
	}
	
	if animation_hit_frame(2)
	{
		create_hitbox(x,y,self,spr_player_hurtbox, 2, 10, 1, direction_facing, 5, 0, 0, 0, 4, 7, 50);
	}
	if animation_end()
	{
		state = State.Idle;
		current_spr = spr.Idle;
		Ykickback = 0;
	}
	

	collide();
	#endregion;
	break;

	case (State.Knockback):
	#region state knockback
	current_spr = spr.Knockback;
	
	hsp = hkb;
	vsp = -vkb;
	vkb = approach(vkb, 0, 0.1);
	hkb = approach(hkb, 0, 0.1);
	
	if (hkb == 0)
	{
		direction_facing = -sign(hsp);
		hit = false;
		state = State.Idle;
		current_spr = spr.Idle;
	}
	grav();
	collide();
	#endregion
	break;
	
	case (State.Roll):
	#region state roll
	fixedDir = true;
	movement();
	current_spr = spr.Roll;
	invincible = true;
	hsp = 2 * direction_facing;
	if (animation_end()) || (key_jump)
	{
		hsp = approach(hsp,0,0.1);
		current_spr = spr.Idle;	
		state = State.Idle;
		invincible = false;
	}
	
 
	collide();
	grav();
	
	#endregion;
	break;
	

	
	case (State.Parry):
	#region state parry
	
	current_spr = spr.Parry;
	hsp = approach(hsp,0,0.1);
	
	//var done = false
	//if (animation_hit_frame(1)) && (done = false)
	//{
	//done = true;
	//image_speed = 0;
	//}
	
	
	//if (key_attack)
	//{
	//	state = State.Attack;	
	//}
	
	
	if (animation_hit_frame(2))
	{
	create_parry_hitbox(x,y,self,spr_parry_hitbox,20,direction_facing,40,1,0,2,3,3, false);	
	}
	
    if animation_end()//(key_parry_release) || (!key_parry)
	{

			state = State.Idle;
		current_spr = spr.Idle;
	}


	grav();
	collide();

	
	#endregion;
	break;

	default: 
	state = State.Idle;
	break;
}





#region Animation
switch (current_spr)
{
	case (spr.Idle):
	#region sprite idle
	
	


set_state_sprite(spr_player_idle,1,0);


	
	
	
if (!place_meeting(x,y+vsp+1, obj_wall)) && (vsp != 0)
{
	current_spr = spr.Air;	
}

else
{
	if (key_left) || (key_right)
	{
				
		current_spr = spr.Move;
		
	}

}	
	
	
	
	
	#endregion;
	break;
	
	case (spr.Move):
	#region sprite move
	set_state_sprite(spr_player_walk,1,0);

	
	if (hsp == 0) || (key_jump) || (!onground)
	{
		current_spr = spr.Idle;
	}
	

	
	#endregion
	break;
	
	case(spr.Air):
	#region sprite jump
	
	
	if (onwall != 0)
	{
		current_spr = spr.Onwall;

	}
	if (animation_end())
	{
		image_speed = 0;
	}


	if (vsp > 0)
	{
		
		current_spr = spr.Fall;
		
	}
	else if (vsp < 0)
	{
		current_spr = spr.Jump_1;
		
	}

	if (onground) && (!onwall) && (vsp == 0)
	{
		par_dust(4,true,5);
		current_spr = spr.Land;	
	}


	#endregion;
	break;

	case(spr.Jump_1):
	
	set_state_sprite(spr_player_jump,1.2,0);	
		
      xscale = 0.8;
      yscale = 1.3;
	
	if (animation_end())
	{
		current_spr = spr.Jump_2;	
	}
	
	
	if (vsp > 0)
	{
		current_spr = spr.Fall;	
	}
	
	if (onground) && (!onwall) && (vsp == 0)
	{
		par_dust(4,false,5);
		current_spr = spr.Land;	

	}
	break;
	
	case(spr.Jump_2):
	set_state_sprite(spr_player_jump,1,0);	
	
	if (vsp > 0)
	{
		current_spr = spr.Fall;	
	}
	
	if (onground) && (!onwall) && (vsp == 0)
	{
		par_dust(4,false,5);
		current_spr = spr.Land;	
	}
	break;
	
	case(spr.Fall):
	
	
	set_state_sprite(spr_player_fall,1.5,0);

	if (vsp < 0)
	{
		current_spr = spr.Jump_1;	
	}

	if (onground) && (!onwall) && (vsp == 0)
	{
		par_dust(4,false,5);
		current_spr = spr.Land;	

	}
	
	break;

	case(spr.Land):
	#region sprite land

yscale = 0.7;
xscale = 1.1;

set_state_sprite(spr_player_land, 1.5, 0);

	
if (!onground)
{
	current_spr = spr.Air;	
}




if (animation_end())
{	

	current_spr = spr.Idle;

}

	#endregion;
	break;
	
	case(spr.Sword_1):
	#region sprite sword 1
	
	xscale = 1.1;
	yscale = 0.9;
	set_state_sprite(spr_player_attack_1,1,0);
	if (!onground)
	{
		current_spr = spr.Air;	
	}
	
	
	
	
	
	if animation_end()
	{
		current_spr = spr.Idle;	
	}
	
	#endregion;
	break;
	
	case(spr.Sword_2):
	#region sprite sword 2
	
	xscale = 1.2;
	yscale = 0.8;
	
	set_state_sprite(spr_player_attack_2,1,0);
	
	if (!onground)
	{
		current_spr = spr.Air;	
	}
	

	
	
	if animation_end()
	{
		current_spr = spr.Idle;	
	}
	
	#endregion;
	break;

	case(spr.Sword_Air_D):
	#region sprite sword AD
	
	set_state_sprite(spr_player_attack_sword_down,1,0);

	if animation_end()
	{
		current_spr = spr.Idle;	
	}
	
	if (onground)
	{
		current_spr = spr.Land;
		
	}
	#endregion;
	break;
	
	case(spr.Sword_Air_N):
	#region sprite sword AD
	
xscale = 1.1;
yscale = 0.9;

	if animation_end()
	{
		current_spr = spr.Idle;	
	}
	
	if (onground)
	{
		current_spr = spr.Land;
		
	}
	#endregion;
	break;
	
	case(spr.Sword_Air_U):
	#region sprite sword AU
	
	set_state_sprite(spr_player_attack_sword_up,1.6,0);

	if animation_end()
	{
		current_spr = spr.Idle;	
	}
	
	if (onground)
	{
		current_spr = spr.Land;
		
	}
	#endregion;
	break;
	
	case(spr.Knockback):
	#region sprite knockback
	set_state_sprite(spr_player_hit, 1.5, 0);
	if (animation_end())
	{
		image_speed = 0;	
	}

	#endregion;
	break;
	
	case(spr.Roll):
	#region sprite roll
	
	set_state_sprite(spr_player_roll,1,0);
	
	#endregion
	break;
	
	case(spr.Onwall):
	#region sprite onwall

	set_state_sprite(spr_player_onwall, 1, 0);

	xscale = 1;
	yscale = 1;
	
	if (onwall == 0) || (onground)
	{
		current_spr = spr.Air;	
	}
	
	#endregion;
	break;
	
	case(spr.Parry):
	set_state_sprite(spr_player_parry,1,0);
	
	break;
}	

#endregion;








//Checks if object/creature is hit and adds some kickback
Xkickback = approach(Xkickback, 0, 0.1);
if (hitObject)
{
	
	if (Xkickback != 0)
	{
	hsp = Xkickback;
	}
	else
	{
		hitObject = false;	
	}
}





//Helps reset buffer timer
if (onground)
{
	OngroundRemeber = 7;
	landed = true;
}

//Checks if the player has been smacked
if (hit == true)
{
	state = State.Knockback;
	screenshake(1,3);

}
counter++;


