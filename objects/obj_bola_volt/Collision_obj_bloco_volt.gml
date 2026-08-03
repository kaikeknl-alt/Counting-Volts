if(volts < other.volt_min){
    other.estado_menos_volt();
    instance_destroy();
}else if(volts = other.volt_min){
    other.estado_carregado();
    instance_destroy();
}else if(volts > other.volt_min){
    other.estado_pifado();
    instance_destroy();
}