/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(coloringsprite,0,x,y,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
if global.OUT_OF_BOUNDS_MEASURE == "wrap"
{
	draw_sprite_ext(coloringsprite,0,x,y+room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x,y-room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x+room_width,y,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x+room_width,y+room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x+room_width,y-room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x-room_width,y,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x-room_width,y+room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
	draw_sprite_ext(coloringsprite,0,x-room_width,y-room_height,image_xscale,image_yscale,image_angle,bodycolor,image_alpha)
}
if patternbicolor == true
{
	draw_sprite_ext(bicolorsprite,0,x,y,image_xscale,image_yscale,image_angle,bodycolor1,image_alpha)
}
draw_sprite_ext(outlinesprite,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
if global.OUT_OF_BOUNDS_MEASURE == "wrap"
{
	draw_sprite_ext(outlinesprite,0,x,y+room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x,y-room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x+room_width,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x+room_width,y+room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x+room_width,y-room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x-room_width,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x-room_width,y+room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(outlinesprite,0,x-room_width,y-room_height,image_xscale,image_yscale,image_angle,c_white,image_alpha)
}