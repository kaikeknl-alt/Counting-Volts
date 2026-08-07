image_alpha = lerp(image_alpha, 0, .02);

if(image_alpha <= 0.01){
    instance_destroy();
}