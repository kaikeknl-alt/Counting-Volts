if(!alvo) exit;
    
image_xscale = lerp(image_xscale, speed * 2.5, 0.1);
image_yscale = lerp(image_yscale, 0.5, 0.1);
image_angle = direction;
    
if(voltar == false){
    speed -= 0.1;
    
    if(speed <= 0){
        voltar = true;
        
        var _x = alvo.x + irandom_range(1, 2);
        var _y = alvo.y + irandom_range(1, 2);
        
        var _dir = point_direction(x, y, _x, _y);
        
        direction = _dir;
    }
}else if(voltar == true){
    speed += .2;
    
    var _player = instance_place(x, y, obj_player);
    
    if(_player){
        instance_destroy();
        
        with(_player){
            var _xscale = random_range(-.3, .3);
            var _yscale = random_range(-.3, .3);
            efeito_mola(1 + _xscale, 1 + _yscale);
        }
        
        screenshake(1.5);
    }
}