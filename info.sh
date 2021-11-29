#!/usr/bin/sh
echo "---info.sh---"
free -h | awk '/^Mem:/ {print $3 "/" $2}'
echo "-------------"
sensors | awk '/^temp1/ {print $2}'
echo "-------------"
ps axch -o cmd:15,%mem --sort=-%mem | head
echo "-------------"
ps axch -o cmd:15,%cpu --sort=-%cpu | head

