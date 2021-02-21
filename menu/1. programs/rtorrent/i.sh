#!/bin/bash
## rtorrent
## торрент-клиент
pacman -S --noconfirm rtorrent
sed -i "s/mawbah/${UN}/g" ${PATH_INSTALL}/progs/rtorrent/.rtorrent.rc
cp -r ${PATH_INSTALL}/progs/rtorrent/.rtorrent.rc /home/${UN}/
