event_inherited();
set_state_sprite(spr_proto_idle,0.7,0);




wait = 0;
//Setup Shader
outline_init();

hsp = 0;
vsp = 0;
movement_speed = 0.7;
maxSpeed = movement_speed;
acc = 0.05;


attack_range = 38;

Idlegrv = 0.15;
grv = Idlegrv;


flash = 0;


hitRemeber = false;

state = State.Stop;