#!/bin/bash
## xorg
## графическая подсистема Linux
source ${PATH_INSTALL}/mawbah.conf
source ${PATH_INSTALL}/progs/VGA/i.sh
pacman -S --noconfirm xorg-server # сами Иксы
pacman -S --noconfirm xorg-xrdb # менеджер настройки иксов
