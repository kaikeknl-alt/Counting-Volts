estado = noone

velv = 0;
max_velv = 1;
velh = 0;
grav = 0.1;
//inputs
right = false;
left = false;
jump = false;

#region METODOS

pega_inputs = function(){
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_space);
}

checa_chao = function(){
    
}

aplica_velocidade = function(){
    
}

#endregion

#region ESTADOS

#endregion