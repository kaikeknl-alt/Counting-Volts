if(!alvo) exit;
    
if(voltar == false){
    speed -= 0.1;
    
    if(speed <= 0){
        voltar = true;
        
        var _x = alvo.x;
        var _y = alvo.y
        
        var _dir = point_direction(x, y, _x, _y);
        
        direction = _dir;
    }
}else if(voltar == true){
    speed += .2;
    
    var _player = instance_place(x, y, obj_player);
    
    if(_player){
        instance_destroy();
        
        with(_player){
            efeito_mola(random_range(.5, 1.5), random_range(.5, 1.5));
        }
        
        screenshake(1.5);
    }
}