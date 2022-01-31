#!/usr/bin/sh
xmodmap -e "keycode 107 = Super_L"

xmodmap -e 'clear Lock' -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

xmodmap ~/sys_cfg/xmodarrows

export PATH=$PATH:/home/nls/py/batd

feh --bg-scale ~/bg/16.*
tlp start
picom & disown
killall -q polybar
polybar bar & disown
#compton is used as composition manager ... start it regularlly if necessary
kill $(pidof xfce4-notifyd)
dunst

sudo mount /dev/mmcblk0p1 /home/nls/sd/

