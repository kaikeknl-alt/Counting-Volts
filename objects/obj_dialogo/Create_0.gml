texto = "buldog gordo";
me_destruir = false;
desenha_texto = false;

typist = scribble_typist();
typist.in(0.4, 1);

image_alpha = 0.1;
image_yscale = 0.1;
image_xscale = 2.5;

inicializando = function(){
    image_alpha = lerp(image_alpha, 1, .1);
    image_yscale = lerp(image_yscale, 1, .1);
    
    
    y = lerp(y, ystart - 10, .1);
    
    if(y <= ystart - 9){
        desenha_texto = true;
    }
}

finalizando = function(){
    image_yscale = lerp(image_yscale, 0, .1);
    image_alpha = lerp(image_alpha, 0, .1);
    
    y = lerp(y, ystart, .1);
    
    desenha_texto = false;
    
    if(image_alpha <= 0.01){
        instance_destroy();
    }
}