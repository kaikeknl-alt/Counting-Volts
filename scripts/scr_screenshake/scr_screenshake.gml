// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake(_treme = 1){
	//checando a esxitencia do screenshake
	if(instance_exists(obj_screenshake)){
		//checando se o valor de treme é maior do que o trme do
		//objeto screenshake
		with(obj_screenshake){
			//se meu trme novo é amior que meu trme atual 
			//eu irei mudar o valor 
			if(_treme > treme){
				//alterando o valor do treme
				treme = _treme;
			}
		}
	}
}

