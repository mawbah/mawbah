#!/bin/bash
## pacman
## 
sed -i "s|#\(Color\)|\1|g" /etc/pacman.conf
sed -i "s|#\(\[multilib\]\)|\1]|g" /etc/pacman.conf
sed -i "s|#\(Include = /etc/pacman.d/mirrorlist\)|\1|g" /etc/pacman.conf
