
if (creator != other.creator) && (creator.faction != other.creator.faction)
{
freeze(50);
screenshake(5,5);
creator.Xkickback = 1 * -creator.image_xscale;
creator.Ykickback = Ykickback;
creator.hitObject = true;
instance_destroy();
}
