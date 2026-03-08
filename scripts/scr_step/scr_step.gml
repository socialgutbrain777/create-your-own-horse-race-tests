function scr_step()
{
	if global.GAME_STATE == "normal"
	{
		global.TIMER_FRAMES++
		while global.TIMER_FRAMES >= 60
		{
			global.TIMER_FRAMES -= 60
			global.TIMER_SECONDS++
		}
		while global.TIMER_SECONDS >= 60
		{
			global.TIMER_SECONDS -= 60
			global.TIMER_MINUTES++
		}
	}
	
	with obj_horseparent
	{
		if global.GAME_STATE == "normal"
		{
			hasdonecollisionthisframe = false
			event_user(0)
		}
	}
	with obj_collectibleparent
	{
		if global.GAME_STATE == "normal"
		{
			hasdonecollisionthisframe = false
			event_user(0)
		}
	}
	with obj_hook
	{
		if global.GAME_STATE != "paused"
		{
			hasdonecollisionthisframe = false
			event_user(0)
		}
	}
	with obj_ball
	{
		if global.GAME_STATE == "normal"
		{
			hasdonecollisionthisframe = false
			event_user(0)
		}
	}
	with obj_pinkgoop
	{
		if global.GAME_STATE == "normal"
		{
			event_user(0)
		}
	}
	with obj_goopstatus
	{
		if global.GAME_STATE == "normal"
		{
			event_user(0)
		}
	}
	with obj_goal
	{
		event_user(0)
	}
	with obj_crosshair
	{
		if global.GAME_STATE == "normal"
			event_user(0)
	}
	with obj_thirdeye
	{
		if global.GAME_STATE == "normal"
			event_user(0)
		else
			speed = 0
	}
	with obj_unstoppableforce
	{
		if global.GAME_STATE == "normal"
			event_user(0)
	}
	with obj_shitassannihilator_model1
	{
		if global.GAME_STATE == "normal"
			event_user(0)
	}
	with obj_pinball
	{
		if global.GAME_STATE == "normal"
		{
			hasdonecollisionthisframe = false
			event_user(0)
		}
	}
	with obj_pinballspawner
	{
		if global.GAME_STATE == "normal"
			event_user(0)
	}
	with obj_darkness
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_dasheffect_afterimage
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_dasheffect_line
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_horsewineffect
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_horsedeatheffect
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_winninghorse
	{
		if global.GAME_STATE == "normal"
			event_user(0)
	}
	with obj_caughtfish
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_coward
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_announcer
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_announcerfloateffect
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_placeyourbets
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_placeyourbetslh
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_fisher
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	
	with obj_gate
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_gate_lh
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_voideffect
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
	with obj_voidline
	{
		if global.GAME_STATE != "paused"
			event_user(0)
	}
}