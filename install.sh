# initial installation script

DISK="/dev/sda"
PARTITION="${DISK}1"

# checking for internet connection (redundant, if the script was downloaded via wget, but just to be sure)
wget -q --spider http://archlinux.org
if [ $? -eq 0 ]; then
    echo "Internet connection is present. Continuing ..."
else
    echo "No Internet connection! Exiting ..."
    exit 1
fi

timedatectl set-ntp true

# partitioning and mounting disk
echo DISK="$DISK", PARTITION="$PARTITION"

parted -s "$DISK" mklabel gpt
parted -s -a optimal "$DISK" mkpart primary ext4 0% 100%
parted -s "$DISK" set 1 boot on
mkfs.ext4 -F "$PARTITION"

mount "$PARTITION" /mnt

echo 'Server = http://mirror.internode.on.net/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
pacman -Syy



# installing oh-my-zsh is postponed until git is present in the system
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
