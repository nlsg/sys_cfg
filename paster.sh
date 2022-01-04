#!/bin/sh

SNIPS=${HOME}/sys_cfg/snippets

FILE=$(ls ${SNIPS} | rofi -dmenu)

if [ -f ${SNIPS}/${FILE} ]; then
  DATA=$([ -x ${SNIPS}/${FILE} ] && bash "${SNIPS}/${FILE}" || head --bytes=-1 ${SNIPS}/${FILE})
  printf "${DATA}" | xsel -p -i
  printf "${DATA}" | xsel -b -i
  xdotool key shift+Insert
fi
