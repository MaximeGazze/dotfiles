#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --time-style=+%Y-%m-%d'
alias ip='ip -c'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias npm='pnpm'
alias npx='pnpx'
alias ssh='TERM=xterm-256color ssh'

PS1='\W \$ '
