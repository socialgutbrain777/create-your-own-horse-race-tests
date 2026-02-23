/// @description controlled step event
acceleration = clamp(acceleration+accelerationamount,0,maxacceleration)
overtimeacceleration = clamp(overtimeacceleration+overtimeaccelerationamount,0,overtimemaxacceleration)
func_updatespeed()
func_move_towards_point_alt(targetangle,currentmovespeed)
func_outofboundsmeasure()

var _collidables = [obj_mapparent,obj_collectibleparent]
//move_and_collide(hsp,vsp,_collidables)
func_collide(_collidables)

if stepsoundcooldown > 0
	stepsoundcooldown--

if place_meeting(x,y,obj_mapparent)
{
	func_anticollisionmeasure(obj_mapparent)
}
if place_meeting(x,y,obj_collectibleparent)
{
	func_anticollisionmeasure(obj_collectibleparent)
}

if func_placemeetingpath(x+hsp,y+vsp,obj_mapparent)
{
	var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_mapparent)
	func_performknockback(_collidingobject)
}
if func_placemeetingpath(x+hsp,y+vsp,obj_collectibleparent)
{
	var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_collectibleparent)
	func_performknockback(_collidingobject)
}

if place_meeting(x,y,obj_horseparent)
{
	if object_index == obj_collectible_ptty
	{
		audio_play_sound(sfx_flee,10,false)
		var _fleeobj = instance_create_depth(x,y,1,obj_coward)
		_fleeobj.image_xscale = sign(image_xscale)*-1
		_fleeobj.image_yscale = sign(image_yscale)
		instance_destroy()
	}
	else
	{
		audio_play_sound(sfx_eat,10,false)
		global.COLLECTIBLE++
		instance_destroy()
	}
}
targetangle = func_fixangle(targetangle)
targetangle = round(targetangle)
eyeframe = round(targetangle/22.5)
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






