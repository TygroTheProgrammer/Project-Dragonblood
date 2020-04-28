/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event


event_inherited();

switch (state)
{
case (State.Fly):
#region State Fly
if (!instance_exists(obj_player))
{
	exit;	
}
var facing = sign(obj_player.x - x) 
var facing2 = sign(obj_player.y - y) 
if (facing == 0)
{
	facing = 1;	
}


direction_facing = facing;
hsp = movement_speed * direction_facing;
vsp = movement_speed * facing2;
#endregion
break;
case (State.Knockback):
set_state_foe_knockback()
break;
}

show_debug_message(vsp);