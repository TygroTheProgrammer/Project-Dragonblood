///@arg number
///@arg add_move
///@arg delay
var number = argument0;
var add_move = argument1;
var par_delay = argument2;

repeat(argument0)
{
			var xx = x + random_range(-8,6);
			var yy = y + random_range(12, 12);
			var obj = instance_create_layer(xx,yy,"Particles",obj_dust);
			obj.add_movement = argument1;
			obj.delay = argument2;
}