estado = noone

velv = 0;
velh = 0;
max_velh = 1;
max_velv = 4;
grav = 0.2;
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
            y -=max_velv;
        }
    }
    
    velv = clamp(velv, -max_velv, max_velv);
}

movimento = function(){
    move_and_collide(velh, 0, obj_bloco, 4);
    move_and_collide(0, velv, obj_bloco, 12);
}

#endregion

#region ESTADOS

#endregion