#!/bin/bash 

git submodule init
git submodule update

./foundation.sh
./desktop_environment.sh
