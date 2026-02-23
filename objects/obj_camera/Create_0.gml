/// @description Insert description here
// You can write your code in this editor
camera = view_camera[0]
target = noone
targetx = xstart
targety = ystart
spectatinghorse = -1
spectatingball = -1
global.VIEW_W_HALF = camera_get_view_width(camera)/2
global.VIEW_H_HALF = camera_get_view_height(camera)/2
min_x = 0
max_x = room_width - camera_get_view_width(camera)
min_y = 0
max_y = room_height - camera_get_view_height(camera)
xoffset = 0
yoffset = 0
zoomwidth = 640
zoomheight = 480
zoomamount = 1
zoommin = 0.01
zoommax = 1
zoominterval = 0.0125
zoomdirection = 1
zoomx = 0
zoomy = 0
zoommovespeed = 1
zoomtransitionactive = false
zoomtransitiontargetroom = rm_winnermultiple
zoomtype = "curve"
cammoveacceleratex = 0
cammoveacceleratey = 0

mouse_x_old = mouse_x
mouse_y_old = mouse_y





