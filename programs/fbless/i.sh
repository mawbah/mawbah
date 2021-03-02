#!/bin/bash
## fbless 
## консольный fb2-ридер
if [[ -z "$( pacman -Qi yay )" ]]; then
    source ${Path_Install}/progs/yay/i.sh
fi

yay -S --useask fbless
