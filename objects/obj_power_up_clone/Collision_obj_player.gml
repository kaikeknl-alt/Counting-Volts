if(alvo == noone){
    other.pegando_powerup();
    other.clones = clones;
    
    movendo();
    explosao();
    
    alvo = other;
}