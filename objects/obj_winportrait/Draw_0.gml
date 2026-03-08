/// @description Insert description here
// You can write your code in this editor
draw_sprite(portraitbgsprite,0,x,y)
draw_sprite(portraitsprite,0,x,y)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(fnt_portrait)

var _targetx = 5
var _targety = 472
var _text = horseidentity
if hasuniquename == true
	_text = winname
	
if patternbicolor == true
{
	func_draw_text_ext_transformed_colour_outline(_targetx,_targety,_text,74,512,textscale,textscale,0,bodycolor,bodycolor1,bodycolor1,bodycolor,1,c_black,2)
}
else
{
	func_draw_text_ext_transformed_outline(_targetx,_targety,_text,74,512,textscale,textscale,0,bodycolor,c_black,2)
}


