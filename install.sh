#!/bin/bash 

# initial installation script

DISK="/dev/sda"
PARTITION="${DISK}1"

# checking for internet connection (redundant, if the script was downloaded via wget, but just to be sure)
wget -q --spider http://archlinux.org
if [ $? -eq 0 ]; then
    echo Internet connection is present. Continuing ...
else
    echo No Internet connection! Exiting ...
    exit 1
fi

read -p "This is the installation script with low-level modifications. Are you sure you want to continue? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then

    timedatectl set-ntp true

    # partitioning and mounting disk
    echo DISK="$DISK", PARTITION="$PARTITION"

    parted -s "$DISK" mklabel msdos
    parted -s -a optimal "$DISK" mkpart primary ext4 0% 100%
    parted -s "$DISK" set 1 boot on
    mkfs.ext4 -F "$PARTITION"

    mount "$PARTITION" /mnt

    # installation
    echo 'Server = http://mirror.internode.on.net/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
    pacman -Syy

    pacstrap /mnt base base-devel emacs grub ntp openssh sudo wget
    genfstab -U /mnt >> /mnt/etc/fstab

    wget https://raw.githubusercontent.com/roxolan/vk-arch/master/chroot.sh
    chmod +x ./chroot.sh
    cp -p ./chroot.sh /mnt
    # cp ~/.ssh/authorized_keys /mnt

    arch-chroot /mnt ./chroot.sh "$DISK"
    rm /mnt/chroot.sh
    # rm /mnt/authorized_keys

    umount -R /mnt
    systemctl reboot

    # installing oh-my-zsh is postponed until git is present in the system
    # sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

fi
