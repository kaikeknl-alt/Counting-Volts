estado = noone

velv = 0;
velh = 0;
max_velh = 1;
max_velv = 4;
grav = 0.2;
altura_pulo = 3;
//inputs
right = false;
left = false;
jump = false;
clone = false;
bola_volt = false;
//variavel de controle
chao = false;
colisao = [obj_bloco, obj_clonevolt];

#region METODOS

pega_inputs = function(){
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_space);
    clone = keyboard_check_pressed(ord("J"));
    bola_volt = keyboard_check_pressed(ord("K"));
}

checa_chao = function(){
    chao = place_meeting(x, y + 1, colisao);
}

aplica_velocidade = function(){
    checa_chao();
    
     velh = (right - left) * max_velh;
    
    if(!chao){
        velv += grav;
        
    }else{
        velv = 0;
        
         y = round(y)
        
        if(jump){
            velv-=altura_pulo;
        }
    }
    
    velv = clamp(velv, -max_velv, max_velv);
}

movimento = function(){
    move_and_collide(velh, 0, colisao, 4);
    move_and_collide(0, velv, colisao, 12);
}

troca_sprite = function(_sprite){
    if(sprite_index != _sprite){
        sprite_index = _sprite;
    }
}

checando_clonevolt = function(){
   if(!array_contains(colisao, obj_clonevolt)){
        if(!place_meeting(x, y, obj_clonevolt)){
            array_push(colisao, obj_clonevolt);
        }
    }
}

#endregion

#region ESTADOS

estado_idle = function(){
    aplica_velocidade();
    
    troca_sprite(spr_player_idle);
    
    if(right or left) estado = estado_movendo;
        
    if(jump){
        estado = estado_pulo;
    }
    
    if(!chao){
        estado = estado_pulo;
    }
    
    if(bola_volt){
        var _bola = instance_create_layer(x, y - 4, layer, obj_bola_volt);
        _bola.direction = direction;
        _bola.volts = 2;
        _bola.speed = 0.5;
    }
    
    if(clone){
        instance_create_layer(x, y, layer, obj_clonevolt);
        
        if(array_contains(colisao, obj_clonevolt)){
            var _id = array_get_index(colisao, obj_clonevolt);
            array_delete(colisao, _id, 1);
        }
        //var _checa_clone = place_meeting(x, y, obj_clonevolt);
        //if(_checa_clone){
            //var _id = array_get_index(colisao, 1);
            //array
        //}
    }
    
}

estado_movendo = function(){
    aplica_velocidade();
    
    troca_sprite(spr_player_walk);
    
    if(velh == 0){
        estado = estado_idle;
    }
    
    if(jump){
        estado = estado_pulo;
    }
    
    if(!chao){
        estado = estado_pulo;
    }
}

estado_pulo = function(){
    aplica_velocidade();
    
    if(velv > 0){
        troca_sprite(spr_player_fall);
    }else if(velv < 0){
        troca_sprite(spr_player_jump);
    }
    
    if(chao){
        estado = estado_idle;
    }
}

#endregion

estado = estado_idle;