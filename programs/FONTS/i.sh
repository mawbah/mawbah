#!/bin/bash
## шрифты
##
pacman -S --noconfirm terminus-font # шрифты Terminus
#pacman -S --noconfirm ttf-droid # шрифты Droid
#pacman -S --noconfirm ttf-dejavu # шрифты Dejavu
#pacman -S --noconfirm ttf-liberation # шрифты Liberation
#pacman -S --noconfirm ttf-font-awesome # шрифтовые иконки
sed -i "s|^CONSOLE_FONT=.*|CONSOLE_FONT=\"FONT=ter-v20n\"|" ${PATH_INSTALL}/mawbah.conf
