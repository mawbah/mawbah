#!/bin/bash
## cherrytree
## записная книга на основе sqlite
if [[ -z "$( pacman -Qi yay )" ]]; then
    source ${PATH_INSTALL}/progs/yay/i.sh
fi

yay -S --useask cherrytree
sed -i "s/mawbah/${UN}/g" ${PATH_INSTALL}/progs/cherrytree/cherrytree/config.cfg
cp -r ${PATH_INSTALL}/progs/cherrytree/cherrytree /home/${UN}/.config/
