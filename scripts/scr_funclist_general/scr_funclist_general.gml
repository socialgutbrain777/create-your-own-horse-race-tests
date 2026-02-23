function func_system_variables()
{
	audio_stop_all()
	global.PREVIOUS_ROOM = rm_init
	global.STEPSOUND = -1
	global.STEPSOUND_PLAYEDTHISFRAME = -1
	global.GAME_STATE = "racesetup"
	global.ANTI_COLLISION_MEASURE = "cheap"
	global.OUT_OF_BOUNDS_MEASURE = "respawn"
	global.COUNTDOWN_SKIPTO = 0
	global.FASTER_COUNTDOWN = false
	global.CAM_TARGET_GOAL = noone
	global.SELECTED_MUSIC = -1
	global.MUSIC_TRACK = -1
	global.MUSIC_DELAY = 30
	global.WINJINGLE = sfx_winjingle_defaultdearly
	global.JINGLETIMER = 0
	global.JINGLEFINISHED = false
	global.WINSOUND = sfx_horse1
	global.LASTPLAYEDWINSOUND = sfx_horse1
	global.REMAINING_WIN_SLOTS = 1

	global.WINNERS_LIST = []

	global.COLLECTIBLE = 0

	global.SHOW_TIMER = true
	global.TIMER_MINUTES = 0
	global.TIMER_SECONDS = 0
	global.TIMER_FRAMES = 0

	quickcountdown = false
	introcountdown = 0 //technically a countup
	outrocountdown = 0
	//jingletimertoadd = 0
}
function func_switchmusic()
{
	var _oldmusicselection = global.SELECTED_MUSIC
	var _newmusicselection = argument0
	if _newmusicselection != _oldmusicselection
	{
		if _oldmusicselection != -1
		{
			//audio_stop_sound(_oldmusicselection)
			audio_stop_sound(global.MUSIC_TRACK)
		}
		global.SELECTED_MUSIC = _newmusicselection
	}
}
function func_gettimestring(_includeframes = false)
{
	var _finaltext = ""
	if _includeframes == true
	{
		var _framestext = string(global.TIMER_FRAMES)
		if global.TIMER_FRAMES <= 9
			_framestext = "0"+_framestext
		_finaltext = "."+_framestext+_finaltext
	}
	var _secondstext = string(global.TIMER_SECONDS)
	if global.TIMER_SECONDS <= 9
		_secondstext = "0"+_secondstext
	_finaltext = ":"+_secondstext+_finaltext
	var _minutestext = string(global.TIMER_MINUTES)
	if global.TIMER_MINUTES <= 9
		_minutestext = "0"+_minutestext
	_finaltext = _minutestext+_finaltext
	return _finaltext;
}
function func_getplacementstring(_winplacement)
{
	var _finaltext = string(_winplacement)
	var _singledigit = _winplacement
	var _isaneleventeen = false
	if _winplacement > 9 && _winplacement < 20
	{
		_isaneleventeen = true
	}
	while _singledigit >= 10
	{
		if _singledigit >= 100
		{
			_singledigit -= 100
			if _singledigit > 9 && _singledigit < 20
			{
				_isaneleventeen = true
			}
		}
		else
		{
			_singledigit -= 10
		}
		
	}
	if _singledigit == 1 && _isaneleventeen == false
	{
		_finaltext = _finaltext + "ST"
	}
	else if _singledigit == 2 && _isaneleventeen == false
	{
		_finaltext = _finaltext + "ND"
	}
	else if _singledigit == 3 && _isaneleventeen == false
	{
		_finaltext = _finaltext + "RD"
	}
	else
	{
		_finaltext = _finaltext + "TH"
	}
	return _finaltext;
}
function func_draw_text_ext_transformed_outline(_textx,_texty,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle,_textcolor,_textoutlinecolor,_textoutlinesize)
{
	draw_set_color(_textoutlinecolor)
	draw_text_ext_transformed(_textx+_textoutlinesize,_texty,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx-_textoutlinesize,_texty,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx,_texty+_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx,_texty-_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx+_textoutlinesize,_texty+_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx-_textoutlinesize,_texty+_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx+_textoutlinesize,_texty-_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_text_ext_transformed(_textx-_textoutlinesize,_texty-_textoutlinesize,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
	draw_set_color(_textcolor)
	draw_text_ext_transformed(_textx,_texty,_textstring,_textsep,_textw,_textxscale,_textyscale,_textangle)
}
function func_createmapselectionpage()
{
	if instance_exists(obj_mapselectiontab)
	{
		with obj_mapselectiontab
		instance_destroy()
	}
	mapscurrentlyonpage = 0
	
	for (var _i = 0+(mapstoshowperpage*(mapselectionpage-1)); _i < clamp(mapstoshowperpage+(mapstoshowperpage*(mapselectionpage-1)),0,array_length(mapselectionlist)); ++_i)
	{
		with instance_create_depth(x,y,0,obj_mapselectiontab)
		{
			image_xscale = 14
			image_yscale = 2
			yoffset = 96*(_i-(other.mapstoshowperpage*(other.mapselectionpage-1)))
			map = array_get(other.mapselectionlist,_i)
		}
		mapscurrentlyonpage++
	}
	mapselectionpagecreated = true
}
function func_secondstoframes(argument0)
{
	return argument0*60
}
function func_minutestoframes(argument0)
{
	return argument0*3600
}
