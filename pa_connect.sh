#!/usr/bin/bash
IP=$(nmap 192.168.43.66/24 | grep 192 | tail -n +2 | awk '{print $5}' )
echo
echo $IP
pa_stream.sh $IP 
