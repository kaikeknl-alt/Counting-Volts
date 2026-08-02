timer--;

if(timer <= 0){
    if(!instance_place(x, y, obj_clonevolt)){
        instance_destroy();
    }
}else if(timer > 0){
    if(instance_place(x, y, obj_clonevolt)){
        timer = 120;
    }
}

speed = clamp(speed, -speed_max, speed_max);