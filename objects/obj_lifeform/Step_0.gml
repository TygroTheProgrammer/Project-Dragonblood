onground = place_meeting(x,y+1,obj_wall);
hitRemeber = false;

image_xscale = xscale * direction_facing;
image_yscale = yscale;
xscale = lerp(xscale, 1, 0.05);
yscale = lerp(yscale, 1, 0.05);


if (solidCreature == true)
{
collide();
}
else
{
	x = x + hsp;
	y = y + vsp;
}

if (!instance_exists(obj_player))
{
	exit;	
}


if (affectedByGravity == true)
{
	var grv_final = grv;
	vsp += grv_final;
	vsp = clamp(vsp, -10, 10);
}

