function scr_map_settings(argument0)
{
	func_switchmusic(sfx_null) //switches the music for this map
	global.COUNTDOWN_SKIPTO = 0 //which frame to skip to in the coundtown
	global.FASTER_COUNTDOWN = false //experimental, makes the countdown twice as fast
	global.OUT_OF_BOUNDS_MEASURE = "respawn" //how you want all horses to behave upon exiting the room's boundaries
	//respawn: forces horses to respawn at their start position
	//wrap: makes horses reappear at the opposite side of the room
	//nothing: does nothing, use if leaving the room boundaries is intended behavior
	global.MUSIC_DELAY = 30 //how many frames the map music is initially delayed for
	global.REMAINING_WIN_SLOTS = 1 //how many horses can win the race. doesn't apply for paradise fishing (yet)
	global.SHOW_TIMER = true //displays the timer if enabled
	
	switch argument0
	{
		case rm_maptemplate:
		{
			func_switchmusic(choose(sfx_mu_race1,sfx_mu_race2,sfx_mu_race3))
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_mapclassic1:
		{
			func_switchmusic(sfx_mu_race1remake)
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_mapclassic2:
		{
			func_switchmusic(sfx_mu_race2remake)
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_mapclassic3:
		{
			func_switchmusic(sfx_mu_race3remake)
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_mapclassic4:
		{
			//func_switchmusic(sfx_mu_race4remake)
			global.COUNTDOWN_SKIPTO = 419
		}
		break
		case rm_mapclassic5:
		{
			//func_switchmusic(sfx_mu_race5)
			func_switchmusic(sfx_mu_race4remake)
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_mapclassic6:
		{
			func_switchmusic(sfx_mu_race6remake)
			//func_switchmusic(sfx_mu_horsestambourineremake)
			if instance_exists(obj_announcer)
			{
				obj_announcer.announcertype = "spooky"
			}
		}
		break
		case rm_mapclassic7:
		{
			func_switchmusic(sfx_mu_race7)
			global.COUNTDOWN_SKIPTO = 419
			//global.REMAINING_WIN_SLOTS = 3
			if instance_exists(obj_announcer)
			{
				obj_announcer.announcertype = "spooky"
			}
		}
		break
		case rm_open:
		{
			//global.COUNTDOWN_SKIPTO = 419
			//global.REMAINING_WIN_SLOTS = 75
		}
		break
		case rm_mapexample:
		{
			func_switchmusic(sfx_mu_paradise)
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_map3:
		{
			func_switchmusic(sfx_mu_racesanctuary)
			global.COUNTDOWN_SKIPTO = 419
			global.MUSIC_DELAY = 0
		}
		break
		case rm_map4:
		{
			func_switchmusic(choose(sfx_mu_racepinball1,sfx_mu_racepinball2))
			global.COUNTDOWN_SKIPTO = 419
			global.REMAINING_WIN_SLOTS = 3
		}
		break
		case rm_map5:
		{
			func_switchmusic(sfx_mu_race5)
			global.OUT_OF_BOUNDS_MEASURE = "wrap"
		}
		break
		case rm_mapnightmare1:
		{
			func_switchmusic(sfx_mu_racewind)
			if instance_exists(obj_announcer)
			{
				obj_announcer.announcertype = "spooky"
			}
		}
		break
		case rm_pond:
		{
			global.SHOW_TIMER = false
		}
		break
		case rm_pondfinal:
		{
			func_switchmusic(sfx_mu_paradise)
			global.OUT_OF_BOUNDS_MEASURE = "nothing"
			global.SHOW_TIMER = false
		}
		break
		case rm_roadcutscene:
		{
			func_switchmusic(sfx_mu_sirens)
			global.SHOW_TIMER = false
		}
		break
		case rm_mapmutant1:
		{
			func_switchmusic(sfx_mu_mutant)
			global.COUNTDOWN_SKIPTO = 419
			if instance_exists(obj_announcer)
			{
				obj_announcer.announcertype = "weird"
			}
		}
		break
		case rm_hell:
		{
			func_switchmusic(sfx_mu_hell)
			global.OUT_OF_BOUNDS_MEASURE = "wrap"
			global.MUSIC_DELAY = 240
			global.SHOW_TIMER = false
		}
		break
		case rm_mapgeneral1:
		{
			func_switchmusic(sfx_mu_sillygooseRag)
			global.OUT_OF_BOUNDS_MEASURE = "respawn"
		}
		break
	}
}