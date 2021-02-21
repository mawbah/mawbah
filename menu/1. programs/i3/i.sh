#!/bin/bash
## i3 
## тайлвый оконный менеджер
pacman -S --noconfirm i3-wm # оконный менеджер
cp -r ${PATH_INSTALL}/progs/i3/i3 /home/${UN}/.config

pacman -S --noconfirm dmenu # меню

pacman -S --noconfirm i3status # строка состояния
cp -r ${PATH_INSTALL}/progs/i3/i3status /home/${UN}/.config
