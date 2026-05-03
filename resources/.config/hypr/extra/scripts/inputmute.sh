#!/usr/bin/env bash
volume=0.8
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED; then
    play ~/.config/hypr/extra/sfx/MUTE.wav vol $volume & \
        hyprctl notify 2 2000 0xfff38ba8 "Microphone muted"
else
    play ~/.config/hypr/extra/sfx/UNMUTE.wav vol $volume & \
        hyprctl notify 1 2000 0xffa6e3a1 "Microphone unmuted"
fi
