#!/usr/bin/env bash

if [[ "$(hyprctl dispatch workspace "$@")" == "ok" ]]; then # if it actually moved workspace
    play ~/.config/hypr/extra/sfx/WORKSPACE-MOVE.wav trim 0.025 vol 0.025 pitch $((RANDOM % 150 - 100)) # Play slightly depitched noise
fi
