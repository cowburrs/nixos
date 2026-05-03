#!/usr/bin/env bash

if [[ "$(hyprctl dispatch focuswindow $1)" != "ok" ]]; then # if it actually moved workspace
    $2
else
    play ~/.config/hypr/extra/sfx/WORKSPACE-MOVE.wav trim 0.025 vol 0.025 pitch $((RANDOM % 150 - 100)) # Play slightly depitched noise
fi
