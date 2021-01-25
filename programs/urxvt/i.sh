#!/bin/bash
## rxvt-unicode 
## эмулятор терминала
pacman -S --noconfirm rxvt-unicode 
cp -r ${PATH_INSTALL}/progs/urxvt/.Xresources /home/${UN}
xrdb /home/${UN}/.Xresources
