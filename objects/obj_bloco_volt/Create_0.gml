estado = noone;

sofri_carga = false;

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




estado_normal = function(){
    sofri_carga = false;
}

estado_pifado = function(){
    efeito_som(snd_pifado, 0);
    sofri_carga = true;
    instance_create_layer(x, y, layer, obj_bloco_volt_pifado);
    instance_destroy();
}

estado_menos_volt = function(){
    efeito_som(snd_descarregado, 0);
    sofri_carga = true;
    
    estado = estado_normal;
}

estado_carregado = function(){
    efeito_som(snd_carregado, 0);
    sofri_carga = true;
    estado = estado_saindo_carregado;
}

estado_saindo_carregado = function(){
    y+=0.5;
    if(y = ystart + 16){
       if(place_meeting(x, y, obj_bloco)){
           instance_destroy();
       }
    }
}

estado = estado_normal;