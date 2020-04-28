	hsp = hkb;
	vsp = -vkb;
	vkb = approach(vkb, 0, 0.1);
	hkb = approach(hkb, 0, 0.1);
	if (hkb == 0)
	{
		hit = false;
		state = default_state;
	}	
	else
	{
		direction_facing = -sign(hkb);	
	}	