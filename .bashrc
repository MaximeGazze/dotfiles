#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah'
alias ip='ip -c'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias npm='pnpm'

# PNPM
export PNPM_HOME="/home/max/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

# RUST
export PATH="$PATH:/home/max/.cargo/bin"

# GO
export PATH=$PATH:$(go env GOPATH)/bin

PS1='\W \$ '
