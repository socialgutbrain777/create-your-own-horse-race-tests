/// @description controlled step event
if disappearing == false
{
	func_move_towards_point_alt(percievedangle,currentmovespeed+acceleration)
	grav = median(grav-gravamount,maxgrav,grav+gravamount)
	vsp += grav
	targetangle = point_direction(x,y,x+hsp,y+vsp)

	var _collidables = [obj_mapparent,obj_horseparent]
	//move_and_collide(hsp,vsp,_collidables)
	func_collide(_collidables)

	/*
	if targetangle < 90 || targetangle > 270
	{
		gravdirection = -1
	}
	else
	{
		gravdirection = 1
	}

	targetangle = median(targetangle-gravangleamount,270,targetangle+gravangleamount)
	targetangle = clamp(targetangle+(gravangleamount*gravdirection),-180,270)
	targetangle += gravangleamount*gravdirection
	*/

	if place_meeting(x,y,obj_mapparent)
	{
		func_anticollisionmeasure(obj_mapparent)
	}
	if place_meeting(x,y,obj_horseparent)
	{
		func_anticollisionmeasure(obj_horseparent)
	}
	if func_placemeetingpath(x+hsp,y+vsp,obj_mapparent)
	{
		var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_mapparent)
		func_performknockback(_collidingobject)
		//func_surfacebounce()
		grav = 0
		acceleration = 0
		percievedangle = targetangle
	}
	if func_placemeetingpath(x+hsp,y+vsp,obj_horseparent)
	{
		var _collidingobject = func_instanceplacepath(x+hsp,y+vsp,obj_horseparent)
		/*
		if room == rm_open && _collidingobject.object_index == obj_horse_pink
		{
			var _funnysound = audio_play_sound(sfx_stompfunny1,10,false)
			audio_sound_pitch(_funnysound,random_range(0.8,1.2))
			instance_destroy()
			return;
		}
		*/
		func_performknockback(_collidingobject)
		//func_surfacebounce(true)
		grav = 0
		acceleration = 0
		percievedangle = targetangle
	}
	if place_meeting(x,y,obj_pinballremover)
	{
		//instance_destroy()
		var _pinballremover = instance_place(x,y,obj_pinballremover)
		mask_index = spr_null
		disappearx = _pinballremover.x
		disappeary = _pinballremover.y
		disappearing = true
	}
	if image_xscale < 1
		image_xscale += 0.05
	if image_yscale < 1
		image_yscale += 0.05
}
else
{
	x = median(x-(currentmovespeed/2),disappearx,x+(currentmovespeed/2))
	y = median(y-(currentmovespeed/2),disappeary,y+(currentmovespeed/2))
	if image_xscale > 0
		image_xscale -= 0.05
	if image_yscale > 0
		image_yscale -= 0.05
}
if image_xscale <= 0 || image_yscale <= 0
	instance_destroy()
if y > room_height + 64
	instance_destroy()
	
targetangle = func_fixangle(targetangle)
targetangle = round(targetangle)
