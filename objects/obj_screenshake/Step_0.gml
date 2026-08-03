//tremendo a tela
//alterando a posiçao x e y do viewport com base no valor do trem
if(treme != 0){
	var _x = random_range(-treme,treme);
	var _y = random_range(-treme,treme);
	//alterando a posiçao do viewport
	view_set_xport(view_current, _x);
	view_set_yport(view_current, _y);
}else{//cheguei perto de zero o valor de trem vira zero
	treme = 0;
	//garanto que a posiçao da view zero tambem
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}

//parando de tremer de poucoquinho em pouquinho
treme = lerp(treme, 0, .1);