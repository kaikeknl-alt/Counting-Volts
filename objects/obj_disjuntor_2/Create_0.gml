estado = noone;

icone = false;

estado_desligado = function(){
    if(instance_place(x, y, obj_player)){
        icone = true;
        if(keyboard_check_pressed(ord("W"))){
            if(alvo_1.estado_pifado and !instance_exists(alvo_2)){
                estado = estado_ligado_1;
            }
               
            
            if(instance_exists(alvo_1)){
               if(alvo_1.estado_pifado and alvo_2.estado_pifado){
                   estado = estado_ligado_2;
               }
                  
               if(alvo_1.estado_normal and alvo_2.estado_pifado){
                   estado = estado_ligado_3;
               }
            }
        }
    }else{
        icone = false;
    }
    
    
    
    
    
}

estado_ligado_1 = function(){
    var _abertura = instance_create_depth(x, y, 1, obj_abre_disjuntor);
    _abertura.destino = destino_1;
    instance_destroy();
}

estado_ligado_2 = function(){
     var _abertura = instance_create_depth(x, y, 1, obj_abre_disjuntor);
    _abertura.destino = destino_2;
}

estado_ligado_3 = function(){
     var _abertura = instance_create_depth(x, y, 1, obj_abre_disjuntor);
    _abertura.destino = destino_3;
}



estado = estado_desligado;