source ~/.config/bashrc/plugins/tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
# FZF_COMPLETION_AUTO_COMMON_PREFIX=true
# FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true
#
# Load bash-completion
[[ -r /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
export FZF_DEFAULT_OPTS='--height=10% --layout=reverse --info=inline --border'
# complete -o dirnames -o default -o bashdefault -F _fzf_bash_completion cd

