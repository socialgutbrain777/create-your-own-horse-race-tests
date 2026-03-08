/// @description Insert description here
// You can write your code in this editor
depth = 1
func_collisioninit()

horseidentity = "Ball"
currentpass = "Default Dearly"

currentmovespeed = 0
//targetangle = -22.5
targetangle = random_range(0,359)
acceleration = 0
overtimeacceleration = 0
knockbackrecieved = 0
knockbackangle = 0
hasdonecollisionthisframe = false

defaultmovespeed = 0
accelerationamount = 3
decelerationamount = 0.03
maxacceleration = 12
overtimeaccelerationamount = 0
overtimemaxacceleration = 0

knockbackintensity = 0
knockbackresistance = 0

angleincrement = 22.5
angleincrementdirectionmin = -2
angleincrementdirectionmax = 2
anglechangechance = -1

spritemergedwitheyedirection = false
spritedirectionfacing = 1
//deprecated
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

bodycolor = make_color_rgb(243,119,0)
patternbicolor = true
bodycolor1 = make_color_rgb(243,119,0)
customstepsound = sfx_ball
customhorsecollidesound = sfx_horsecollide
eyesprite = spr_null
winsprite = spr_ball
losesprite = -1
portraitsprite = spr_horseportrait_superstitionalrealism
portraitbgsprite = spr_horseportrait_bg_default
winsound = sfx_horse1
secondwinsound = -1
winjingle = sfx_winjingle_defaultdearly
jinglelength = func_secondstoframes(3.5)

hiddenindarkness = false

outlinesprite = spr_ball_outline
coloringsprite = spr_ball_coloring
bicolorsprite = spr_ball_bicolor
