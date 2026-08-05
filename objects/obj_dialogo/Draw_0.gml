draw_self();

if(!desenha_texto) exit
    
draw_set_font(fnt_dialogo);

var _txt = scribble(texto).starting_format("fnt_dialogo", c_white);

var _marg = 2;
var _x = x - sprite_width/2 + _marg;
var _y = y - sprite_height/2 + _marg;

_txt = _txt.scale(0.1);
_txt = _txt.wrap(sprite_width - _marg * 2 );


_txt.draw(_x, _y, typist);