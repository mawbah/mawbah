#!/bin/bash
## rtorrent
## торрент-клиент
pacman -S --noconfirm rtorrent
sed -i "s/mawbah/${Name_User}/g" ${Path_Install}/programs/rtorrent/.rtorrent.rc
cp -r ${Path_Install}/programs/rtorrent/.rtorrent.rc /home/${Name_User}/
