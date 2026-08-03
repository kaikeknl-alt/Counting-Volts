if(volts < other.volt_min){
    show_message("kkkkk");
}else if(volts = other.volt_min){
    instance_destroy(other);
    instance_destroy();
}else if(volts > other.volt_min){
    show_message("pifei");
}