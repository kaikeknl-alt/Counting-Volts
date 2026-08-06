checa_player();

if(colidi_player){
    icone = true;
    
    with(obj_player){
        if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))){
            cria_transicao_inicia(obj_abre_disjuntor.destino);
        }
    }
}else{
    icone = false;
}