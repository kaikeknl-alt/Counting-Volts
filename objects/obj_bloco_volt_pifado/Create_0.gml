estado = noone;

trova_sprite = function(_sprite){
    if(sprite_index != _sprite){
        sprite_index = _sprite;
    }
}

estado_normal = function(){
    
}

estado_pifado = function(){
    efeito_som(snd_pifado, 0);
}

estado_menos_volt = function(){
    efeito_som(snd_descarregado, 0);
    
    estado = estado_normal;
}

estado_carregado = function(){
    efeito_som(snd_carregado, 0);
}

estado = estado_normal;