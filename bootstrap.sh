#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

dnf install -y vim git tmux python3-devel conda /usr/bin/ag node npm gpg golang wireshark ffmpeg vlc rsync sakura

dnf install -y @development-tools

dnf copr enable atim/lazygit -y
dnf install lazygit

# also https://github.com/EmixamPP/linux-enable-ir-emitter
dnf copr enable principis/howdy-beta
dnf --refresh install howdy

dnf copr enable atim/starship
dnf install starship

echo "alias podman=docker >> ~/.bashrc"

curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/main/doc/contact%40zerotier.com.gpg' | gpg --import &amp;&amp; \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | bash; fi

