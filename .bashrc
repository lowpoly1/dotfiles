#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.git-prompt.sh

_gitinfo() {
	if git -C . rev-parse 2>/dev/null; then
		echo -n "\e[31mM:\e[0m $(git status --porcelain | grep ' M' | wc -l)   \e[32mM:\e[0m $(git status --porcelain | grep 'M  ' | wc -l)   \e[31mA:\e[0m $(git status --porcelain | grep '??' | wc -l)   \e[32mA:\e[0m $(git status --porcelain | grep 'A ' | wc -l)\n\e[34m├\e[0m branch: $(__git_ps1 %s)"
	else
		echo -n "\e[38;5;173mpwd not a git repository\e[0m"
	fi
}

PS1='\[\e[34m\]╭ $(_gitinfo)\n\n\e[34m╰ \e[38;5;173m$(pwd)\e[F\e[34m╞═🢖\[\e[38;5;41m\] \$ \[\e[0m\]'
PS0='\[\n\]'

shopt -s xpg_echo

CDPATH=/home/arch-btw


alias ls='test $(/bin/ls -1 | wc -l) -gt 10 && /bin/ls -Fsh --color=auto || /bin/ls -1 -Fsh --color=auto'
alias ll='/bin/ls -FlgGh --time-style +"%m/%d %I:%M" --color=auto'
alias la='test $(/bin/ls -1 -a | wc -l) -gt 10 && /bin/ls -Fsha --ignore=.. --color=auto || /bin/ls -1 -Fsha --ignore=.. --color=auto'
alias lla='/bin/ls -FlgGha --time-style +"%m/%d %I:%M" --ignore=.. --color=auto'
alias lal='lla'

alias ..='cd ..'
alias l='cd $OLDPWD'
# make directory and cd into it at the same time
md() { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }

alias cls='clear'

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export EDITOR='micro'
export VISUAL='micro'
export TERM='kitty'

if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
