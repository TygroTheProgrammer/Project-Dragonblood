hitRemeber = false;

xscaleFinal = xscale * direction_facing;
xscale = lerp(xscale, 1, 0.2);
yscale = lerp(yscale, 1, 0.2);

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




