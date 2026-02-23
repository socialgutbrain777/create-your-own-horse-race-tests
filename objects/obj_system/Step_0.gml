/// @description Insert description here
// You can write your code in this editor
//global.STEPSOUND = -1
global.STEPSOUND_PLAYEDTHISFRAME = -1
switch global.GAME_STATE
{
	case "normal":
	{
		if global.MUSIC_DELAY > 0
		{
			global.MUSIC_DELAY--
		}
		else
		{
			if global.SELECTED_MUSIC != -1 && !audio_is_playing(global.SELECTED_MUSIC)
			{
				global.MUSIC_TRACK = audio_play_sound(global.SELECTED_MUSIC,50,true)
			}
		}
		if keyboard_check_pressed(vk_escape)
		{
			global.GAME_STATE = "paused"
		}
		if keyboard_check_pressed(ord("R"))
		{
			func_system_variables()
			quickcountdown = true
			room_goto(room)
		}
	}
	break
	case "paused":
	{
		if mouse_check_button_pressed(mb_left)
		{
			global.GAME_STATE = "normal"
		}
		if keyboard_check_pressed(vk_escape)
		{
			//game_restart();
			room_goto(rm_mapselection)
		}
	}
	break
	case "racesetup":
	{
		if mouse_check_button_pressed(mb_left) && room != rm_mapselection
		{
			global.WINNERS_LIST = []
			if instance_exists(obj_fisher)
			{
				global.GAME_STATE = "fishintro"
			}
			else if instance_exists(obj_placeyourbets)
			{
				global.GAME_STATE = "raceintroclassic"
			}
			else
			{
				global.GAME_STATE = "raceintro"
			}
		}
		if keyboard_check_pressed(vk_escape)
		{
			//game_restart();
			room_goto(rm_mapselection)
		}
	}
	break
	case "raceintro":
	{
		introcountdown++
		if mouse_check_button_pressed(mb_left)
		{
			introcountdown = 780
		}
		if introcountdown >= 780
		{
			if instance_exists(obj_gate)
				audio_play_sound(sfx_gate,10,false)
			if instance_exists(obj_announcer)
				obj_announcer.displaytext = ""
			global.GAME_STATE = "normal"
		}
		if introcountdown == 120 && global.COUNTDOWN_SKIPTO > introcountdown
			introcountdown = global.COUNTDOWN_SKIPTO
		if introcountdown >= 60 && global.FASTER_COUNTDOWN == true
		{
			introcountdown++
		}
		if keyboard_check_pressed(ord("R"))
		{
			func_system_variables()
			quickcountdown = true
			room_goto(room)
		}
	}
	break
	case "raceintroclassic":
	{
		introcountdown++
		if mouse_check_button_pressed(mb_left)
		{
			introcountdown = 790
		}
		if introcountdown >= 790
		{
			if instance_exists(obj_gate)
				audio_play_sound(sfx_gate,10,false)
			global.GAME_STATE = "normal"
		}
		if introcountdown == 70 && global.COUNTDOWN_SKIPTO > introcountdown
			introcountdown = global.COUNTDOWN_SKIPTO
		if introcountdown >= 30 && global.FASTER_COUNTDOWN == true
		{
			introcountdown++
		}
		if keyboard_check_pressed(ord("R"))
		{
			func_system_variables()
			quickcountdown = true
			room_goto(room)
		}
	}
	break
	case "fishintro":
	{
		introcountdown++
		if mouse_check_button_pressed(mb_left)
		{
			introcountdown = 960
		}
		if introcountdown >= 960
		{
			if instance_exists(obj_gate)
				audio_play_sound(sfx_gate,10,false)
			if instance_exists(obj_fisher)
			{
				obj_fisher.speechsprite = spr_null
				obj_fisher.speechframe = 0
			}
			global.GAME_STATE = "normal"
		}
		if introcountdown == 120 && global.COUNTDOWN_SKIPTO > introcountdown
			introcountdown = global.COUNTDOWN_SKIPTO
		if keyboard_check_pressed(ord("R"))
		{
			func_system_variables()
			quickcountdown = true
			room_goto(room)
		}
	}
	break
	case "raceend":
	{
		obj_camera.target = global.CAM_TARGET_GOAL
		outrocountdown++
		//if outrocountdown >= 120
		if !audio_is_playing(global.LASTPLAYEDWINSOUND) && !audio_is_playing(sfx_gong) && !audio_is_playing(sfx_whistle)
		{
			obj_camera.zoomdirection = -1
			obj_camera.zoomtype = "curve"
			obj_camera.zoomtransitionactive = true
			if array_length(global.WINNERS_LIST) > 1
				obj_camera.zoomtransitiontargetroom = rm_winnermultiple
			else
				obj_camera.zoomtransitiontargetroom = rm_winnersingle
			audio_play_sound(global.WINJINGLE,10,false)
			global.GAME_STATE = "results"
		}
		if instance_exists(obj_horseparent)
		{
		    for (var _i=0; _i<instance_number(obj_horseparent); _i++)
		    {
		        var _honse = instance_find(obj_horseparent,_i)
				if _honse.losesprite != -1
				{
					_honse.sprite_index = _honse.losesprite
					_honse.eyesprite = spr_null
				}
		    }
		}
		audio_stop_sound(global.MUSIC_TRACK)
	}
	break
	case "fishend":
	{
		obj_camera.target = global.CAM_TARGET_GOAL
		outrocountdown++
		if outrocountdown >= 120
		{
			obj_camera.zoomdirection = -1
			obj_camera.zoomtype = "curve"
			obj_camera.zoomtransitionactive = true
			obj_camera.zoomtransitiontargetroom = rm_winnersingle
			audio_play_sound(global.WINSOUND,10,false)
			audio_play_sound(global.WINJINGLE,10,false)
			global.GAME_STATE = "results"
		}
		if instance_exists(obj_horseparent)
		{
		    for (var _i=0; _i<instance_number(obj_horseparent); _i++)
		    {
		        var _honse = instance_find(obj_horseparent,_i)
				if _honse.losesprite != -1
				_honse.sprite_index = _honse.losesprite
				_honse.eyesprite = spr_null
		    }
		}
		audio_stop_sound(global.MUSIC_TRACK)
	}
	break
	case "results":
	{
		/*
		if room != rm_winnersingle && room != rm_winnermultiple
		{
			jingletimertoadd++
		}
		if jingletimertoadd != -1
			jingletimertoadd++
		*/
		if global.JINGLEFINISHED == false
		{
			global.JINGLETIMER++
			if room == rm_winnermultiple
			{
				global.JINGLEFINISHED = true
			}
		}
		if keyboard_check_pressed(vk_escape) && global.JINGLEFINISHED == true
		{
			//game_restart();
			room_goto(rm_mapselection)
		}
	}
	break
	default:
	break
}
scr_step()
if global.COLLECTIBLE >= 8
{
	global.COLLECTIBLE = 0
	instance_create_depth(room_width/2,-128,-999,obj_stillhungry)
}
if keyboard_check(ord("Z"))
{
	scr_step()
}
if global.REMAINING_WIN_SLOTS <= 0 && global.GAME_STATE == "normal"
	global.GAME_STATE = "raceend"




