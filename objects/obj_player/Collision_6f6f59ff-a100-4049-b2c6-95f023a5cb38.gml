
var dir = 0;
if (other.hsp != 0)
{
	dir = sign(other.hsp);	
}
else
{
	dir = sign(x - other.x);	
}

//Adds hit effects if touching an foe
if (hitRemeber == false) && (invincible == false)
{

damage(self, other.touch_damage, 3 * dir, 2, 0);

hitRemeber = true;
}



