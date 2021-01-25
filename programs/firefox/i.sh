#!/bin/bash
## mozilla firefox 
## оконный интернет браузер
pacman -S --noconfirm firefox
cp -r ${PATH_INSTALL}/progs/firefox/.mozilla /home/${UN}/
