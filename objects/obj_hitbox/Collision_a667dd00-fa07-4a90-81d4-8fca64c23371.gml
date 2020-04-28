var parry = instance_place(x,y,obj_parry_hitbox)
	
	
	if (!instance_exists(creator)) || creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || other.faction == creator.faction || (other.hitRemeber == true) || (other.invincible == true) || (parried == true) || ((parry) && (parry.creator != creator)) 
	{	
		exit;
	}

		damage_cooldown = 10;
		ds_list_add(hit_objects, other);

		damage(other,wounds,knockback * image_xscale,vkb,stun);
		
		if (!creator.hitObject)
		{
			creator.Xkickback = Xkickback * -creator.direction_facing;
			if (Ykickback != 0)
			{
				creator.vsp = -Ykickback;
			}
			creator.hitObject = true;
		}

		if (impactDelay == 0)
		{
		freeze(freeze_length);
		screenshake(shake_mag, shake_leng);
		impactDelay = 5;
		}
		impactDelay = approach(impactDelay, 0, 1);

		other.state = State.Knockback;
	
		other.hitRemeber = true;

		other.xscale = 0.5;
		other.yscale = 1.5;
		repeat (4) par_blood(other.x,other.y,random_range(1,3),random_range(-3,-5), 0.2,90 - (90 * sign(creator.direction_facing)) + (random_range(0,50) * creator.direction_facing));
		