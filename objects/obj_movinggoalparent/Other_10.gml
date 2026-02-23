/// @description controlled step event
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
	if collidesoundcooldown > 0
		collidesoundcooldown--
	
	//if (defaultmovespeed + overtimeacceleration + knockbackrecieved) >= 4
	if currentmovespeed-acceleration >= 4  && hasdasheffect == true
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
}
glowangle = func_fixangle(glowangle+glowanglespeed)

