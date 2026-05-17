#!/usr/bin/env bash
if ! pgrep -f ".hyprshot-wrapped" >/dev/null; then
    play ~/.config/hypr/extra/sfx/SCREENSHOT-START.wav vol 0.05 &
    hyprshot -m region --clipboard-only --freeze
    play ~/.config/hypr/extra/sfx/SCREENSHOT-FINISH.wav vol 0.05
fi
