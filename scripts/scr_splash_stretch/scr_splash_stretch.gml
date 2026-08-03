// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inicia_efeito_mola(){
	//iniciando a variavel que eu vou usar 
	xscale = 1;
	yscale = 1;
}
//ele vai definir o meu valor de amassar
function efeito_mola(_xscale, _yscale){
	xscale = _xscale;
	yscale = _yscale;
}
function retorna_mola(_qtd = .1){
	xscale = lerp(xscale, 1, _qtd);
	yscale = lerp(yscale,1,_qtd);
}
function desenha_efeito_mola(){
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha);
}