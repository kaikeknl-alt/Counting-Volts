alvo = noone;

movendo = function(){
    if(alvo == noone) exit;
        
    y = alvo.y - 10;
    x = alvo.x;
}

explosao = function(){
    repeat(10){
      var _part = instance_create_layer(x, y, layer, obj_particula);
      _part.speed = random_range(1, 3);
      _part.direction = irandom_range(0, 359);
      
      _part.alvo = alvo;
    }
    
}