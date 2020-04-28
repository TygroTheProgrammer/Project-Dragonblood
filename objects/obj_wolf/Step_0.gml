
switch(state)
{
	case (State.Chase):
	#region state chase
	
	set_state_sprite(spr_wolf_idle, 0.5, 0);
	if (!instance_exists(obj_player)) exit;
	
	image_xscale = sign(obj_player.x - x);
	if (image_xscale == 0)
	{
		image_xscale = 1;	
	}
	
	var distance_to_player = point_distance(x,y,obj_player.x, obj_player.y);
	
	if (distance_to_player <= attack_range)
	{
		state = State.Attack;
		hsp = 0;
	}
	else
	{
		all_movement();

	}
	
	#endregion;
	break;

	case (State.Attack):
	#region state attack
	set_state_sprite(spr_wolf_attack,1, 0)
	
	if (animation_end())
	{
		state = State.Chase;	
	}
	
	if (animation_hit_frame(6))
	{
		create_hitbox(x,y,self,spr_hitbox_sword_3, 1, 13, 1, image_xscale, false, 1, 0, 0,0,0,0);
	}
	
	#endregion;
	break;
	
	case (State.Knockback):
	#region state knockback
	set_state_sprite(spr_wolf_idle, 0, 0);
	hsp = hkb;
	hkb = approach(hkb, 0, 0.5);
	if (hkb == 0)
	{
		hkb = 0;
		state = State.Chase;
	}
	
	if (place_meeting(x+hkb,y,obj_wall))
	{
		hsp = 1.5 * -image_xscale;
	}

	#endregion
	break;
}
//Gravity
var grv_final = grv;

vsp += grv_final;
vsp = clamp(vsp, -10, 10);

collide();




