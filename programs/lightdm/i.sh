#!/bin/bash
## lightdm
## дисплей менеджер
pacman -S --noconfirm  lightdm-gtk-greeter
systemctl enable lightdm
