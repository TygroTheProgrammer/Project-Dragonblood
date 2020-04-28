



if (instance_exists(creator))
{
x = creator.x;
y = creator.y;
image_xscale = creator.direction_facing;
}
else
{
	exit;	
}

if (creator.state != State.Parry)
{
	
	instance_destroy(self);
}






if (!instance_exists(creator)) || ds_list_find_index(parried_objects, other) || (other.creator == creator)
{	
	exit;


}	


var parry = instance_place(x,y,obj_hitbox);

if (parry)
{
	if (!creator.hitObject)
	{

	}
}