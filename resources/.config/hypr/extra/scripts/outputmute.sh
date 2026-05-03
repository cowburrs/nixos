#!/usr/bin/env bash
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && \
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && \
    hyprctl notify 2 2000 0xfff38ba8 "Audio muted" || \
    hyprctl notify 1 2000 0xffa6e3a1 "Audio unmuted"
