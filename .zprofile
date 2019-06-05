emulate sh -c 'source /etc/profile'

# Environment Variables
source '/home/user/.zvars'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  startx
fi
