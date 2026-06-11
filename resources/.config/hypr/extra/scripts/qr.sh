#!/usr/bin/env bash
# Dependencies: tesseract imagemagick wl-clipboard hyprshot lib-notify
# Script i stole from the internet.

die() {
    notify-send "$1"
    play ~/.config/hypr/extra/sfx/NOTIFICATION.wav vol 0.05
    exit 1
}
cleanup() {
    [[ -n $1 ]] && rm -r "$1"
}

SCR_IMG=$(mktemp -d) || die "failed to create tmpdir"

# shellcheck disable=SC2064
trap "cleanup '$SCR_IMG'" EXIT

pgrep -f ".hyprshot-wrapped" && die "currently running ocr"

play ~/.config/hypr/extra/sfx/SCREENSHOT-START.wav vol 0.05 &
hyprshot --freeze -m region -f scr.png --silent -o $SCR_IMG
play ~/.config/hypr/extra/sfx/SCREENSHOT-FINISH.wav vol 0.05

zbarimg -q --raw "$SCR_IMG/scr.png" | wl-copy
notify-send "Text extracted from image" || die "failed to send notification"
play ~/.config/hypr/extra/sfx/NOTIFICATION.wav vol 0.05
exit
