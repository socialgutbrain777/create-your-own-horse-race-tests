/// @description controlled step event
// You can write your code in this editor
if global.GAME_STATE == "normal"
{
	acceleration = clamp(acceleration+accelerationamount,0,maxacceleration)
	overtimeacceleration = clamp(overtimeacceleration+overtimeaccelerationamount,0,overtimemaxacceleration)
	func_updatespeed()
	func_move_towards_point_alt(targetangle,currentmovespeed)
	func_outofboundsmeasure()

	var _collidables = [obj_mapparent]
	//move_and_collide(hsp,vsp,_collidables)
	func_collide(_collidables)

	if stepsoundcooldown > 0
		stepsoundcooldown--

	if place_meeting(x,y,obj_mapparent)
	{
		func_anticollisionmeasure(obj_mapparent)
	}
	if func_placemeetingpath(x+hsp,y+vsp,obj_mapparent)
	{
		var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_mapparent)
		func_performknockback(_collidingobject)
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
	drawx = x
	drawy = y
}
if global.GAME_STATE == "fishintro"
{
	//introx = lerp(introx,x,1/960)
	//introy = lerp(introy,y,1/960)
	drawx = lerp(introx,x,obj_system.introcountdown/960)
	drawy = lerp(introy,y,obj_system.introcountdown/960)
}
if global.GAME_STATE == "fishend"
{
	drawx = lerp(x,obj_fisher.x,clamp(obj_system.outrocountdown/60,0,1))
	drawy = lerp(y,obj_fisher.y,clamp(obj_system.outrocountdown/60,0,1))
}





