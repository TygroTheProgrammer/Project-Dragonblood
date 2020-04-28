event_inherited();
set_state_sprite(spr_proto_idle,0.7,0);
image_xscale = -1;

//Setup Shader
outline_init();

hsp = 0;
vsp = 0;
movement_speed = 0.9;
maxSpeed = movement_speed;
acc = 0.05;


attack_range = 19;

Idlegrv = 0.15;
grv = Idlegrv;


flash = 0;


hitRemeber = false;

state = State.Chase;