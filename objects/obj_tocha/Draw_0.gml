draw_self();

var _esc = random_range(0, 0.01);

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_brilho_tocha, 0, x, y, .3 + _esc, .3 + _esc, 0, c_white, .2);
gpu_set_blendmode(bm_normal);