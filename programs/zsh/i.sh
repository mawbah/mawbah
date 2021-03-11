#!/bin/bash
## zsh
## linux shell 
pacman -S --noconfirm zsh
cp -r ${PATH_INSTALL}/progs/zsh/.zsh* /home/${UN}/
cp -r ${PATH_INSTALL}/progs/zsh/.zsh* /root
