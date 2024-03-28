# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

. "$HOME/.cargo/env"


# Autostart ssh-agent and add SSH keys
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add \
            ~/.ssh/github;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
# -- ENDOF ssh-agent initialisation

[ -f "/home/user/.ghcup/env" ] && source "/home/user/.ghcup/env" # ghcup-env

EDITOR="nvim"

# General aliases
alias vim="nvim"
alias upd="sudo dnf upgrade; flatpak update"

# Git aliases
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpsh="git push"
alias gpl="git pull"
alias gl="git log"
alias gch="git checkout"
