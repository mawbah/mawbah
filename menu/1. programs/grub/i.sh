#!/bin/bash
## GRUB2
## мультизагрузчик операционных систем
pacman -S --noconfirm grub
[[ -z ${BOOT_PART} ]] && echo "enter boot part: " && read < /dev/tty && BOOT_PART=${REPLY}
grub-install ${BOOT_PART}
grub-mkconfig -o /boot/grub/grub.cfg
