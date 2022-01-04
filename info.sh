#!/usr/bin/sh

#for path in $PATH -> (ls | wc)
echo "---path---"
clear & echo $PATH | sed 's|:|\n|g' | xargs -i  sh -c 'echo -e "[_]$(tput bold){}[_]->ls wc: $(tput sgr0)" ; ls {} | wc ' | awk 'ORS=NR%2?" |":"\n"' |  sed -e 's|\n||g' -e 's|\[_\]|\n|g' | grep -E '^|/.*' | sed -z -e 's|>\n|>|g' -e 's|\n\n|\n|g' -e's/|//g' | grep -E '^|/.*'

echo "---info.sh---"
free -h | awk '/^Mem:/ {print $3 "/" $2}'
echo "---temp------"
sensors | awk '/^temp1/ {print $2}'
echo "---mem-------"
ps axch -o cmd:15,%mem --sort=-%mem | head
echo "---cpu-------"
ps axch -o cmd:15,%cpu --sort=-%cpu | head

#handy pkg to format output to a table 
# | column -s " | " 

upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percent|time" | sed -z 's|\n| |g' |  awk '{print $7} {print " - "} {print$4} {print "h"}'  | sed -z 's|\n| |g' 

clear




clear & echo $PATH | sed 's|:|\n|g' | xargs ls | grep xfce4 |rofi -dmenu 
clipy

