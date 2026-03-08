/// @description Insert description here
// You can write your code in this editor
depth = 1
func_collisioninit()

horseidentity = "Default Dearly"

currentmovespeed = 1
//targetangle = -22.5
targetangle = random_range(0,359)
acceleration = 0
overtimeacceleration = 0
knockbackrecieved = 0
knockbackangle = 0
hasdonecollisionthisframe = false

defaultmovespeed = 1.5
accelerationamount = 0.02
maxacceleration = 4
overtimeaccelerationamount = 1/((60*60)*2)
overtimemaxacceleration = 6

knockbackintensity = 1
knockbackresistance = 0.5

angleincrement = 22.5
angleincrementdirectionmin = -2
angleincrementdirectionmax = 2
anglechangechance = 3

spritemergedwitheyedirection = false
spritedirectionfacing = 1 //deprecated
hasdasheffect = true
canxscaleflip = false
xscaleflipspeed = 0.1
xscaleflipdir = 1
xscalefliptargetdir = 1
//eyeframe = 0
eyeframe = round(targetangle/22.5)
stepsoundcooldown = 0
collidesoundcooldown = 0
afterimagecooldown = 0
dashlinecooldown = 0

bodycolor = make_color_rgb(17,240,13)
patternbicolor = false
bodycolor1 = make_color_rgb(17,240,13)
customstepsound = sfx_step
customhorsecollidesound = sfx_horsecollide
eyesprite = spr_horse_defaultdearly_eyes
winsprite = spr_horse_defaultdearly_win
losesprite = -1
portraitsprite = spr_horseportrait_superstitionalrealism
portraitbgsprite = spr_horseportrait_bg_default
winsound = sfx_horse1
secondwinsound = -1
winjingle = sfx_winjingle_defaultdearly
jinglelength = 3.5*60
winname = -1

hiddenindarkness = false

scr_horse_stats(horseidentity)
