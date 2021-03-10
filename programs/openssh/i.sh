#!/bin/bash
## openssh
## прогаммы для ssh
pacman -S --noconfirm openssh
cp -r ${Path_Install}/programs/openssh/.ssh /home/${Name_User}/
sed -i "s/^host:.*$/        host: ${Name_Host}/" /home/${Name_User}/.ssh/authorized_keys/ssh_banner
sed -i "s/^AllowUsers.*$/AllowUsers ${Name_User}/;s/^HostKey.*$/HostKey \/etc\/ssh\/ssh_${Name_Host}_rsa_key/" /home/${Name_User}/.ssh/authorized_keys/sshd_config
mv /home/${Name_User}/.ssh/authorized_keys/* /etc/ssh/
rm /etc/ssh/ssh_${Name_Host}*
ssh-keygen -t rsa -f /etc/ssh/sss_${Name_Host}_rsa_key -N "" -q
systemctl enable sshd
