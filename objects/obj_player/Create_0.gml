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
//variavel de controle
chao = false;

#region METODOS

pega_inputs = function(){
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_space);
}

checa_chao = function(){
    chao = place_meeting(x, y + 1, obj_bloco);
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
    move_and_collide(velh, 0, obj_bloco, 4);
    move_and_collide(0, velv, obj_bloco, 12);
}

troca_sprite = function(_sprite){
    if(sprite_index != _sprite){
        sprite_index = _sprite;
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