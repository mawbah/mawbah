#!/bin/bash
## cmus
## консольный аудиопроигрыватель
pacman -S --noconfirm cmus
pacman -S --noconfirm libmad
cp -r ${PATH_INSTALL}/progs/cmus/cmus /home/${UN}/.config/
