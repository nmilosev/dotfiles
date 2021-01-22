# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias nvidia-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"'
# Set font when running in console
if [ $TERM == linux ]; then
    /bin/setfont /usr/share/consolefonts/Lat2-Terminus32x16.psf.gz
fi


alias nvidia-deactivate="sudo mv /etc/modprobe.d/blacklist.conf.inactive /etc/modprobe.d/blacklist.conf && echo 'nvidia deactivated (blocked), reboot'"
alias nvidia-activate="sudo mv /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.inactive && echo 'nvidia active, reboot'"
alias vimode="set -o vi && bind 'set show-mode-in-prompt on' && bind 'set editing-mode vi'"
alias fujitsu="xrandr --output eDP-1 --auto --pos 3840x0  --output DP-1 --scale 2.0x2.0 --auto --pos 0x0 --fb 7680x2160 && xrandr --output eDP-1 --scale 0.9999x0.9999"
export EDITOR=vim
alias nvidia-full-off="sudo bash -c 'modprobe acpi_call && /opt/turn_off_gpu.sh'"

shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
