//meu menu vai ter as pçoes :
//jogar
//tutorial
//sair
//criando um array pras opçoes
menu = ["JOGAR","TUTORIAL","SAIR"];
atual = 0;
margem = 40;

controla_menu = function(){
	//sempre que eu apertar a setinha pra baixo eu desso no menu
	if(keyboard_check_pressed(vk_down)){
		atual += 1;
		efeito_som(snd_twotone, 0);
		margem = 0;
	}
	//quando apertar a seta pra cima, diminuir
	if(keyboard_check_pressed(vk_up)){
		atual -= 1;
		efeito_som(snd_twotone, 0);
		margem = 0;
	}
	//limitando meu menu
	atual = clamp(atual, 0, array_length(menu) - 1);
	margem = lerp(margem, 40, .1);
	//o CLAMP e um limitador
	//o array_lenght() começa a cpntar do 1, mas as posiçoes no array começao do 0,
	//por isso do menos um, fazendo que ele so possa atingir a posiçao 2(posiçao maxima no array(menu))
	
	//checando se a pessoa aperto enter
	if(keyboard_check_pressed(vk_enter)){
		ativa_menu();
	}
}

ativa_menu = function(){
	//fazendo o menu funcionar
	switch(atual){
		//jogar
		case 0:
		  
		break;
		//tutorial
		case 1:
		  room_goto(rm_tutorial);
		break;
		//sair
		case 2:
			//fechando o jogo
			game_end();
		
		break;
	}
}

desenha_menu = function(){
	//pegando as dimensoes da tela
	//colocando o texto no meio da tela
	var _meio_t = display_get_gui_height() / 2;
	//alinahndo o texto
	draw_set_valign(1)
	draw_set_font(fnt_menu);
	//pegando a altura da fonte
	var _alt = string_height("I")
	//desenhando a opçao de jogar no meu menu
	//usando um laço de repetiçao pra desenhar todas as opçoes
	//LAÇO DE REPETIÇAO ->FOR<- USA UM INDECE, UMA CONDIÇAO DE REPETIÇAO E UMA AÇAO
	//meu indice começa como zero, minha condiçao eee enquanto o I for menor que tres
	//ao repetir ele vai  aumentar o valor do I
	for(var i = 0; i < array_length(menu); i++){
		var _cor = c_white;
		var _marg = 0;
		//vou avisar que inha opçao atual fica vermelha
		//checando se o i e igual a minha opçao atual
		if(i == atual){
			_cor = c_red;
			//o atual tem uma margem maior
			_marg = margem;
		}
		//desenhando o texto de acordo com meu I
		draw_set_color(_cor);
		draw_text(20 + _marg,_meio_t + i * _alt * 1.1,menu[i]);
		draw_set_color(-1);
	}
	//resete do alinhamento
	draw_set_font(-1);
	draw_set_valign(-1);
}