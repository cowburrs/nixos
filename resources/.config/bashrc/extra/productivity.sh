pomodoro() {
    local subject=${1:-"Placeholder"}
    local work=${2:-50m}
    local rest=${3:-10m}
    local repeats=${4:-1}
    local log_file="$HOME/.config/.pomodoro_log.txt"
    local starttime="$(date '+%Y-%m-%d %H:%M:%S')"
    local workendtime=""

    for ((i=1; i<=repeats; i++)); do
        timer -n "POMODORO $i" $work
        notify-send "Pomodoro Finished"
        hyprctl dispatch exec play ~/.config/hypr/extra/sfx/POMODORO_FINISH.wav vol 1 >/dev/null

        workendtime="$(date '+%H:%M:%S')"
        timer -n "POMODORO BREAK $i" $rest
        notify-send "Break Finished"
        hyprctl dispatch exec play ~/.config/hypr/extra/sfx/POMODORO-BREAK-END.wav vol 1 >/dev/null
    done
    echo "$starttime $workendtime $(date '+%H:%M:%S') | subject: $subject | work: $work | rest: $rest" >> "$log_file"

}
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
