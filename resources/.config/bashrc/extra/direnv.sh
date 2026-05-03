#!/usr/bin/env bash

ALLOW_DIR="$HOME/.local/share/direnv/allow"

direnvlist() {
    for f in "$ALLOW_DIR"/*; do
        [ -e "$f" ] || continue
        cat "$f"
    done
}
