#!/usr/bin/bash
# https://github.com/wenxin-wang/PulseDroidRtp/
pactl unload-module module-null-sink
pactl unload-module module-rtp-send
pactl load-module module-null-sink sink_name=rtp format=s16be channels=2 rate=48000
pactl load-module module-rtp-send source=rtp.monitor destination=$1 port=4010 mtu=320
