# -----------------------------------------------------
# Git
# -----------------------------------------------------
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="GIT_ASKPASS= git push"
alias gpl="git pull"
# alias gitshit="git add -A . && git commit --allow-empty-message --no-edit && git push -f"
alias gitshit="git add -A . && git commit -m 'gitshit' --no-edit && git push -f"
# alias gst="git stash"
# alias gsp="git stash; git pull"
# alias gfo="git fetch origin"
# alias gcheck="git checkout"
# alias gcredential="git config credential.helper store"
gsn() {
    local url="$1"

    # Strip prefix
    local stripped="${url#https://github.com/}"
    # stripped = user/repo/tree/branch/path/to/dir

    local repo_part="${stripped%%/tree/*}"
    local rest="${stripped#*/tree/}"
    local branch="${rest%%/*}"
    local path="${rest#*/}"
    local dest="${2:-./${path##*/}}"

    echo "repo:   https://github.com/$repo_part"
    echo "branch: $branch"
    echo "path:   $path"
    echo "dest:   $dest"

    gitsnip "https://github.com/$repo_part" "$path" "$dest" -b "$branch" "${@:3}"
}
