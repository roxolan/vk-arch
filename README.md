# Installing & setting up Arch-Linux-based machine

## General remarks

This walkthrough sequence presumes installing Arch Linux as a personally finetuned development environment machine made available as a guest machine on VirtualBox.

Inspiration and ideas for this sequence are drawn in a personal manner and with pesonal selectivity from the following sources:
* [Arch Linux Wiki](https://www.archlinux.org/)
* [Arch Linux guide: the always up-to-date Arch Linux tutorial](https://gist.github.com/danifr/e666009ee3cce57af951d872cb6eec4f#file-arch_linux_guide-md)


## INSTALLATION

Roughly following [Installation guide](https://wiki.archlinux.org/index.php/Installation_guide) from Arch Linux Wiki.

### Virtual Machine Settings

[Download the latest ISO image of Arch Linux](https://www.archlinux.org/download/) and launch 64-bit based virtual machine installation on VirtualBox.

After having completed the standard settings fof the virtual machine, launch it and select (default) option to load as Arch Linux LiveCD. It will ultimately present zsh-based console with root access.

### Initial Install

Enter manually in the root-level command line:
```
# wget https://raw.githubusercontent.com/roxolan/vk-arch/master/install.sh

# sh install.sh
```

### Post-Install Steps

After initial install has been accomplished successfully, you can disconnect Archiso and load from the system's HD. 

#### Root and Regular User Passwords

Set passwords for root and regular users:
```
# passwd
# passwd {user}
```

#### loadkeys (very optional)

Most of the times this is not needed, but if for whatever reason you would like to set a specific keyboard set, this can be done with **loadkeys**. To set keyboard to some specific set, e.g. German:

`# loadkeys de-latin1`

To set keyboard back to default (US), which is also built in into the ISO image:

`# loadkeys -d`

## SETUP

### Clone and Run Setup Scripts

Clone this repo to a separate directory under root user:
```
# cd ~ && git clone https://github.com/roxolan/vk-arch setup
```

Run the bootstrap script:
```
# cd setup && sh bootstrap.sh
```
