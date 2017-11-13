#!/bin/bash

sudo pacman -Syu --noconfirm reflector \
     xf86-video-intel libva-intel-driver \
     xorg-server xorg-apps \
     acpi lm_sensors \
     aspell-en aspell-uk \
     htop lsof tree \
     tmux zsh \
     rsync unzip zlib  \
     bind-tools net-tools \
     curl httpie iftop links \
     the_silver_searcher \
     terminus-font \
     xclip xterm \
     haveged \
     python python2 

# set zsh as default shell
chsh -s $(which zsh)

# install yaourt

# install ncurses 5 compatibility

# enable reflector periodic job

# configure time synchronization

# generates system entropy

# checkout and activate dotfiles

echo foundation - made zsh default sh

