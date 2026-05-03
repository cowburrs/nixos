nr() {
    sudo -v || return 1
    git -C ~/nixos add -A

    while true; do sudo -v >/dev/null 2>&1; sleep 60; done &
    local keepalive_pid=$!

    # Save old EXIT trap
    local old_exit_trap
    old_exit_trap=$(trap -p EXIT)

    # Set new trap
    trap "kill $keepalive_pid 2>/dev/null; $old_exit_trap" EXIT INT TERM

    # Sorry to all the pure purists out there, this is the best way to do your system.
    FLAKE_DIR=~/nixos nh os test ~/nixos#burrs --impure

    # Cleanup manually just in case
    kill "$keepalive_pid" 2>/dev/null
    trap - EXIT INT TERM
}


nrs() { # holy vibecoding motherload. sorry about this one
    sudo -v || return 1
    git -C ~/nixos add -A

    while true; do sudo -v >/dev/null 2>&1; sleep 60; done &
    local keepalive_pid=$!

    # Save old EXIT trap
    local old_exit_trap
    old_exit_trap=$(trap -p EXIT)

    # Set new trap
    trap "kill $keepalive_pid 2>/dev/null; $old_exit_trap" EXIT INT TERM

    FLAKE_DIR=~/nixos nh os switch ~/nixos#burrs --impure

    # Cleanup manually just in case
    kill "$keepalive_pid" 2>/dev/null
    trap - EXIT INT TERM
}


nrlaptop() {
    # sudo nixos-rebuild test --impure --flake ~/nixos#laptop
    sudo -v || return 1
    git -C ~/nixos add -A

    while true; do sudo -v >/dev/null 2>&1; sleep 60; done &
    local keepalive_pid=$!

    # Save old EXIT trap
    local old_exit_trap
    old_exit_trap=$(trap -p EXIT)

    # Set new trap
    trap "kill $keepalive_pid 2>/dev/null; $old_exit_trap" EXIT INT TERM

    FLAKE_DIR=~/nixos nh os test ~/nixos#laptop --impure

    # Cleanup manually just in case
    kill "$keepalive_pid" 2>/dev/null
    trap - EXIT INT TERM
}

nrslaptop() {
    # sudo nixos-rebuild switch --impure --flake ~/nixos#laptop
    sudo -v || return 1
    git -C ~/nixos add -A

    while true; do sudo -v >/dev/null 2>&1; sleep 60; done &
    local keepalive_pid=$!

    # Save old EXIT trap
    local old_exit_trap
    old_exit_trap=$(trap -p EXIT)

    # Set new trap
    trap "kill $keepalive_pid 2>/dev/null; $old_exit_trap" EXIT INT TERM

    FLAKE_DIR=~/nixos nh os switch ~/nixos#laptop --impure

    # Cleanup manually just in case
    kill "$keepalive_pid" 2>/dev/null
    trap - EXIT INT TERM
}

ngc() {
    nh clean all --keep 3
}

ngl() {
    nh os info
}

nhs() {
    nh search "$@"
}

yay() {
    if [ "$1" = "-S" ]; then
        shift

        args=""
        for pkg in "$@"; do
            args="$args nixpkgs-unstable#$pkg"
        done

        NIXPKGS_ALLOW_UNFREE=1 nix shell $args --impure
    fi
}
yay() {
    if [ "$1" = "-S" ]; then
        shift
        args=""
        for pkg in "$@"; do
            args="$args nixpkgs-unstable#$pkg"
        done
        NIXPKGS_ALLOW_UNFREE=1 nix shell $args --impure --command bash --rcfile <(echo 'source ~/.bashrc; PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "')
    fi
}
# export PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "

apt() {
    if [ "$1" = "install" ]; then
        shift
        args=""
        for pkg in "$@"; do
            args="$args nixpkgs#$pkg"
        done
        nix shell $args --command bash --rcfile <(echo 'source ~/.bashrc; PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "')
    fi
}

# export PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "

dnf() {
    if [ "$1" = "install" ]; then
        ~/.config/bashrc/scripts/fedora
    fi
}

