#!/usr/bin/bash
xev | awk -F'[ )]+' '/^KeyPress/ {n=NR+2} NR==n { printf "%-3s %s\n", $5, $8}'
