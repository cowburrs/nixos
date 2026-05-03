#!/usr/bin/env bash
if ! pgrep -x wlogout >/dev/null; then
    play ~/.config/hypr/extra/sfx/WLOGOUT-START.wav vol 0.02 &
    wlogout --margin-left 600 --margin-right 600 --margin-bottom 325 --margin-top 325
    play ~/.config/hypr/extra/sfx/WLOGOUT-FINISH.wav vol 0.02 
	else
		pkill wlogout
fi
