#!/bin/bash

sudo pacman -Syu --noconfirm \

     # install video driver
     xf86-video-intel \
     lib32-mesa-libgl \
     libva-intel-driver \

     # install X.Org server
     xorg-server \
     xorg-server-utils

echo foundation - installed intel video driver and some libraries with newline symbols & separators
