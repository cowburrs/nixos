burrsstow() {
	stow -d ~/stow burrs -v "$@"
}
stowcp() {
    if [ $# -lt 1 ]; then
        echo "Usage: stowcp <file-or-dir> [dest-stow-package]"
        return 1
    fi

    local src="$1"
    local pkg="${2:-burrs}"  # optional package name, default if not specified
    local homedir="$HOME"
    local stowdir="$homedir/stow"
    # Make sure the source exists
    if [ ! -e "$src" ]; then
        echo "Source '$src' does not exist."
        return 1
    fi

    # Compute path relative to home
    local rel
    rel=$(realpath --relative-to="$homedir" "$src") || return 1

    # Destination path
    local dest="$stowdir/$pkg/$rel"

    # Ensure parent directories exist
    mkdir -p "$(dirname "$dest")"

    # Copy using rsync
    rsync -avL "$src" "$dest"
}
