event_inherited();
set_state_sprite(spr_proto_idle,0.7,0);

//Setup Shader
outline_init();

hsp = 0;
vsp = 0;
movement_speed = 0.7;
maxSpeed = movement_speed;
acc = 0.01;


attack_range = 20;

Idlegrv = 0.15;
grv = Idlegrv;


flash = 0;

state = State.Chase;