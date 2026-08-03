#region GLOBAIS
global.debug = false;
#endregion
#region FUNÇOES
function sendo_destruindo(_particula = obj_particula_inimigo){
	instance_destroy();
	//criando minha particula
	instance_create_layer(x,y,"particula",_particula);
}

function inicia_efeito_branco(){
	tomei_dano = false;
}
function timer_efeito_branco(_tempo = 1){
	tomei_dano = _tempo;
}
function contador_efeito_branco(){
	if(tomei_dano > 0){
		tomei_dano--;
	}
}

function desenha_efeito_branco(_funcao_desenho){
	if(tomei_dano){
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	}else{
		_funcao_desenho();
	}
}

function efeito_som(_som = snd_explosao, _variacao = 0.1){
	var _pitch = random_range(1 - _variacao, 1 + _variacao );
	audio_play_sound(_som, 0, 0, , , _pitch);
}
#endregion