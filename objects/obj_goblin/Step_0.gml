/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (!instance_exists(obj_player))
{
	exit;	
}

var face_player = sign(obj_player.x - x) 
switch (state)
{
	case (State.Idle):
	#region state idle

	set_state_sprite(spr_goblin_idle,1,0);
	
		hsp = 0;

		if (distance_to_object(obj_player) < 20) || ((sign(direction_facing) == face_player) && (distance_to_object(obj_player) < 100))
		{
			set_state_sprite(spr_goblin_alert,1,0);
			state = State.Alert;
		}
	
	#endregion
	break;
	case (State.Alert):
	#region

	if (animation_end())
	{
		state = State.Chase;
	}
	
	#endregion
	break;
	case (State.Chase):
	#region state chase

		set_state_sprite(spr_goblin_run,1,0);
		if (face_player == 0)
		{
			face_player = -obj_player.image_xscale;
			
		}
		
		if (direction_facing != face_player)
		{
			hsp = approach(hsp, 0, 0.1);
			if (hsp == 0)
			{
				state = State.Turning;
			}
		}
		else
		{
		

			hsp = direction_facing * movement_speed;
		
			if (distance_to_object(obj_player) > 100)
			{
				state = State.Idle;
			}
		
		}
	#endregion;
	break;
	case (State.Turning):
	#region
	hsp = 0;
	set_state_sprite(spr_goblin_turn,1,0);
	if (animation_end())
	{
		set_state_sprite(spr_goblin_run,1,0);
		state = State.Chase;
		direction_facing = face_player;
	}
	#endregion
	break;

	case (State.Knockback):
	#region state knockback
	set_state_sprite(spr_goblin_hit, 0, 0);

	if (hsp == 0)
	{
		set_state_sprite(spr_goblin_run,1,0);
		state = State.Chase;
	}	

	vsp = approach(vsp, 0, 0.1);
	hsp = approach(hsp, 0, 0.1);
	direction_facing = -sign(hsp);		


	
	
	#endregion;
	break;

	default: state = State.Chase;
}

if (hit == true)
{
	state = State.Knockback;	
}

