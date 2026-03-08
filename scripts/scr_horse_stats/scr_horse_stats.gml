function scr_horse_stats(_givenidentity,_room=room)
{
	defaultmovespeed = 1.5 //how quickly this horse moves by default
	accelerationamount = 0.01 //how quickly this horse builds up acceleration speed
	maxacceleration = 4 //the maximum amount of acceleration speed this horse can have
	//acceleration is reset on each bounce
	overtimeaccelerationamount = 1/func_minutestoframes(2) //how quickly this horse builds up overtime acceleration speed
	//this equation makes it so that the horse gets 1 overtime acceleration for every 2 minutes that passes
	overtimemaxacceleration = 6 //the maximum amount of overtime acceleration speed this horse can have
	//unlike acceleration, overtime acceleration stays persistent between bounces,
	//and serves to gradually make all the horses faster if the race takes too long
	moveangleincrement = 16 //the amount of angles this horse is allowed to move (for pre v1.1 movement, set this to 360)
	//min = 1, max = 360
	
	knockbackintensity = 1 //how strong this horse's knockback is when bumping into other horses
	knockbackresistance = 0.5 //how resistant this horse is to knockback from other horses
	
	angleincrement = 22.5 //angle increment is mostly left unchanged, but it can still be changed
	angleincrementdirectionmin = -3
	angleincrementdirectionmax = 3
	//when randomizing angle, a random number between the minimum & maximum is chosen,
	//and the angleincrement is multiplied by that number and added to the horse's angle.
	//a wider range allows for more drastic random direction changes
	anglechangechance = 3 //how likely the horse's angle is to be randomized on every bounce.
	//higher number = lower chance, lower number (down to 0) = higher chance, 0 = 100% chance, -1 = 0% chance
	
	eyeframeamount = 16 //the amount of eye frames this horse has (set this to 8 if you used the oc submissions template)
	spritemergedwitheyedirection = false //set this to true if the horse's eye directions are merged with the main sprite
	eyedirectionsmoveclockwise = false //set this to true if this horse's eye directions rotate clockwise
	//(or if you used the oc submissions template for the sprite)
	firsteyeframe = 0 //determines which frame the eye direction starts at. this should always be set to the eye frame
	//that points east/right, which is 0 most of the time (set this to 2 if you used the oc submissions template)
	hasdasheffect = true //set this to true if you want your horse to have a special effect when moving at high speeds
	canxscaleflip = false //set this to true if you want your horse to flip like the fishes in paradise fishing.
	//eye directions may look off if this setting is enabled
	xscaleflipspeed = 0.1
	
	bodycolor = make_color_rgb(17,240,13) //color that is used for win screen text & ball color
	patternbicolor = false
	bodycolor1 = make_color_rgb(17,240,13)
	customstepsound = sfx_step
	customhorsecollidesound = sfx_horsecollide
	eyesprite = spr_horse_defaultdearly_eyes
	winsprite = spr_horse_defaultdearly_win
	losesprite = -1 //by default there is no lose sprite set, but if your horse has a lose sprite you can change this value
	portraitsprite = spr_horseportrait_defaultdearly
	portraitbgsprite = spr_horseportrait_bg_default
	winsound = sfx_horse1
	secondwinsound = -1 //if you want your horse to have a different sound on the win screen, change this
	winjingle = sfx_winjingle_defaultdearly
	jinglelength = func_secondstoframes(3.5)
	winname = -1 //if you want your horse to have a different name on the win screen, change this
	
	hiddenindarkness = false
	
	switch _givenidentity
	{
		case "Superstitional Realism":
		{	
			bodycolor = make_color_rgb(255,255,255)
			eyesprite = spr_horse_superstitionalrealism_eyes
			winsprite = spr_horse_superstitionalrealism_win
			portraitsprite = spr_horseportrait_superstitionalrealism
			winjingle = sfx_winjingle_superstitionalrealism
			jinglelength = func_secondstoframes(6.5)
			if _room == rm_transparancytest
			{
				sprite_index = spr_thelooker
				eyesprite = spr_null
			}
		}
		break
		case "Door Knob":
		{
			knockbackresistance = 1
			
			angleincrementdirectionmin = -5
			angleincrementdirectionmax = 5
			
			bodycolor = make_color_rgb(93,31,23)
			eyesprite = spr_horse_doorknob_eyes
			winsprite = spr_horse_doorknob_win
			portraitsprite = spr_horseportrait_doorknob
			winjingle = sfx_winjingle_doorknob
			secondwinsound = sfx_doorknobwin
			jinglelength = func_secondstoframes(5)
		}
		break
		case "Bullet'n Board":
		{
			overtimeaccelerationamount = 1/func_minutestoframes(1.5)
			
			angleincrementdirectionmin = -5
			angleincrementdirectionmax = 5
			anglechangechance = 3
			
			bodycolor = make_color_rgb(0,15,255)
			eyesprite = spr_horse_bulletnboard_eyes
			winsprite = spr_horse_bulletnboard_win
			portraitsprite = spr_horseportrait_bulletnboard
			winjingle = sfx_winjingle_bulletnboard
			jinglelength = func_secondstoframes(5.1)
		}
		break
		case "Lightning Strikes Thrice":
		{
			accelerationamount = 0.015
			
			anglechangechance = 2
			
			bodycolor = make_color_rgb(254,254,72)
			eyesprite = spr_horse_lightningstrikesthrice_eyes
			winsprite = spr_horse_lightningstrikesthrice_win
			portraitsprite = spr_horseportrait_lightningstrikesthrice
			winjingle = sfx_winjingle_lightningstrikesthrice
			jinglelength = func_secondstoframes(3.75)
			
			if _room == rm_mapnightmare1
			{
				sprite_index = spr_horse_lightningstrikesthrice_mutate1
			}
		}
		break
		case "Cyan":
		{
			knockbackresistance = -0.5
			
			//angleincrementdirectionmin = -2.5
			angleincrementdirectionmin = -3
			//angleincrementdirectionmax = 2.5
			angleincrementdirectionmax = 3
			anglechangechance = 1
			
			bodycolor = make_color_rgb(12,175,181)
			eyesprite = spr_horse_cyan_eyes
			winsprite = spr_horse_cyan_win
			portraitsprite = spr_horseportrait_cyan
			winjingle = sfx_winjingle_cyan
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Jovial Merryment":
		{
			//defaultmovespeed = 1.85
			defaultmovespeed = 2
			overtimeaccelerationamount = 1/func_minutestoframes(3)
			anglechangechance = 10
			
			bodycolor = make_color_rgb(243,119,0)
			eyesprite = spr_horse_jovialmerryment_eyes
			winsprite = spr_horse_jovialmerryment_win
			portraitsprite = spr_horseportrait_jovialmerryment
			winjingle = sfx_winjingle_jovialmerryment
			jinglelength = func_secondstoframes(4.8)
		}
		break
		case "Downtown Skybox":
		{
			defaultmovespeed = 1.6
			accelerationamount = 0.005
			maxacceleration = 6
			overtimeaccelerationamount = 1/func_minutestoframes(3)
			overtimemaxacceleration = 8
			
			//knockbackresistance = 1.5
			knockbackresistance = 2
			
			bodycolor = make_color_rgb(74,74,74)
			eyesprite = spr_horse_downtownskybox_eyes
			winsprite = spr_horse_downtownskybox_win
			portraitsprite = spr_horseportrait_downtownskybox
			winjingle = sfx_winjingle_downtownskybox
			jinglelength = func_secondstoframes(3.5)
			
			if _room == rm_mapnightmare1
			{
				sprite_index = spr_horse_downtownskybox_mutate1
			}
		}
		break
		case "Resolute Mind Afternoon":
		{
			//defaultmovespeed = 2.1
			//overtimeaccelerationamount = 1/func_minutestoframes(10)
			//overtimemaxacceleration = 4
			defaultmovespeed = 2.3
			overtimeaccelerationamount = 0
			overtimemaxacceleration = 0
			
			knockbackintensity = 2.25
			
			angleincrementdirectionmin = -2.5
			angleincrementdirectionmax = 2.5
			anglechangechance = 5
			
			bodycolor = make_color_rgb(191,0,1)
			eyesprite = spr_horse_resolutemindafternoon_eyes
			winsprite = spr_horse_resolutemindafternoon_win
			portraitsprite = spr_horseportrait_resolutemindafternoon
			winjingle = sfx_winjingle_resolutemindafternoon
			jinglelength = func_secondstoframes(4.25)
		}
		break
		case "Comely Material Morning":
		{
			defaultmovespeed = 1.25
			maxacceleration = 8
			overtimeaccelerationamount = 1/func_minutestoframes(1.5)
			overtimemaxacceleration = 8
			
			knockbackresistance = -0.5
			
			angleincrementdirectionmin = -1
			angleincrementdirectionmax = 1
			anglechangechance = 1
			
			bodycolor = make_color_rgb(255,175,255)
			eyesprite = spr_horse_comelymaterialmorning_eyes
			winsprite = spr_horse_comelymaterialmorning_win
			portraitsprite = spr_horseportrait_comelymaterialmorning
			winjingle = sfx_winjingle_comelymaterialmorning
			jinglelength = func_secondstoframes(6)
			
			if _room == rm_mapnightmare1
			{
				sprite_index = spr_horse_comelymaterialmorning_mutate1
			}
			if _room == rm_open
			{
				sprite_index = spr_horse_comelymaterialmorning_bigoleyes
				eyesprite = spr_horse_comelymaterialmorning_bigoleyes_eyes
				winsprite = spr_horse_comelymaterialmorning_bigoleyes_win
				losesprite = spr_horse_comelymaterialmorning_bigoleyes_win
				portraitsprite = spr_horseportrait_comelymaterialmorning_crybaby
				winname = "this pink motherFUCKer"
			}
		}
		break
		case "A Mysterious Figure":
		{
			defaultmovespeed = 2
			accelerationamount = 0
			maxacceleration = 0
			overtimeaccelerationamount = 1/func_minutestoframes(1.85)
			overtimemaxacceleration = 4
			
			knockbackintensity = 2
			knockbackresistance = 1
			
			bodycolor = make_color_rgb(199,207,231)
			eyesprite = spr_nightmare_amysteriousfigure2_eyes
			winsprite = spr_nightmare_amysteriousfigure2_win
			portraitsprite = spr_horseportrait_amysteriousfigure
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			winjingle = sfx_winjingle_amysteriousfigure
			jinglelength = func_secondstoframes(6.15)
			if _room == rm_mapnightmare1
			{
				defaultmovespeed = 0.5
				//accelerationamount = 0.005
				//maxacceleration = 2
				//overtimeaccelerationamount = 0
				hiddenindarkness = true
			}
			if _room == rm_open
			{
				losesprite = spr_nightmare_amysteriousfigure2_lose
			}
		}
		break
		case "Garbage Bin":
		{
			accelerationamount = 0.02
			
			knockbackintensity = 2
			knockbackresistance = 4.5
			
			bodycolor = make_color_rgb(0,107,107)
			eyesprite = spr_nightmare_garbagebin2_eyes
			winsprite = spr_nightmare_garbagebin2_win
			portraitsprite = spr_horseportrait_garbagebin
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			winjingle = sfx_winjingle_garbagebin
			jinglelength = func_secondstoframes(5.5)
			if _room == rm_mapnightmare1
			{
				defaultmovespeed = 0.5
				//accelerationamount = 0.005
				//maxacceleration = 2
				//overtimeaccelerationamount = 0
				hiddenindarkness = true
			}
			if _room == rm_open
			{
				losesprite = spr_nightmare_garbagebin2_lose
			}
		}
		break
		case "Nighttime Knifemare":
		{
			accelerationamount = 0.025
			
			knockbackintensity = 4.5
			knockbackresistance = 1
			
			bodycolor = make_color_rgb(0,63,63)
			eyesprite = spr_nightmare_nighttimeknifemare2_eyes
			winsprite = spr_nightmare_nighttimeknifemare2_win
			portraitsprite = spr_horseportrait_nighttimeknifemare
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			winjingle = sfx_winjingle_nighttimeknifemare
			jinglelength = func_secondstoframes(6.6)
			if _room == rm_mapnightmare1
			{
				defaultmovespeed = 0.5
				//accelerationamount = 0.005
				//maxacceleration = 2
				//overtimeaccelerationamount = 0
				hiddenindarkness = true
			}
			if _room == rm_open
			{
				losesprite = spr_nightmare_nighttimeknifemare2_lose
			}
			if _room == rm_pond
			{
				sprite_index = spr_nightmare_nightfinknifeterror4
				eyesprite = spr_nightmare_nightfinknifeterror4_eyes
				
				defaultmovespeed = 0.5
				accelerationamount = 0.02
				overtimeaccelerationamount = 1/func_minutestoframes(4)
			}
			if _room == rm_hell
			{
				targetangle = 110
				eyesprite = spr_nightmare_nightfinknifeterror1_eyes
				defaultmovespeed = 0.5
				accelerationamount = 28/func_minutestoframes(4)
				maxacceleration = 28
				overtimeaccelerationamount = 0
			}
		}
		break
		case "Nightfin Knifeterror":
		{
			defaultmovespeed = 0.25
			accelerationamount = 0.025
			overtimeaccelerationamount = 1/func_minutestoframes(4)
			
			knockbackintensity = 4
			knockbackresistance = 1
			
			canxscaleflip = true
			
			bodycolor = make_color_rgb(0,63,63)
			eyesprite = spr_null
			customstepsound = sfx_null
			winsprite = spr_nightmare_nightfinknifeterrorfinal
			portraitsprite = spr_horseportrait_nightfinknifeterror
			portraitbgsprite = spr_horseportrait_bg_paradise
			winsound = sfx_nightfin
			winjingle = sfx_nightfin
			jinglelength = func_secondstoframes(4)
			if _room == rm_hell
			{
				targetangle = 110+180
				sprite_index = spr_allfishesgotohell
				defaultmovespeed = 0.5
				accelerationamount = 28/func_minutestoframes(4)
				maxacceleration = 28
				overtimeaccelerationamount = 0
			}
		}
		break
		case "Midwest State Outline":
		{
			accelerationamount = 0.02
			
			knockbackintensity = 2
			knockbackresistance = 1
			
			bodycolor = make_color_rgb(1,227,227)
			eyesprite = spr_nightmare_midweststateoutline_eyes
			winsprite = spr_nightmare_midweststateoutline_win
			portraitsprite = spr_horseportrait_midweststateoutline
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare2
			winjingle = sfx_winjingle_midweststateoutline
			jinglelength = func_secondstoframes(5)
		}
		break
		case "Truck Stop Highway":
		{
			defaultmovespeed = 1
			maxacceleration = 16
			overtimeaccelerationamount = 1/func_minutestoframes(1.75)
			overtimemaxacceleration = 10
			
			knockbackintensity = 5
			knockbackresistance = 5
			
			bodycolor = make_color_rgb(0,107,107)
			eyesprite = spr_nightmare_truckstophighway_eyes
			winsprite = spr_nightmare_truckstophighway_win
			portraitsprite = spr_horseportrait_truckstophighway
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			secondwinsound = sfx_nightmaretruckstophighway
			winjingle = sfx_nightmaretruckstophighway
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Plasticine Entity":
		{
			defaultmovespeed = 1.8
			accelerationamount = 0.02
			maxacceleration = 3
			overtimeaccelerationamount = 1/func_minutestoframes(2)
			overtimemaxacceleration = 5
			
			knockbackintensity = 2
			knockbackresistance = 2
			
			angleincrementdirectionmin = -5
			angleincrementdirectionmax = 5
			anglechangechance = 0
			
			bodycolor = make_color_rgb(0,155,155)
			eyesprite = spr_nightmare_plasticineentity_eyes
			winsprite = spr_nightmare_plasticineentity_win
			portraitsprite = spr_horseportrait_plasticineentity
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_null
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Biomorph Crucifixion":
		{
			defaultmovespeed = 0
			//accelerationamount = 0.1
			accelerationamount = 0.075
			maxacceleration = 4.5
			overtimeaccelerationamount = 1/func_minutestoframes(1.5)
			overtimemaxacceleration = 10
			
			knockbackintensity = 0
			knockbackresistance = 10
			
			bodycolor = make_color_rgb(0,179,179)
			eyesprite = spr_nightmare_biomorphcruficixion_eyes
			winsprite = spr_nightmare_biomorphcrucifixion_win
			portraitsprite = spr_horseportrait_midweststateoutline
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			secondwinsound = sfx_horseglitch
			winjingle = sfx_winjingle_biomorphcrucifixion
			jinglelength = func_secondstoframes(6.5)
			
			if _room == rm_mapnightmare1
			{
				sprite_index = spr_nightmare_biomorphcrucifixion_fakeleak
			}
		}
		break
		case "Thunderous Boom":
		{
			defaultmovespeed = 8
			accelerationamount = 0.1
			maxacceleration = 8
			overtimeaccelerationamount = 1/func_minutestoframes(1)
			overtimemaxacceleration = 18
			
			knockbackintensity = 2
			knockbackresistance = 2
			
			angleincrementdirectionmin = -5
			angleincrementdirectionmax = 5
			anglechangechance = 3
			
			eyesprite = spr_null
			winsprite = spr_horse_thunderousboom_win
			winsound = sfx_thunderbig1
		}
		break
		case "Shitass":
		{
			defaultmovespeed = 0.5
			accelerationamount = 0
			maxacceleration = 0.1
			overtimeaccelerationamount = 0
			overtimemaxacceleration = 0.1
			
			knockbackintensity = 0
			knockbackresistance = -1
			
			spritemergedwitheyedirection = true
			
			anglechangechance = 0
			
			bodycolor = make_color_rgb(72,0,255)
			//eyesprite = spr_horse_shitass_eyes
			eyesprite = spr_null
		}
		break
		case "Bandcamp Friday":
		{
			bodycolor = make_color_rgb(255,128,0)
			eyesprite = spr_horse_bandcampfriday_eyes
			winsprite = spr_horse_bandcampfriday_win
			portraitsprite = spr_horseportrait_jovialmerryment
			winjingle = sfx_winjingle_jovialmerryment
			jinglelength = func_secondstoframes(4.8)
		}
		break
		case "Realistic Fortune":
		{
			bodycolor = make_color_rgb(255,255,255)
			eyesprite = spr_horse_defaultdearly_eyes
			winsprite = spr_horse_realisticfortune_win
			portraitsprite = spr_horseportrait_superstitionalrealism
		}
		break
		case "Exemplary Product":
		{
			defaultmovespeed = 1.3
			accelerationamount = 0.02
			maxacceleration = 6
			
			bodycolor = make_color_rgb(135,135,195)
			eyesprite = spr_horse_exemplaryproduct_eyes
			winsprite = spr_horse_exemplaryproduct_win
			losesprite = spr_horse_exemplaryproduct_lose
			portraitsprite = spr_horseportrait_exemplaryproduct
			winjingle = sfx_winjingle_exemplaryproduct
			jinglelength = func_secondstoframes(6.5)
		}
		break
		case "Self Explanatory Business":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			
			bodycolor = make_color_rgb(155,173,183)
		}
		break
		case "Just One More Sample":
		{
			bodycolor = make_color_rgb(135,135,195)
			eyesprite = spr_horse_exemplaryproduct_eyes
			winsprite = spr_horse_exemplaryproduct_win
			losesprite = spr_horse_exemplaryproduct_lose
			portraitsprite = spr_horseportrait_exemplaryproduct
			winjingle = sfx_winjingle_exemplaryproduct
			jinglelength = func_secondstoframes(6.5)
		}
		break
		case "Random Fish":
		{
			
			knockbackintensity = 2
			knockbackresistance = 1
			
			canxscaleflip = true
			xscaleflipspeed = 0.1
			
			eyesprite = spr_null
			customstepsound = sfx_null
			winjingle = sfx_null
			jinglelength = func_secondstoframes(8.5)
			if _room == rm_pond
			{
				sprite_index = choose(spr_randomfish_1,spr_randomfish_1,spr_randomfish_1,spr_randomfish_2,spr_randomfish_2,spr_randomfish_3)
				
				defaultmovespeed = 0.25
				accelerationamount = 0.005
				overtimeaccelerationamount = 1/func_minutestoframes(4)
			}
			if _room == rm_pondfinal
			{
				targetangle = 0
				defaultmovespeed = 0.1
				//accelerationamount = 0.0025
				accelerationamount = 0.005
				overtimeaccelerationamount = 1/func_minutestoframes(6)
			}
		}
		break
		case "Infinite":
		{
			//defaultmovespeed = 1.5
			defaultmovespeed = 0.5
			accelerationamount = 0.02
			
			bodycolor = make_color_rgb(17,240,13)
			eyesprite = spr_null
			jinglelength = func_secondstoframes(5.5)
		}
		break
		case "Perfect Specimen":
		{
			defaultmovespeed = 1
			overtimeaccelerationamount = 1/func_minutestoframes(1)
			knockbackresistance = 2
			
			/*
			angleincrementdirectionmin = -3
			angleincrementdirectionmax = 3
			anglechangechance = 1
			*/
			
			bodycolor = make_color_rgb(1,255,255)
			eyesprite = spr_horse_cyan_eyes
			winsprite = spr_horse_oob
			portraitsprite = spr_horseportrait_cyan
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Comedic Resolution":
		{
			defaultmovespeed = 2
			maxacceleration = 8
			overtimeaccelerationamount = 1/func_minutestoframes(2.5)
			overtimemaxacceleration = 8
			
			knockbackintensity = 2.25
			knockbackresistance = -0.5
			
			bodycolor = make_color_rgb(255,175,255)
			eyesprite = spr_mutant_comedicresolution_eyes
			winsprite = spr_mutant_comedicresolution
			portraitsprite = spr_horseportrait_comedicresolution
			portraitbgsprite = spr_horseportrait_bg_nightmare
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
			
			winname = "DayTime"
		}
		break
		case "Abomination Nation":
		{
			defaultmovespeed = 0
			accelerationamount = 0.025
			maxacceleration = 4.5
			//overtimeaccelerationamount = 1/func_minutestoframes(1.5)
			//overtimemaxacceleration = 10

			knockbackintensity = 0
			knockbackresistance = 10
			
			bodycolor = make_color_rgb(0,255,0)
			eyesprite = spr_mutant_abominationnation_eyes
			winsprite = spr_mutant_abominationnation
			portraitsprite = spr_horseportrait_abominationnation
			portraitbgsprite = spr_horseportrait_bg_nightmare
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Skybox Trike Thrice":
		{
			maxacceleration = 6
			overtimemaxacceleration = 8
			
			anglechangechance = 2
			
			bodycolor = make_color_rgb(222,211,0)
			eyesprite = spr_mutant_skyboxtrikesthrice_eyes
			winsprite = spr_mutant_skyboxtrikesthrice
			portraitsprite = spr_horseportrait_skyboxtrikesthrice
			portraitbgsprite = spr_horseportrait_bg_nightmare
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Pet Eggy":
		{
			//defaultmovespeed = 2.5
			defaultmovespeed = 3
			accelerationamount = 0.02
			maxacceleration = 3
			overtimeaccelerationamount = 1/func_minutestoframes(2)
			overtimemaxacceleration = 5
			
			bodycolor = make_color_rgb(0,179,179)
			customstepsound = sfx_null
			customhorsecollidesound = sfx_null
			eyesprite = spr_null
			winsprite = spr_mutant_peteggy
			portraitsprite = spr_horseportrait_peteggy
			portraitbgsprite = spr_horseportrait_bg_nightmare
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Blue Knob":
		{
			overtimeaccelerationamount = 1/func_minutestoframes(1.5)
			
			knockbackresistance = 1
			
			angleincrementdirectionmin = -5
			angleincrementdirectionmax = 5
			anglechangechance = 3
			
			bodycolor = make_color_rgb(0,15,255)
			eyesprite = spr_horse_doorknob_eyes
			winsprite = spr_mutant_blueknob_win
			portraitsprite = spr_horseportrait_blueknob
			portraitbgsprite = spr_horseportrait_bg_nightmare
			secondwinsound = sfx_horseglitch
			winjingle = sfx_null
			jinglelength = func_secondstoframes(4)
		}
		break
		case "Orange Horse":
		{
			//defaultmovespeed = 1.85
			defaultmovespeed = 2
			overtimeaccelerationamount = 1/func_minutestoframes(3)
			anglechangechance = 10
			
			bodycolor = make_color_rgb(243,119,0)
			eyesprite = spr_horse_orangehorse_eyes
			winsprite = spr_horse_jovialmerryment_win
			portraitsprite = spr_horseportrait_jovialmerryment
			winjingle = sfx_winjingle_jovialmerryment
			jinglelength = func_secondstoframes(4.8)
		}
		break
		case "Five Empty Bamboo":
		{
			accelerationamount = 0.025
			
			knockbackintensity = 4.5
			knockbackresistance = 1
			
			bodycolor = make_color_rgb(0,63,63)
			eyesprite = spr_horse_fiveemptybamboo_eyes
			winsprite = spr_nightmare_nighttimeknifemare2_win
			portraitsprite = spr_horseportrait_nighttimeknifemare
			portraitbgsprite = spr_horseportrait_bg_nightmare
			customhorsecollidesound = sfx_nightmarecollide
			winsound = sfx_nightmare1
			winjingle = sfx_winjingle_nighttimeknifemare
			jinglelength = func_secondstoframes(6.6)
		}
		break
		case "Raining Roses":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			hasdasheffect = false
			
			bodycolor = make_color_rgb(168,34,50)
			
			winsprite = spr_horse_rainingRoses_win
			losesprite = spr_horse_rainingRoses_lose
			portraitsprite = spr_horseportrait_rainingRoses
			portraitbgsprite = spr_horseportrait_bg_lh
			
			winsound = sfx_goathorse
			winjingle = sfx_winjingle_rainingRoses
			jinglelength = func_secondstoframes(4.20)
		}
		break
		case "Binate Chromatism":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			hasdasheffect = false
			
			bodycolor = make_color_rgb(63,229,199)
			patternbicolor = true
			bodycolor1 = make_color_rgb(216,93,124)
			
			winsprite = spr_horse_binateChromatism_win
			losesprite = spr_horse_binateChromatism_lose
			portraitsprite = spr_horseportrait_binateChromatism
			portraitbgsprite = spr_horseportrait_bg_lh
			
			winjingle = sfx_winjingle_binateChromatism
			jinglelength = func_secondstoframes(4.67)
		}
		break
		case "Riveting Flash":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			hasdasheffect = false
			
			bodycolor = make_color_rgb(25,163,44)
			
			winsprite = spr_horse_rivetingFlash_win
			losesprite = spr_horse_rivetingFlash_lose
			portraitsprite = spr_horseportrait_rivetingFlash
			portraitbgsprite = spr_horseportrait_bg_lh
			
			winjingle = sfx_winjingle_rivetingFlash
			jinglelength = func_secondstoframes(6.85)
		}
		break
		case "Burial Malapropism":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			hasdasheffect = false
			
			bodycolor = make_color_rgb(85,75,80)
			
			winsprite = spr_deer_burialMalapropism_win
			losesprite = spr_deer_burialMalapropism_lose
			portraitsprite = spr_horseportrait_burialMalapropism
			portraitbgsprite = spr_horseportrait_bg_lh
			
			winsound = sfx_deer
			winjingle = sfx_winjingle_burialMalapropism
			jinglelength = func_secondstoframes(5.37)
		}
		break
		case "Spiked Universal Nerman":
		{
			eyeframeamount = 8
			spritemergedwitheyedirection = true
			eyedirectionsmoveclockwise = true
			firsteyeframe = 2
			hasdasheffect = false
			
			bodycolor = make_color_rgb(255,200,60)
			
			winsprite = spr_horse_spikedUniversalNerman_win
			losesprite = spr_horse_spikedUniversalNerman_lose
			portraitsprite = spr_horseportrait_spikedUniversalNerman
			portraitbgsprite = spr_horseportrait_bg_lh
			
			winsound = sfx_meow
			winjingle = sfx_winjingle_spikedUniversalNerman
			jinglelength = func_secondstoframes(8.74)
		}
		break
	}
}