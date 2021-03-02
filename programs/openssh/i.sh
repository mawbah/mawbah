#!/bin/bash
## openssh
## прогаммы для ssh
pacman -S --noconfirm openssh
cp -r ${Path_Install}/programs/openssh/.ssh /home/${Name_User}/
sed -i "s/^host:.*$/        host: ${Hostname}/" /home/${Name_User}/.ssh/authorized_keys/ssh_banner
sed -i "s/^AllowUsers.*$/AllowUsers ${Name_User}/;s/^HostKey.*$/HostKey \/etc\/ssh\/ssh_${Hostname}_rsa_key/" /home/${Name_User}/.ssh/authorized_keys/sshd_config
mv /home/${Name_User}/.ssh/authorized_keys/* /etc/ssh/
rm /etc/ssh/ssh_${Hostname}*
ssh-keygen -t rsa -f /etc/ssh/sss_${Hostname}_rsa_key -N "" -q
systemctl enable sshd
