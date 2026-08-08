estado = noone;

sofri_carga = false;

//cores
cor_c = make_colour_rgb(112, 248, 68);
cor_nc = make_colour_rgb(119, 185, 255);
cor_p = make_colour_rgb(255, 53, 53);

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


trova_sprite = function(_sprite){
    if(sprite_index != _sprite){
        sprite_index = _sprite;
    }
}



colidindo_com_bolavolt = function(){
    if(sofri_carga) exit
        
    var _colidi_bola = instance_place(x, y, obj_bola_volt);
    
    if(_colidi_bola){
        if(obj_bola_volt.volts < volt_min){
            instance_destroy(obj_bola_volt);
            estado = estado_menos_volt;
        }else if(obj_bola_volt.volts = volt_min){
            instance_destroy(obj_bola_volt);
            estado = estado_carregado;
        }else if(obj_bola_volt.volts > volt_min){
            instance_destroy(obj_bola_volt);
            estado = estado_pifado;
        }
    }
}

cria_brilho = function(_cor = c_white){
     var _brilho = instance_create_layer(0, 0, "brilho", obj_retangulo_brilho);
    _brilho.image_xscale = _brilho.image_xscale * 5;
    _brilho.image_yscale = _brilho.image_yscale * 5;
    _brilho.image_blend = _cor;
}




estado_normal = function(){
    sofri_carga = false;
}

estado_pifado = function(){
    efeito_som(snd_pifado, 0);
    sofri_carga = true;
    
    cria_brilho(cor_p);
    
     var _pife = instance_create_layer(x, y, layer, obj_bloco_volt_pifado);
    _pife.dir = dir;
    instance_destroy();
}

estado_menos_volt = function(){
    efeito_som(snd_descarregado, 0);
    sofri_carga = true;
    
    cria_brilho(cor_nc);
    
    estado = estado_normal;
}

estado_carregado = function(){
    efeito_som(snd_carregado, 0);
    sofri_carga = true;
    
    cria_brilho(cor_c);
    
    estado = estado_saindo_carregado;
}

estado_saindo_carregado = function(){
    y+=0.5;
    if(y = ystart + 16){
       if(place_meeting(x, y, obj_bloco)){
            part_system_destroy(ps);
           instance_destroy();
       }
    }
}

estado = estado_normal;