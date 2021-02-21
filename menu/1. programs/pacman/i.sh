#!/bin/bash
## pacman
## 
sed -i "s/#Color/Color/g" /etc/pacman.conf
sed -i "s/#\[multilib\]/\[multilib\]/g" /etc/pacman.conf
sed -i "s/#Include = /etc/pacman.d/mirrorlist/Include = /etc/pacman.d/mirrorlist/g" /etc/pacman.conf
