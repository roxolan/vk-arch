#!/bin/bash

HOST=servus
USERNAME=vk
HOME_DIR="/home/${USERNAME}"
SWAP_SIZE=4G

echo DISK="$1", HOST="$HOST", USERNAME="$USERNAME", HOME_DIR="$HOME_DIR"

# grub as a bootloader
grub-install --target=i386-pc --recheck "$1"

# make the grub timeout 0
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# run these following essential service by default
systemctl enable sshd.service
systemctl enable dhcpcd.service
systemctl enable ntpd.service

echo "$HOST" > /etc/hostname

# adding your normal user to sudoers
useradd -m -G wheel -s /bin/bash "$USERNAME"

# adding public key both to root and user for ssh key access
# mkdir -m 700 "$HOME_DIR/.ssh"
# mkdir -m 700 /root/.ssh
# cp /authorized_keys "/$HOME_DIR/.ssh"
# cp /authorized_keys /root/.ssh
# chown -R "$USERNAME:$USERNAME" "$HOME_DIR/.ssh"

# adjust timezone
ln -f -s /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc

# adjust your name servers here if you don't want to use google
echo 'name_servers="8.8.8.8 8.8.4.4"' >> /etc/resolvconf.conf
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
locale-gen

# make sudo not ask for passwords
echo 'root ALL=(ALL) ALL' > /etc/sudoers
echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

echo -e 'EDITOR=emacs' > /etc/environment

# creating the swap file, if you have enough RAM, this step can be skipped
fallocate -l "$SWAP_SIZE" /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo /swapfile none swap defaults 0 0 >> /etc/fstab

# auto-complete essential commands
echo complete -cf sudo >> /etc/bash.bashrc
echo complete -cf man >> /etc/bash.bashrc

echo chroot was completed fully!
