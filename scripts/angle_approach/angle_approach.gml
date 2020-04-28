/// @description angle_approach(current, target, turn_speed)
/// @param current
/// @param  target
/// @param  turn_speed
/*
 * Example use (rotate to face towards the cursor):
 * var target_angle = point_direction_facingection(x, y, mouse_x, mouse_y);
 * image_angle = angle_approach(image_angle, target_angle, 4);
 */
var tempdirection_facing;
var angle = argument0;
var target_angle = argument1;
var turn_speed = argument2;
var diff = abs(target_angle-angle);
if (diff > 180)
{
    if (target_angle > 180)
    {
        tempdirection_facing = target_angle - 360;
        if (abs(tempdirection_facing-angle ) > turn_speed)
        {
            angle -= turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
    else
    {
        tempdirection_facing = target_angle + 360;
        if (abs(tempdirection_facing-angle) > turn_speed)
        {
            angle += turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
}
else
{
    if (diff > turn_speed)
    {
        if (target_angle > angle)
        {
            angle += turn_speed;
        }
        else
        {
            angle -= turn_speed;
        }
    }
    else
    {
        angle = target_angle;
    }
}
return angle;
