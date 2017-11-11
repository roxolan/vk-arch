#!/bin/bash

# install video driver
sudo pacman -Syu xf86-video-intel lib32-mesa-libgl mesa-libgl libva-intel-driver

echo foundation - installed intel video driver and some libraries
