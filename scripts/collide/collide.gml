//sprite_collision_mask()



//Collisions

//Horizontal Collisions
if (place_meeting(x+hsp,y, obj_wall))
{
	yplus = 0;
	while (place_meeting(x+hsp, y-yplus,obj_wall)) && (yplus <= abs(0.75*hsp)) yplus += 1;
	
	if (place_meeting(x+hsp,y-yplus,obj_wall))
	{
	while (!place_meeting(x+sign(hsp),y, obj_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
	}
	else
	{
		y -= yplus;
	}
	
}
x = x + hsp;




//Down slope
if !place_meeting(x,y,obj_wall) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),obj_wall){
    while(!place_meeting(x,y+1,obj_wall)) y += 1;
}




//Vertical Collisions
if (place_meeting(x,y+vsp, obj_wall))
{
	while (!place_meeting(x,y+sign(vsp), obj_wall))
	{
		y = y + sign(vsp);
	}

	vsp = 0;
			
}
y = y + vsp;



