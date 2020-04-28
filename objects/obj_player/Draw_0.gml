

if (hitRemeber = true)
{
	if counter mod 5 = 0
	{

		outline_start(1,c_black, sprite_index, 4, 0);
		draw_sprite_ext(sprite_index, image_index, x, y, xscaleFinal, yscale, image_angle, c_white, image_alpha);
		outline_end();	
	}
	else
	{

		
		outline_start(1,c_black, sprite_index, 4, 0);
		draw_sprite_ext(sprite_index, image_index, x,y,xscaleFinal,yscale,0,c_white,0.25);	
		outline_end();
	}
	
}

else
{


//draw_rectangle(x-11,y,x+8,y-19,c_red);
//outline_start(1,c_black, sprite_index, 4, 0);
draw_sprite_ext(sprite_index, image_index, x, y, xscaleFinal, yscale, image_angle, c_white, image_alpha);
//outline_end();








}