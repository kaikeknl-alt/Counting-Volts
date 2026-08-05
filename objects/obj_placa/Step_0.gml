var _player = instance_place(x, y, obj_player);
if(!instance_exists(caixa)){
   if(_player){
       caixa = instance_create_layer(x, y - 30, "dialogo", obj_dialogo);
       
       caixa.texto = meu_texto;
   }
}

if(instance_exists(caixa)){
    if(!_player){
        caixa.me_destruir = true;
    }
}