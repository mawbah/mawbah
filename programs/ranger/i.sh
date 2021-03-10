#!/bin/bash
## ranger
## консольный файловый менеджер 
pacman -S --noconfirm ranger imlib2 w3m
cp -r ${Path_Install}/programs/ranger/ranger /home/${Name_User}/.config/
cp -r ${Path_Install}/programs/ranger/ranger /home/root/.config/
