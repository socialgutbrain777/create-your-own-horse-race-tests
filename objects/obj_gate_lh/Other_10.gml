/// @description controlled step event
// You can write your code in this editor
if global.GAME_STATE == "normal"
{
	mask_index = spr_null
}
if mask_index == spr_null
{
	/*
	image_xscale -= 0.02
	image_yscale -= 0.02
	*/
	shrinktween += shrinktweenspeed
	image_xscale = lerp(originalxscale,0,shrinktween)
	image_yscale = lerp(originalyscale,0,shrinktween)
}
//if image_xscale <= 0 || image_yscale <= 0
if shrinktween >= 1
	instance_destroy()





