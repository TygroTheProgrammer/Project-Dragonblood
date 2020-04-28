event_inherited();
//switch(state)
//{
//	case (State.Chase):
//	#region state chase
	
//	set_state_sprite(spr_proto_move, 0.5, 0);
//	if (!instance_exists(obj_player)) exit;
	
//	image_xscale = sign(obj_player.x - x);
//	if (image_xscale == 0)
//	{
//		image_xscale = 1;	
//	}
	
	
	
//	var distance_to_player = point_distance(x,y,obj_player.x, obj_player.y);
	
//	if (distance_to_player <= attack_range)
//	{
//		state = State.Attack;
//		hsp = 0;
//		canMove = false;
//	}
//	else
//	{
//		all_movement();

//	}
	
//	#endregion;
//	break;

//	case (State.Attack):
//	#region state attack
//	set_state_sprite(spr_proto_attack,1.2, 0)
	


//	if (hit == false)
//	{
//		hsp = approach(hsp, 0, acc);	
//	}


	
//	if (animation_end())
//	{
//		state = State.Chase;	
//	}
	
//	if (animation_hit_frame(7))
//	{
//		create_hitbox(x,y,self,spr_hitbox_sword_3, 2, 13, 1, image_xscale, false, 2, 0, 0,0,0,0);
//	}
	
//	#endregion;
//	break;
	
//	case (State.Stop):
//	hsp = 0;
	
//	break;
	

//}
////Gravity
//var grv_final = grv;

//vsp += grv_final;
//vsp = clamp(vsp, -10, 10);

//collide();



//if (hit == true)
//{
//	hsp = hkb;
//	vsp = -vkb;
//	vkb = approach(vkb, 0, 0.1);
//	hkb = approach(hkb, 0, 0.1);
//	if (hkb == 0)
//	{
		
//		hit = false;
//	}	
//	else
//	{
//		image_xscale = -sign(hkb);	
//	}

//}

