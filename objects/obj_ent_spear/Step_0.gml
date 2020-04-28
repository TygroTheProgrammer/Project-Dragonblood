event_inherited();
if (!instance_exists(obj_player)) exit;
distance_to_player = point_distance(x,y,obj_player.x, obj_player.y);

hitRember = false;
switch(state)
{
	case (State.Chase):
	#region state chase
	
	set_state_sprite(spr_ent_spear_walk, 0.7, random_range(0,2));

	
	
	direction_facing = sign(obj_player.x - x);
	if (direction_facing == 0)
	{
		direction_facing = 1;	
	}
	
		
	if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,obj_wall))
	{
		
		direction_facing = -direction_facing;
	}
	
	if (place_meeting(x+hsp,y,obj_wall)) && (!place_meeting(x+hsp,y+1,obj_long_slope)) && (grounded)
	{
		direction_facing = -direction_facing;	
	}
	
	
	if (distance_to_player <= attack_range)
	{
		state = State.Attack;
		hsp = 0;
		canMove = false;
	}
	else
	{
		all_movement();

	}
	
	if (distance_to_player >= attack_range * 3)
	{
		state = State.Wander;
	}
	
	
	#endregion;
	break;

	case (State.Attack):
	#region state attack
	set_state_sprite(spr_ent_spear_attack,0.9, 0)
	


	if (hit == false)
	{
		hsp = approach(hsp, 0, acc);	
	}


	
	if (animation_end())
	{
		state = State.Chase;	
	}
	
	if (animation_hit_frame(3))
	{
		create_hitbox(x,y,self,spr_ent_attack_hitbox, 2, 20, 1, direction_facing, false, 2, 0, 0,0,0,0);
	}
	
	#endregion;
	break;
	
	case (State.Stop):
	#region state stop
	all_movement();
	set_state_sprite(spr_ent_spear_idle,0.7,0);
	
	hsp = 0;

	if (distance_to_player <= attack_range)
	{
		state = State.Chase;
	}
	
	
	wait = approach(wait,0,1);
	
	if (wait == 0)
	{
		direction_facing = -direction_facing;
		state = State.Wander;
		done = 5 * game_get_speed(gamespeed_fps);;
	}
	#endregion;
	break;
	
	case (State.Wander):
	#region state wander
	all_movement();
	

		if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,obj_wall)) && (!place_meeting(x+(hsp*2),y+2,obj_long_slope))
		{
		
			direction_facing = -direction_facing;
		}

	if (distance_to_player <= attack_range)
	{
		state = State.Chase;

	}
	
	
	randomize();
	
	
	
	done = approach(done, 0, 1);

	set_state_sprite(spr_ent_spear_walk,0.7,0);

	
	if (place_meeting(x+hsp,y,obj_wall)) && (!place_meeting(x+hsp,y,obj_long_slope)) && (grounded)
	{
		direction_facing = -direction_facing;	
	}
	
	
	hsp = movement_speed * direction_facing;
	if (done == 0)
	{
		wait = 2 * game_get_speed(gamespeed_fps);
		state = State.Stop;	
	}
	#endregion
	break;
	
	case (State.Stun):
	#region state stun
	set_state_sprite(spr_ent_spear_idle,1,0);
	hsp = hkb;
	vsp = -vkb;
	vkb = approach(vkb, 0, 0.1);
	hkb = approach(hkb, 0, 0.1);
	if (hkb == 0)
	{
		hit = false;
	}	
	else
	{
		//direction_facing = -sign(hkb);	
	}	
	#endregion
	break;
	
	default:
	state = State.Stop;
	break;
}
//Gravity
var grv_final = grv;

vsp += grv_final;
vsp = clamp(vsp, -10, 10);

collide();


if (hit == true)
{

	state = State.Stun;	
}

if (!place_meeting(x,y+1,obj_wall))
{
	grounded = false;
}
else grounded = true;

