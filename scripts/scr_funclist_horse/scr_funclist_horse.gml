function func_updatespeed()
{
	var _newmovespeed = defaultmovespeed+acceleration+overtimeacceleration+knockbackrecieved
	currentmovespeed = clamp(_newmovespeed,0,_newmovespeed)
	//the clamp makes sure that movespeed is never less than 0
}
function func_ballpass(_checkforhorse)
{
	if _checkforhorse.object_index == obj_horseparent || object_get_parent(_checkforhorse.object_index) == obj_horseparent
	{
		currentpass = _checkforhorse.horseidentity
		bodycolor = _checkforhorse.bodycolor
		winsound = _checkforhorse.winsound
		winjingle = _checkforhorse.winjingle
	}
}
function func_performcollision(_checkforhorse=obj_mapparent)
{
	if currentmovespeed != 0 && hasdonecollisionthisframe == false
	{
		//targetangle = point_direction(x,y,x+(hsp*-1),y+vsp)
		//func_getknockbackfromobject(_targetx,_targety,_checkforhorse)
		func_surfacebounce(_checkforhorse)
		if object_index == obj_ball || object_get_parent(object_index) == obj_ball
		{
			func_playstepsound(customstepsound,stepsoundcooldown)
			stepsoundcooldown = 2
			if _checkforhorse.object_index == obj_horseparent || object_get_parent(_checkforhorse.object_index) == obj_horseparent
			{
				func_ballpass(_checkforhorse)
				acceleration = clamp(acceleration+accelerationamount,0,maxacceleration)
			}
			func_updatespeed()
			func_randomdirectionchange()
			hasdonecollisionthisframe = true
		}
		else
		{
			//horse acceleration is reset upon hitting a wall
			acceleration = 0
		}
		if _checkforhorse.object_index == obj_ball || object_get_parent(_checkforhorse.object_index) == obj_ball
		{
			with _checkforhorse
			{
				func_ballpass(other.id)
			}
		}
		if object_index == obj_horseparent || object_get_parent(object_index) == obj_horseparent || object_index == obj_collectibleparent || object_get_parent(object_index) == obj_collectibleparent
		{
			/*
			if _checkforhorse == true
			{
				var _effect = instance_create_depth(x-lengthdir_x(8,targetangle),y-lengthdir_y(8,targetangle),1,obj_animatedeffect)
				//var _effect = instance_create_depth(x-(hsp*2.5),y-(vsp*2.5),1,obj_animatedeffect)
				_effect.sprite_index = spr_effect_bump_hard
				_effect.image_speed = 0.35
				_effect.image_angle = targetangle+180
			}
			*/
			if _checkforhorse == obj_horseparent || object_get_parent(_checkforhorse) == obj_horseparent
			{
				//func_playcollidesound()
				func_playstepsound(customhorsecollidesound,collidesoundcooldown)
				collidesoundcooldown = 4
			}
			else
			{
				func_playstepsound(customstepsound,stepsoundcooldown)
				stepsoundcooldown = 4
			}
			func_randomdirectionchange()
			func_updatespeed()
			hasdonecollisionthisframe = true
		}
	}
	if object_index == obj_horse_brown && (_checkforhorse.object_index == obj_horse_red || _checkforhorse.object_index == obj_horse_pink || _checkforhorse.object_index == obj_horse_nightmare2 || _checkforhorse.object_index == obj_horse_nightmare3)
	{
		var _doorknobsound = audio_play_sound(sfx_doorknobcollide,10,false)
		audio_sound_pitch(_doorknobsound,random_range(0.8,1.2))
		audio_sound_gain(_doorknobsound,random_range(0.25,1),0)
	}
}
function func_randomdirectionchange()
{
	if irandom_range(0,anglechangechance) >= anglechangechance && anglechangechance != -1
	{
		var _incrementdirection = random_range(angleincrementdirectionmin,angleincrementdirectionmax)
		targetangle += angleincrement*_incrementdirection
		//while func_solidcheck(x+lengthdir_x(currentmovespeed,targetangle),y+lengthdir_y(currentmovespeed,targetangle))
		while func_placemeetingalt(x+lengthdir_x(currentmovespeed,targetangle),y+lengthdir_y(currentmovespeed,targetangle),obj_mapparent) &&
		func_placemeetingalt(x+lengthdir_x(currentmovespeed,targetangle),y+lengthdir_y(currentmovespeed,targetangle),obj_horseparent)
		{
			targetangle += angleincrement*_incrementdirection
		}
		/*
		show_debug_message("angle randomized for:")
		show_debug_message(object_get_name(object_index))
		show_debug_message("--------------------")
		*/
	}
}
function func_fixangle(_targetangle)
{
	while _targetangle <= -1
	{
		_targetangle += 360
	}
	while _targetangle >= 360
	{
		_targetangle -= 360
	}
	
	return _targetangle;
}
function func_performknockback(_collidingobject)
{
	//show_debug_message("performing knockback")
	//show_debug_message("initial object:")
	//show_debug_message(object_get_name(object_index))
	//show_debug_message("_collidingobject:")
	//show_debug_message(object_get_name(_collidingobject.object_index))
	knockbackrecieved = 0
	_collidingobject.knockbackrecieved = 0
	var _highspeedobject = noone
	var _otherobject = noone
	var _highspeedobjectfacingtowards = false
	var _otherobjectfacingtowards = false
	var _equalspeed = true
	
	var _checkforhorseforhighspeed = obj_mapparent
	var _checkforhorseforother = obj_mapparent
	
	//if the horse initiating the collision is faster than the object it is colliding with
	if currentmovespeed > _collidingobject.currentmovespeed
	{
		_highspeedobject = id
		_otherobject = _collidingobject
		_equalspeed = false
		//show_debug_message("_highspeedobject:")
		//show_debug_message(object_get_name(_highspeedobject.object_index))
		//show_debug_message("_otherobject:")
		//show_debug_message(object_get_name(_otherobject.object_index))
	}
	//if the horse initiating the collision is slower than the object it is colliding with
	if currentmovespeed < _collidingobject.currentmovespeed
	{
		_highspeedobject = _collidingobject
		_otherobject = id
		_equalspeed = false
		//show_debug_message("_otherobject:")
		//show_debug_message(object_get_name(_otherobject.object_index))
		//show_debug_message("_highspeedobject:")
		//show_debug_message(object_get_name(_highspeedobject.object_index))
	}
	if _highspeedobject != noone && _otherobject != noone
	{
		with _highspeedobject
		{
			if func_placemeetingalt(x+lengthdir_x(currentmovespeed,targetangle),y+lengthdir_y(currentmovespeed,targetangle),_otherobject)
				_highspeedobjectfacingtowards = true
			/*
			if _otherobject.object_index == obj_horseparent || object_get_parent(_otherobject.object_index) == obj_horseparent
				_checkforhorseforhighspeed = true
			*/
			_checkforhorseforhighspeed = _otherobject.object_index
			//show_debug_message("_highspeedobjectfacingtowards:")
			//show_debug_message(_highspeedobjectfacingtowards)
			//show_debug_message("_checkforhorseforhighspeed:")
			//show_debug_message(_checkforhorseforhighspeed)
		}
		with _otherobject
		{
			if func_placemeetingalt(x+lengthdir_x(currentmovespeed,targetangle),y+lengthdir_y(currentmovespeed,targetangle),_highspeedobject)
				_otherobjectfacingtowards = true
			/*
			if _highspeedobject.object_index == obj_horseparent || object_get_parent(_highspeedobject.object_index) == obj_horseparent
				_checkforhorseforother = true
			*/
			_checkforhorseforother = _highspeedobject.object_index
			//show_debug_message("_otherobjectfacingtowards:")
			//show_debug_message(_otherobjectfacingtowards)
			//show_debug_message("_checkforhorseforother:")
			//show_debug_message(_checkforhorseforother)
		}
	}
	
	if _highspeedobjectfacingtowards == true
	{
		var _leftoverspeed = _highspeedobject.currentmovespeed - _otherobject.currentmovespeed
		_otherobject.knockbackrecieved = _leftoverspeed*clamp(_highspeedobject.knockbackintensity-_otherobject.knockbackresistance,0,_highspeedobject.knockbackintensity)
		if _otherobjectfacingtowards == false
			_otherobject.targetangle = _highspeedobject.targetangle
		with _highspeedobject
			func_performcollision(_checkforhorseforhighspeed)
		with _otherobject
			func_performcollision(_checkforhorseforother)
	}
	if _highspeedobjectfacingtowards == false
	{
		if _otherobjectfacingtowards == false
		{
			with _highspeedobject
				func_performcollision(_checkforhorseforhighspeed)
		}
		with _otherobject
			func_performcollision(_checkforhorseforother)
	}
	if _equalspeed == true
	{
		var _checkforhorse = obj_mapparent
		var _checkforhorseforcolliding = obj_mapparent
		
		/*
		if _collidingobject.object_index == obj_horseparent || object_get_parent(_collidingobject.object_index) == obj_horseparent
			_checkforhorse = true
		*/
		_checkforhorse = _collidingobject.object_index
		/*
		if object_index == obj_horseparent || object_get_parent(object_index) == obj_horseparent
			_checkforhorseforcolliding = true
		*/
		_checkforhorseforcolliding = object_index
		func_performcollision(_checkforhorse)
		with _collidingobject
			func_performcollision(_checkforhorseforcolliding)
	}
	//show_debug_message("--------------------")
}
function func_surfacebounce(_objecttocheckfor)
{
	var _angletoadd = 1
	var _checkingoppositeside = 1
	var _collisioncheckloop = true
	
	//show_debug_message("--------------------")
	//show_debug_message(targetangle)
	while _collisioncheckloop == true
	{
		//show_debug_message(_angletoadd)
		//if !place_meeting(x+lengthdir_x(currentmovespeed*8,targetangle+_angletoadd),y+lengthdir_y(currentmovespeed*8,targetangle+_angletoadd),obj_mapparent)
		var _foundcollision = false
		var _howfartocheck = 16
		for (var _m = 0; _m < _howfartocheck; _m++)
		{
			/*
			if (func_solidcheck(x+lengthdir_x(_m,targetangle+_angletoadd),y+lengthdir_y(_m,targetangle+_angletoadd)) && _checkforhorse == false)
			|| (func_placemeetingalt(x+lengthdir_x(_m,targetangle+_angletoadd),y+lengthdir_y(_m,targetangle+_angletoadd),obj_horseparent) && _checkforhorse == true)
			*/
			if func_placemeetingalt(x+lengthdir_x(_m,targetangle+_angletoadd),y+lengthdir_y(_m,targetangle+_angletoadd),_objecttocheckfor)
			{
				_foundcollision = true
				_m = _howfartocheck
				break;
			}
		}
		if _foundcollision == false
		{
			targetangle += (_angletoadd*2)
			if knockbackangle != 0
				targetangle += knockbackangle
			_collisioncheckloop = false
			/*
			if instance_exists(obj_debug_bouncevisualizer)
			with obj_debug_bouncevisualizer
			{
				instance_destroy()
			}
			with instance_create_depth(x,y,0,obj_debug_bouncevisualizer)
			{
				sprite_index = other.sprite_index
				targetangle = other.targetangle - (_angletoadd*2)
				angletoadd = _angletoadd
				currentmovespeed = other.currentmovespeed
			}
			*/
			//show_debug_message("ideal angle found:")
			//show_debug_message(targetangle)
		}
		_angletoadd *= -1
		_checkingoppositeside *= -1
		if _checkingoppositeside == 1
			_angletoadd++
		if abs(_angletoadd) >= 180
		{
			//show_debug_message("failed to find suitable angle, performing anti collision clip")
			//func_anticollisionmeasure(_objecttocheckfor)
			_collisioncheckloop = false
			//break;
		}
	}
}
function func_anticollisionclipping(_objecttocheckfor)
{
	var _distancetoadd = 4
	//var _angletoadd = 1
	var _angletoadd = 180
	var _checkingoppositeside = 1
	var _anticollisioncheckloop = true
	
	while _anticollisioncheckloop == true
	{
		if !func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),y+lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),_objecttocheckfor) &&
		!func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),y+lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),obj_mapparent) &&
		!func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),y+lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)),obj_horseparent) &&
		x+lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)) >= 0 && x+lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)) <= room_width &&
		y+lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)) >= 0 && y+lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside)) <= room_height
		{
			_anticollisioncheckloop = false
			break; //sometimes the loop fails to end without a break???
		}
		if _distancetoadd > (room_width+room_height)*2 //failed to find position within room
		{
			_distancetoadd = 0
			_angletoadd = 0
			_checkingoppositeside = 1
			_anticollisioncheckloop = false
			break; //sometimes the loop fails to end without a break???
		}
		_checkingoppositeside *= -1
		if _checkingoppositeside == 1
		{
			//_angletoadd++
			_angletoadd += 11.25
		}
		//if _angletoadd >= 180
		if _angletoadd >= 360
		{
			_angletoadd = 180
			_distancetoadd += 4
		}
	}
	x += lengthdir_x(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside))
	y += lengthdir_y(_distancetoadd,targetangle+(_angletoadd*_checkingoppositeside))
}
function func_anticollisionclippingcheap(_objecttocheckfor)
{
	var _distancetoadd = 4
	var _anticollisioncheckloop = true
	
	while _anticollisioncheckloop == true
	{
		if !func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+180),y+lengthdir_y(_distancetoadd,targetangle+180),_objecttocheckfor) &&
		!func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+180),y+lengthdir_y(_distancetoadd,targetangle+180),obj_mapparent) &&
		!func_placemeetingalt(x+lengthdir_x(_distancetoadd,targetangle+180),y+lengthdir_y(_distancetoadd,targetangle+180),obj_horseparent)
		{
			_anticollisioncheckloop = false
			break; //sometimes the loop fails to end without a break???
		}
		if _distancetoadd > (room_width+room_height)*2 //failed to find position within room
		{
			_distancetoadd = 0
			_anticollisioncheckloop = false
			break; //sometimes the loop fails to end without a break???
		}
		_distancetoadd += 4
	}
	x += lengthdir_x(_distancetoadd,targetangle+180)
	y += lengthdir_y(_distancetoadd,targetangle+180)
}
function func_anticollisionmeasure(_objecttocheckfor)
{
	switch global.ANTI_COLLISION_MEASURE
	{
		case "cheap":
		{
			func_anticollisionclippingcheap(_objecttocheckfor)
		}
		break
		case "expensive":
		{
			func_anticollisionclipping(_objecttocheckfor)
		}
		break
	}
}
function func_outofboundsmeasure()
{
	if x < 0 || x > room_width || y < 0 || y > room_height
	{
		switch global.OUT_OF_BOUNDS_MEASURE
		{
			case "respawn":
			{
				x = xstart
				y = ystart
				audio_play_sound(sfx_failure,10,false)
			}
			break
			case "wrap":
			{
				while x < 0
				{
					x += room_width
				}
				while x > room_width
				{
					x -= room_width
				}
				while y < 0
				{
					y += room_height
				}
				while y > room_height
				{
					y -= room_height
				}
			}
			break
		}
	}
}
function func_playstepsound(_sound,_cooldown)
{
	/*
	if global.STEPSOUND_PLAYEDTHISFRAME == -1 && stepsoundcooldown <= 0
	{
		if global.STEPSOUND != -1
			audio_stop_sound(global.STEPSOUND)
		global.STEPSOUND = audio_play_sound(customstepsound,10,false)
		audio_sound_pitch(global.STEPSOUND,random_range(0.8,1.2))
		global.STEPSOUND_PLAYEDTHISFRAME = 1
	}
	*/
	if _cooldown <= 0
	{
		audio_stop_sound(_sound)
		var _newstepsound = audio_play_sound(_sound,10,false)
		audio_sound_pitch(_newstepsound,random_range(0.8,1.2))
	}
}
/*
function func_playcollidesound()
{
	if collidesoundcooldown <= 0
	{
		audio_stop_sound(customhorsecollidesound)
		var _newcollidesound = audio_play_sound(customhorsecollidesound,10,false)
		audio_sound_pitch(_newcollidesound,random_range(0.8,1.2))
	}
	collidesoundcooldown = 4
}
*/
