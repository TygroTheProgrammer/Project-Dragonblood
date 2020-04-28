
outline_start(1,c_black, sprite_index, 4, 0);
draw_sprite_ext(sprite_index, image_index, x, y, xscaleFinal, yscale, image_angle, c_white, image_alpha);
outline_end();


//if (flash > 0)
//{
//flash--;
//shader_set(sh_hitflash);
//draw_self();
//shader_reset();
//}