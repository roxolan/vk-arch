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
# yaourt -S ncurses5-compat-libs
# gpg --keyserver keys.gnupg.net --recv-keys 702353E0F7E48EDB

# configure time synchronization
sudo systemctl start ntpd.service
sudo systemctl enable ntpd.service
sudo timedatectl set-ntp true

# generate system entropy
sudo systemctl start haveged
sudo systemctl enable haveged

# enable reflector periodic job
echo '[Unit]
Description=Pacman mirrorlist update

[Service]
Type=oneshot
ExecStart=/usr/bin/reflector --protocol http --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist' | sudo tee /etc/systemd/system/reflector.service

echo '[Unit]
Description=Run reflector weekly

[Timer]
OnCalendar=weekly
AccuracySec=12h
Persistent=true

[Install]
WantedBy=timers.target' | sudo tee /etc/systemd/system/reflector.timer

sudo systemctl enable reflector.timer

# checkout and activate dotfiles
cd $HOME
git clone git@github.com:roxolan/dotfiles.git
cd dotfiles
git submodule init
git submodule update
./bootstrap
cd ../setup

echo foundation - finished running bootstrap on dotfiles & returned to setup

