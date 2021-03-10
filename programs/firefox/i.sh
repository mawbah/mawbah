#!/bin/bash
## mozilla firefox 
## оконный интернет браузер
pacman -S --noconfirm firefox
cp -r ${Path_Install}/programs/firefox/.mozilla /home/${Name_User}/
