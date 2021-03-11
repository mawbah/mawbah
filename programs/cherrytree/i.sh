#!/bin/bash
## cherrytree
## записная книга на основе sqlite
if [[ -z "$( pacman -Qi yay )" ]]; then
    source ${Path_Install}/programs/yay/i.sh
fi

yay -S --useask cherrytree
sed -i "s/mawbah/${Name_User}/g" ${Path_Install}/programs/cherrytree/cherrytree/config.cfg
cp -r ${Path_Install}/programs/cherrytree/cherrytree /home/${Name_User}/.config/
