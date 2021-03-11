#!/bin/bash
## rxvt-unicode 
## эмулятор терминала
pacman -S --noconfirm rxvt-unicode 
cp -r ${Path_Install}/programs/urxvt/.Xresources /home/${Name_User}
xrdb /home/${Name_User}/.Xresources
