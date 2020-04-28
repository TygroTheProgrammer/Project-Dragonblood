//Calc Movement
var move = key_right - key_left;


//Right Movement
if (move == 1)
{
	
hsp += acc;
if (hsp >= maxSpeed) hsp = maxSpeed;
	
}
else if (hsp > 0)
{
hsp -= acc;
if (hsp <= 0) hsp = 0;
	
}

//Left Movement
if (move == -1)
{
	
hsp -= acc;
if (hsp <= -maxSpeed) hsp = -maxSpeed;
	
}
else if (hsp < 0)
{
hsp += acc;
if (hsp >= 0) hsp = 0;

}

if (onwall != 0) && (!onground) && (key_jump)
{
	hsp = -onwall * hsp_wall_jump;
	vsp = vsp_wall_jump;

}

//Jumping
JumpPressedRemeber--;
OngroundRemeber--;

if (key_jump)
{
	JumpPressedRemeber = 7;

	if (onground)
	{
		par_dust(4, true, 5);
	}
}

if ((JumpPressedRemeber > 0) && (OngroundRemeber > 0))
{
	vsp = vsp_jump;
	JumpPressedRemeber = 0;
	OngroundRemeber = 0;
}


if (!hitObject) && (vsp < 0) && (!key_jump_held) vsp = max(vsp, 0);



//Flip

if (onwall != 0) && (!onground)
{
	direction_facing = -onwall;
	current_spr = spr.Onwall;
}

else if (move != 0) && (hsp != 0) && (fixedDir == false) && (onwall != -direction_facing) && (Xkickback == 0) 
{
	direction_facing = sign(hsp);
}


