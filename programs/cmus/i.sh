#!/bin/bash
## cmus
## консольный аудиопроигрыватель
pacman -S --noconfirm cmus
pacman -S --noconfirm libmad
cp -r ${Path_Install}/programs/cmus/cmus /home/${Name_User}/.config/
