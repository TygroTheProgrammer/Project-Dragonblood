outline_start(1,c_black, sprite_index, 4, 0);
draw_self();
outline_end();

if (flash > 0)
{
flash--;
shader_set(sh_hitflash);
draw_self();
shader_reset();
}