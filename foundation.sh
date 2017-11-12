#!/bin/bash

sudo pacman -Syu --noconfirm xf86-video-intel libva-intel-driver \
     xorg-server xorg-apps \
     zlib \
     aspell-en aspell-uk \
     zsh \
     python python2 \
     htop

echo foundation - installed intel video driver and some libraries with line continuators grouped a little

