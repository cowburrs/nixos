#!/usr/bin/env bash


hyprctl keyword 'windowrule[discord]:enable false'
hyprctl keyword 'windowrule[notifications]:enable false'
if ! pgrep -f ".hyprshot-wrapped" >/dev/null; then
    play ~/.config/hypr/extra/sfx/SCREENSHOT-START.wav vol 0.05 &
    hyprshot -m region --clipboard-only --freeze
    play ~/.config/hypr/extra/sfx/SCREENSHOT-FINISH.wav vol 0.05
fi
hyprctl keyword 'windowrule[discord]:enable true'
hyprctl keyword 'windowrule[notifications]:enable true'
