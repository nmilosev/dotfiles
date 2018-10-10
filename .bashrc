# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vpn='sudo sysctl net.netfilter.nf_conntrack_helper=1'
export EDITOR='vim'
source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='\w\[\033[0;32m\]$(__git_ps1)\[\033[0;32m\]\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] \[\033[0m\]'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ledson='sudo tee /sys/devices/LNXSYSTM:00/LNXSYBUS:00/TOS1900:00/kbd_backlight_mode <<< 8 && sudo tee /sys/class/leds/toshiba\:\:illumination/brightness <<< 255'
alias ledsoff='sudo tee /sys/devices/LNXSYSTM:00/LNXSYBUS:00/TOS1900:00/kbd_backlight_mode <<< 16 && sudo tee /sys/class/leds/toshiba\:\:illumination/brightness <<< 0'

alias cuda='export LD_LIBRARY_PATH=/usr/lib64/nvidia/:/usr/local/cuda-8.0/lib64'

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

#projekti

alias sac="cd ~/Projects/biosense/SmartAgroClaim && git status"

alias nvidiareload="su -c 'echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove && echo 1 > /sys/bus/pci/rescan'"
alias optirun="optirun -b primus"

export CUDA_HOME=$HOME/cuda-dummy
. /home/nmilosev/miniconda3/etc/profile.d/conda.sh

alias python=python3