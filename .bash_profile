# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
MOZ_ENABLE_WAYLAND=1
. "$HOME/.cargo/env"
