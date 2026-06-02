todo() {
    lua $HOME/Repositories/Taskmanger/src/main.lua "$@"
}
tododone() {
    nvim $HOME/Repositories/Taskmanger/done.json
}
todotasks() {
    nvim $HOME/Repositories/Taskmanger/todo.json
}

burrscryfs() {
    cryfs $HOME/Repositories/resources/cryfs $HOME/Repositories/resources-unencrypted
}

burrsgs() {
    lua $HOME/.config/bashrc/scripts/burrsgs.lua "$@"
}
school() {
	nix develop ~/Repositories/School/.
}
