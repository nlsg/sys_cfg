#!/usr/bin/env python3
from os import popen, system

hidden_windows = popen("bspc query -N -d focused -n .hidden.window") \
    .read().split("\n")[:-1]

if len(hidden_windows) == 0:
    system("bspc node --flag hidden=on")
else:
    for window in hidden_windows:
        system(f"bspc node {window} --flag hidden=off")
if len(hidden_windows) == 1:
    system(f"bspc node {hidden_windows[0]} -f")
