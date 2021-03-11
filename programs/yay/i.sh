#!/bin/bash
## yay 
## менеджер пакетов для AUR

[[ -z "$( pacman -Qi git )" ]] && pacman -S --noconfirm git && GIT_INSTALL="ok"

git clone https://aur.archlinux.org/yay.git ${HOME}
cd ${HOME}/yay
makepkg -si

[[ -n "${GIT_INSTALL}" ]] && pacman -R --noconfirm git

cd ..
rm -rf yay
