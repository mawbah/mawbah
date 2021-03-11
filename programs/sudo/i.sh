#!/bin/bash
## sudo 
## предоставление пользователю привелегий рута
pacman -S --noconfirm sudo
echo -e "${Pass_Superuser}\n${Pass_Superuser}\n" | passwd
useradd -m -g users -G wheel -s /bin/bash ${Name_User}
echo -e "${Pass_User}\n${Pass_User}\n" | passwd ${Name_User}
sed -i "s/^.*%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers 
