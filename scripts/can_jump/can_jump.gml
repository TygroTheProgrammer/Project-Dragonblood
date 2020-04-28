//Jumping
JumpPressedRemeber--;
OngroundRemeber--;

if (key_jump)
{

	JumpPressedRemeber = 7;

}

if ((JumpPressedRemeber > 0) && (OngroundRemeber > 0))
{
	vsp = vsp_jump;
	JumpPressedRemeber = 0;
	OngroundRemeber = 0;
}


if (vsp < 0) && (!key_jump_held) vsp = max(vsp, 0);