#!/bin/bash

sudo pacman -Syu --noconfirm \
     # install video driver
     xf86-video-intel \
     lib32-mesa-libgl \
     libva-intel-driver \

     # install X.Org server
     xorg-server \
     xorg-server-utils \

     zlib \

     # spell checkers
     aspell-en \
     aspell-uk


echo foundation - installed intel video driver and some libraries with newline symbols and separators

