/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_comicsans)
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
if room != rm_mapselection && global.SHOW_TIMER == true
	func_draw_text_ext_transformed_outline(638,479,"Lab Horse\n"+func_gettimestring(true),16,500,1,1,0,c_yellow,c_black,1)
if obj_camera.spectatinghorse != -1
{
	func_draw_text_ext_transformed_outline(638,427,"spectating:",16,500,1,1,0,c_white,c_black,1)
	var _spectatinghorse = instance_find(obj_horseparent,obj_camera.spectatinghorse)
	if _spectatinghorse != noone
	{
		draw_sprite(_spectatinghorse.sprite_index,0,614,447)
	}
}
if obj_camera.spectatingball != -1
{
	func_draw_text_ext_transformed_outline(638,427,"spectating:",16,500,1,1,0,c_white,c_black,1)
	var _spectatingball = instance_find(obj_ball,obj_camera.spectatingball)
	if _spectatingball != noone
	{
		draw_sprite_ext(_spectatingball.coloringsprite,0,614,447,1,1,0,_spectatingball.bodycolor,1)
		draw_sprite(_spectatingball.outlinesprite,0,614,447)
	}
}
if global.GAME_STATE == "paused"
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	func_draw_text_ext_transformed_outline(320,160,"RACE PAUSED",16,500,1,1,0,c_white,c_black,1)
	func_draw_text_ext_transformed_outline(320,240,"click to unpause, esc to map select",16,500,1,1,0,c_white,c_black,1)
}
/*
if global.GAME_STATE == "results" && global.JINGLEFINISHED = true
{
	func_draw_text_ext_transformed_outline(638,479,"press esc to return to map select",16,500,1,1,0,c_white,c_black,1)
}
*/
draw_set_color(c_white)





