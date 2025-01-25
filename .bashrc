# ~/.bashrc
[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

alias sudo='sudo '
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ka="killall"
alias ls='ls -hN --color=auto --group-directories-first'
alias neofetch="fastfetch"
alias p="sudo pacman"
alias pls="pacman -Qett --color=always"
alias sdn="sudo shutdown now"
alias st="sudo -E thunar"
alias t="thunar"
alias trans="transmission-gtk"
alias v="nvim"
alias vim="nvim"
alias yt="yt-dlp"
alias yta="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0"
