#!/usr/bin/env bash
wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+ --limit 2.0
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d%%", $2*100}')
hyprctl dismissnotify 1
hyprctl notify 1 2000 0 "Volume: $vol"
