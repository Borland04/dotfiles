source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit
compinit

zstyle ':completion::complete:*' gain-privileges 1

# Aliases
setopt COMPLETE_ALIASES

alias ls='ls --color=auto'
alias ll="ls -l"
alias cfi="vim ~/.config/i3/config"
alias pikup="sudo pikaur -Syu"
# End of Aliases
