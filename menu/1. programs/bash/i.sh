#!/bin/bash
## bash
## linux shell 
pacman -S --noconfirm bash
cp -r ${PATH_INSTALL}/progs/bash/.bash* /home/${UN}/
cp -r ${PATH_INSTALL}/progs/bash/.bash* /root
