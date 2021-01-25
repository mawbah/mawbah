#!/bin/bash
## sudo 
## предоставление пользователю привелегий рута
pacman -S --noconfirm sudo
echo -e "${RP}\n${RP}\n" | passwd
useradd -m -g users -G wheel -s /bin/bash ${UN}
echo -e "${UP}\n${UP}\n" | passwd ${UN}
sed -i "s/^.*%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers 
