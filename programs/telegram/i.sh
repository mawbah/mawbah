#!/bin/bash
## telegram 
## мессенджер

[[ -z "$( pacman -Qi git )" ]] && pacman -S --noconfirm git && GIT_INSTALL="ok"

git clone https://aur.archlinux.org/telegram-desktop-bin.git ${HOME}
cd ${HOME}/telegram-desktop-bin
makepkg -si

[[ -n "${GIT_INSTALL}" ]] && pacman -R --noconfirm git

cd ..
rm -rf telegram-desktop-bin
