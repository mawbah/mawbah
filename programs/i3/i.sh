#!/bin/bash
## i3 
## тайлвый оконный менеджер
pacman -S --noconfirm i3-wm # оконный менеджер
cp -r ${Path_Install}/programs/i3/i3 /home/${Name_User}/.config

pacman -S --noconfirm dmenu # меню

pacman -S --noconfirm i3status # строка состояния
cp -r ${Path_Install}/programs/i3/i3status /home/${Name_User}/.config
