/// @description controlled step event
acceleration = clamp(acceleration+accelerationamount,-maxacceleration,maxacceleration)
overtimeacceleration = clamp(overtimeacceleration+overtimeaccelerationamount,-overtimemaxacceleration,overtimemaxacceleration)
func_updatespeed()
func_move_towards_point_alt(targetangle,currentmovespeed)
func_outofboundsmeasure()

var _collidables = [obj_mapparent,obj_horseparent]
//move_and_collide(hsp,vsp,_collidables)
func_collide(_collidables)

if stepsoundcooldown > 0
	stepsoundcooldown--
if collidesoundcooldown > 0
	collidesoundcooldown--
	
//if (defaultmovespeed + overtimeacceleration + knockbackrecieved) >= 4
if currentmovespeed-acceleration >= 4 && hasdasheffect == true
{
	if afterimagecooldown >= 10
	{
		var _afterimage = instance_create_depth(x,y,2,obj_dasheffect_afterimage)
		_afterimage.sprite_index = sprite_index
		afterimagecooldown = 0
	}
	else
		afterimagecooldown++
		
	if dashlinecooldown >= 10
	{
		var _dashline = instance_create_depth(random_range(x-10,x+10),random_range(y-10,y+10),1,obj_dasheffect_line)
		_dashline.targetangle = targetangle
		_dashline.lineincrement = currentmovespeed
		_dashline.targethorse = id
		dashlinecooldown = 0
	}
	else
		dashlinecooldown++
}

if place_meeting(x,y,obj_mapparent)
{
	//show_debug_message("stuck inside solid, performing anti collision clip")
	func_anticollisionmeasure(obj_mapparent)
}
if place_meeting(x,y,obj_horseparent)
{
	//show_debug_message("stuck inside horse, performing anti collision clip")
	func_anticollisionmeasure(obj_horseparent)
}
if func_placemeetingpath(x+hsp,y+vsp,obj_mapparent)
{
	//var _collidingobject = instance_place(x+hsp,y+vsp,obj_mapparent)
	var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_mapparent)
	func_performknockback(_collidingobject)
}

if func_placemeetingpath(x+hsp,y+vsp,obj_horseparent)
{
	// _collidingobject = instance_place(x+sign(hsp),y+sign(vsp),obj_horseparent)
	var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_horseparent)
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
		if _targetgoal != noone
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
targetangle = round(targetangle/(360/moveangleincrement))*(360/moveangleincrement)
eyeframe = round(targetangle/(360/eyeframeamount))+firsteyeframe
if eyedirectionsmoveclockwise == true
{
	eyeframe -= firsteyeframe
	var _reversedframe = 0
	if eyeframe != 0
		_reversedframe = eyeframeamount-eyeframe
	eyeframe = _reversedframe+firsteyeframe
	while eyeframe < 0
	{
		eyeframe += eyeframeamount
	}
	while eyeframe >= eyeframeamount
	{
		eyeframe -= eyeframeamount
	}
}
if canxscaleflip == true
{
	if sign(hsp) != 0
	{
		xscalefliptargetdir = sign(hsp)
	}
	xscaleflipdir = median(xscaleflipdir-xscaleflipspeed,xscalefliptargetdir,xscaleflipdir+xscaleflipspeed)
	if xscaleflipdir = xscalefliptargetdir
		image_xscale = xscalefliptargetdir
	image_xscale = xscaleflipdir
}
/*
if targetangle > 90 && targetangle <= 270
{
	spritedirectionfacing = -1
}
else
{
	spritedirectionfacing = 1
}
*/

