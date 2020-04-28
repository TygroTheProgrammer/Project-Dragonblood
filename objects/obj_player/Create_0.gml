event_inherited();


//Setup Shader
outline_init();

//hp
wounds = 0;


//Running/Walking
hsp = 0;
vsp = 0;
movement_speed = 2;
runsp = 2.1;
maxSpeed = movement_speed;
walkacc = 0.15;

acc = walkacc;

//Jump
vsp_jump = -4;
boost_jump = -6;
JumpPressedRemeber = 0;
OngroundRemeber = 0;
Idlegrv = 0.15;
grv = Idlegrv;
grv_wall = 0.01;
onground = false;
landed = false;
hsp_wall_jump = 3;
vsp_wall_jump = -3;
vsp_max_wall = 4;
yplus = 0;

//Attacking
attack_remember = 0;
last_attack = noone;
hitRemeber = false;
hitObject = false;
impactDelay = 0;


// Misc
airborn = false;
flash = 0;
fixedDir = false;
counter = 0;
faction = "Player";


enum spr
{
	Idle,
	Move,
	Air,
	Jump_1,
	Jump_2,
	Fall,
	Land,
	Sword_1,
	Sword_2,
	Sword_Air_N,
	Sword_Air_D,
	Sword_Air_U,
	Knockback,
	Roll,
	Onwall,
	Parry
}

walking = true;

current_spr = spr.Idle;
state = State.Idle;

//Scaling
xscale = image_xscale;
yscale = image_yscale;
xscaleFinal = xscale * direction_facing;