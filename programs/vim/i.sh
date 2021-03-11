#!/bin/bash
## vim
## консольный текстовый редактор

#установка vim без подтверждения
pacman -S --noconfirm vim

#копирование конфигурации (файл .vimrc)
cp .vimrc ~/.vimrc

#копирование цветовых схем
cp colors ~/.vim
