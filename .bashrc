#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -lah'
alias ip='ip -c'
alias gitc='git config --global credential.helper store'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export PNPM_HOME="/home/max/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/home/max/.cargo/bin:$PATH"

PS1='\W \$ '

