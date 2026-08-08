if(instance_place(x - 1, y, obj_player)){
    icone = true;
    
    if(keyboard_check_pressed(ord("W"))){
        if(instance_exists(obj_cajado)){
            instance_destroy(obj_cajado);
        }
        
        
        
    }
}else{
    icone = false;
}