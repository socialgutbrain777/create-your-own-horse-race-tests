/// @description Insert description here
// You can write your code in this editor
acceleration = clamp(acceleration+accelerationamount,0,maxacceleration)
overtimeacceleration = clamp(overtimeacceleration+overtimeaccelerationamount,0,overtimemaxacceleration)
func_updatespeed()
func_move_towards_point_alt(targetangle,currentmovespeed)
func_outofboundsmeasure()

var _collidables = [obj_mapparent]
//move_and_collide(hsp,vsp,_collidables)

if teleporting == false
{
	if image_alpha < 1
	{
		image_alpha += teleportlerpspeed
	}
	teleportscandistance += currentmovespeed
	if func_placemeetingalt(x+lengthdir_x(teleportscandistance,targetangle),y+lengthdir_y(teleportscandistance,targetangle),obj_mapparent)
	{
		while func_placemeetingalt(x+lengthdir_x(teleportscandistance,targetangle),y+lengthdir_y(teleportscandistance,targetangle),obj_mapparent)
		{
			teleportscandistance -= 0.5
		}
		teleportx = x+lengthdir_x(teleportscandistance,targetangle)
		teleporty = y+lengthdir_y(teleportscandistance,targetangle)
		if image_alpha >= 1
			teleporting = true
	}
	if func_placemeetingalt(x+lengthdir_x(teleportscandistance,targetangle),y+lengthdir_y(teleportscandistance,targetangle),obj_goal)
	{
		teleportx = x+lengthdir_x(teleportscandistance,targetangle)
		teleporty = y+lengthdir_y(teleportscandistance,targetangle)
		if image_alpha >= 1
			teleporting = true
	}
	if x+lengthdir_x(teleportscandistance,targetangle) < 0 || x+lengthdir_x(teleportscandistance,targetangle) > room_width || y+lengthdir_y(teleportscandistance,targetangle) < 0 || y+lengthdir_y(teleportscandistance,targetangle) > room_height
	{
		teleportx = x+lengthdir_x(teleportscandistance,targetangle)
		teleporty = y+lengthdir_y(teleportscandistance,targetangle)
		if image_alpha >= 1
			teleporting = true
	}
}
else
{
	if image_alpha > 0
	{
		image_alpha -= teleportlerpspeed
	}
	else
	{
		teleportscandistance = 0
		x = teleportx
		y = teleporty
		if func_placemeetingpath(x+hsp,y+vsp,obj_mapparent)
		{
			var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_mapparent)
			func_performknockback(_collidingobject)
		}
		teleporting = false
	}
}

if stepsoundcooldown > 0
	stepsoundcooldown--
if collidesoundcooldown > 0
	collidesoundcooldown--

if place_meeting(x,y,obj_mapparent)
{
	//show_debug_message("stuck inside solid, performing anti collision clip")
	func_anticollisionmeasure(obj_mapparent)
}
if place_meeting(x+hsp,y+vsp,obj_mapparent)
{
	var _collidingobject = instance_place(x+hsp,y+vsp,obj_mapparent)
	func_performknockback(_collidingobject)
}

if place_meeting(x,y,obj_goal) && global.REMAINING_WIN_SLOTS > 0 && global.GAME_STATE = "normal"
{
	if object_index == obj_horse_shitass
	{
		audio_play_sound(sfx_stompfunny1,10,false)
		instance_destroy()
	}
	else
	{
		audio_play_sound(winsound,20,false)
		global.LASTPLAYEDWINSOUND = winsound
		var _wineffect = instance_create_depth(x,y,0,obj_horsewineffect)
		_wineffect.sprite_index = sprite_index
		global.REMAINING_WIN_SLOTS--
		if global.REMAINING_WIN_SLOTS <= 0 
		{
			if array_length(global.WINNERS_LIST) > 0
				audio_play_sound(sfx_gong,20,false)
			global.GAME_STATE = "raceend"
		}
		if array_length(global.WINNERS_LIST) <= 0
			global.WINJINGLE = winjingle
		array_insert(global.WINNERS_LIST,array_length(global.WINNERS_LIST),horseidentity)
		var _winninghorse = instance_create_depth(x,y,0,obj_winninghorse)
		_winninghorse.sprite_index = winsprite
		_winninghorse.winplacement = array_length(global.WINNERS_LIST)
		_winninghorse.hsp = clamp(hsp,_winninghorse.maxhsp*-1.25,_winninghorse.maxhsp*1.25)
		_winninghorse.vsp = clamp(vsp,_winninghorse.maxvsp*-1.25,_winninghorse.maxvsp*1.25)
		var _targetgoal = instance_place(x,y,obj_goal)
		if _targetgoal != -4
		{
			_winninghorse.targetgoal = _targetgoal
			global.CAM_TARGET_GOAL = _targetgoal
		}
		instance_destroy()
	}
}
if place_meeting(x,y,obj_hook) && global.GAME_STATE = "normal"
{
	if object_index == obj_horse_shitass
	{
		audio_play_sound(sfx_stompfunny1,10,false)
		instance_destroy()
	}
	else
	{
		audio_play_sound(sfx_fisher_icaughtafish,20,false)
		obj_fisher.speechsprite = spr_fisher_speech_icaf
		var _wineffect = instance_create_depth(x,y,1,obj_caughtfish)
		_wineffect.sprite_index = sprite_index
		_wineffect.image_xscale = image_xscale
		_wineffect.image_yscale = image_yscale
		global.GAME_STATE = "fishend"
		array_insert(global.WINNERS_LIST,array_length(global.WINNERS_LIST),horseidentity)
		global.WINSOUND = winsound
		global.WINJINGLE = winjingle
		global.CAM_TARGET_GOAL = _wineffect
		instance_destroy()
	}
}
targetangle = func_fixangle(targetangle)
targetangle = round(targetangle)







