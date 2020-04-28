
//APEARANCE\\
flash = 0;
xscale = 1;
yscale = 1;
flash = 0;

//MOVEMENT\\

//Horizontal Movement
right = 1;
left = -1;
hsp = 0;
acc = 0;
//Vertical Movement
vsp = 0;
grv = 0.15;
//Direction Calc
direction_facing = 1;
xscale = image_xscale;
yscale = image_yscale;
xscaleFinal = xscale * direction_facing;
Xkickback = 0;
Ykickback = 0;
onground = false;
//STATS\\
hp = 5;
hkb = 0;
vkb = 0;
movement_speed = 0;
maxSpeed = 0;
faction = noone;
touch_damage = 1;
touch_knockback = 2;

//Booleans

invincible = false;
affectedByGravity = true;
solidCreature = true;
afraidofheights = true;

//SENSING\\
hitObject = false;
hitRemeber = false;
hit = false;

//STATE\\

enum State
{
	Attack_Air,
	Attack,
	Attack_2,
	Knockback,
	Chase,
	Stop,
	Roll,
	Parry,
	Stun,
	Wander,
	Idle,
	Alert,
	Turning,
	Fly
}
default_state = noone;
state = default_state;