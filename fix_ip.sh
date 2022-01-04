#!/usr/bin/sh

nmap -sn $(ip addr | grep 192 | awk '{print $2}') | grep 192 | awk '{print $5}' > ip_info

cat ip_info
