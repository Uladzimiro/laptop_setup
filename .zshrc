git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null)
	if [[ -n $ref ]]; then
		echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
	fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

export TERM="screen-256color"
alias tmux="tmux -2"

# setopt hist_ignore_all_dups inc_append_history
# HISTFILE=~/.zhistory
# HISTSIZW=4096
# SAVEHIST=4096

# Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zhistory
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
