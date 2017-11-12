#!/bin/bash

sudo pacman -Syu --noconfirm \
     xf86-video-intel \
     lib32-mesa-libgl \
     libva-intel-driver \

     xorg-server \
     xorg-server-utils \

     zlib \

     aspell-en \
     aspell-uk


echo foundation - installed intel video driver and some libraries with newline symbols and separators

