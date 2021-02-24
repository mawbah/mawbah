#!/bin/bash
## ranger
## консольный файловый менеджер 
pacman -S --noconfirm ranger imlib2 w3m
cp -r ${PATH_INSTALL}/progs/ranger/ranger /home/${UN}/.config/
cp -r ${PATH_INSTALL}/progs/ranger/ranger /home/root/.config/
