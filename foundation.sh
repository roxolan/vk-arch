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
mkdir -p $HOME/tmp/aur
cd $HOME/tmp/aur
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si --noconfirm
cd ..
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si --noconfirm
cd $HOME
rm -rf $HOME/tmp/aur

# install ncurses 5 compatibility
gpg --keyserver keys.gnupg.net --recv-keys 702353E0F7E48EDB
yaourt -S ncurses5-compat-libs

# enable reflector periodic job

# configure time synchronization

# generates system entropy

# checkout and activate dotfiles

echo foundation - made zsh default sh

