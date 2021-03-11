#!/bin/bash
## GRUB2
## мультизагрузчик операционных систем
pacman -S --noconfirm grub
[[ -z ${Boot_Section} ]] && echo "Enter boot section: " && read < /dev/tty && Boot_Section=${REPLY}
grub-install ${Boot_Section}
grub-mkconfig -o /boot/grub/grub.cfg
