//Gravity
var grv_final = grv;

if (onwall != 0) && (vsp > 0)
{
	grv_final = grv_wall;
	
}
vsp += grv_final;
vsp = clamp(vsp, -10, 6);