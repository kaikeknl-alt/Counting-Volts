estado = noone;

//ps_porta_abrindo
ps = part_system_create();
part_system_draw_order(ps, true);

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_smoke);
part_type_size(ptype1, 1, 1, 0.001, 0);
part_type_scale(ptype1, 0.3, 0.2);
part_type_speed(ptype1, 0.1, 0.1, 0.01, 0);
part_type_direction(ptype1, 2, 193, 0, 0);
part_type_gravity(ptype1, 0, 270);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $B2B2B2, $CCCCCC, $E5E5E5);
part_type_alpha3(ptype1, 1, 0.82, 0.58);
part_type_blend(ptype1, false);
part_type_life(ptype1, 20, 30);


estado_fechada = function(){
    
}

estado_abrindo = function(){
   vspeed = -0.5; 
    screenshake(2);
    x = xstart + random_range(-1, 1);
    
    
    var _x = x + irandom_range(-sprite_width/2, sprite_width/2);
    part_particles_create(ps, _x, ystart + 32, ptype1, 1);
    
    if(y <= ystart - 32){
        estado = estado_aberta;
        
        alarm[0] = 60;
    }
}

estado_aberta = function(){
   vspeed = 0;
    x = xstart;
    
}

estado = estado_fechada;