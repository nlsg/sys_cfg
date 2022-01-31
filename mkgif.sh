#!/bin/bash

read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
TMP_AVI=$(mktemp /tmp/outXXXXXXXXXX.avi)

ffmpeg -s "$W"x"$H" -y -f x11grab -i :0.0+$X,$Y -vcodec huffyuv -r 25 $TMP_AVI 

convert -set delay 5 -layers Optimize $TMP_AVI out.gif 
