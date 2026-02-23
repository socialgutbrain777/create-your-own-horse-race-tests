/// @description controlled step event
if global.GAME_STATE != "racesetup"
{
	if announceractive == false
	{
		switch announcertype
		{
			case "normal":
			{
				sprite_index = spr_pyblh
			}
			break
		}
		hsp = 0
		vsp = 0
		announceractive = true
	}
}
else
{
	sprite_index = spr_pyblh_intro
}

//dont look at my ugly code DONT LOOK AT IT
switch obj_system.introcountdown
{
	case 1:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_getready,10,false)
				image_index = 0
			}
			break
		}
	}
	break
	case 70:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_ten,10,false)
				image_index = 1
			}
			break
		}
	}
	break
	case 135:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_nine,10,false)
				image_index = 2
			}
			break
		}
	}
	break
	case 200:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_eight,10,false)
				image_index = 3
			}
			break
		}
	}
	break
	case 265:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_seven,10,false)
				image_index = 4
			}
			break
		}
	}
	break
	case 330:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_six,10,false)
				image_index = 5
			}
			break
		}
	}
	break
	case 395:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_five,10,false)
				image_index = 6
			}
			break
		}
	}
	break
	case 460:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_four,10,false)
				image_index = 7
			}
			break
		}
	}
	break
	case 525:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_three,10,false)
				image_index = 8
			}
			break
		}
	}
	break
	case 595:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_two,10,false)
				image_index = 9
			}
			break
		}
	}
	break
	case 660:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_one,10,false)
				image_index = 10
			}
			break
		}
	}
	break
	case 725:
	{
		switch announcertype
		{
			case "normal":
			{
				audio_play_sound(sfx_pyblh_go,10,false)
				image_index = 11
			}
			break
		}
	}
	break
}

x += hsp
y += vsp

if (bbox_left < 0)
{
	hsp = abs(hsp)
}
if (bbox_right > room_width)
{
	hsp = -abs(hsp)
}
if (bbox_top < 0)
{
	vsp = abs(vsp)
}
if (bbox_bottom > room_height)
{
	vsp = -abs(vsp)
}

if global.GAME_STATE == "normal"
{
	hsp = 0
	vsp = 0
	shrinktween += shrinktweenspeed
	image_xscale = lerp(originalxscale,0,shrinktween)
	image_yscale = lerp(originalyscale,0,shrinktween)
	
	if shrinktween >= 1
	{
		instance_destroy()
	}
}





