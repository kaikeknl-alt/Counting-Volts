alvo = noone;

movendo = function(){
    if(alvo == noone) exit;
        
    y = alvo.y - 2;
    x = alvo.x;
}

explosao = function(){
    repeat(10){
      var _part = instance_create_layer(x, y, layer, obj_particula);
      _part.speed = 1;
      _part.direction = irandom_range(0, 359);
      
      _part.alvo = alvo;
    }
    
}