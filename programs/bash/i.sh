#!/bin/bash
## bash
## linux shell 
pacman -S --noconfirm bash
cp -r ${Path_Install}/programs/bash/.bash* /home/${Name_User}/
cp -r ${Path_Install}/programs/bash/.bash* /root
