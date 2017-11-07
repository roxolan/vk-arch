# initial installation script

wget -q --spider http://archlinux.org
if [ $? -eq 0 ]; then
    echo "Internet connection is present. Continuing..."
else
    echo "No Internet connection! Exitin..."
    exit 1
fi

timedatectl set-ntp true

# installing oh-my-zsh is postponed until git is present in the system
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
