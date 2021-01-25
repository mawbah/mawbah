#!/bin/bash
## openssh
## прогаммы для ssh
pacman -S --noconfirm openssh
cp -r ${PATH_INSTALL}/progs/openssh/.ssh /home/${UN}/
sed -i "s/^host:.*$/        host: ${HOSTNAME}/" /home/${UN}/.ssh/authorized_keys/ssh_banner
sed -i "s/^AllowUsers.*$/AllowUsers ${UN}/;s/^HostKey.*$/HostKey \/etc\/ssh\/ssh_${HOSTNAME}_rsa_key/" /home/${UN}/.ssh/authorized_keys/sshd_config
mv /home/${UN}/.ssh/authorized_keys/* /etc/ssh/
rm /etc/ssh/ssh_${HOSTNAME}*
ssh-keygen -t rsa -f /etc/ssh/sss_${HOSTNAME}_rsa_key -N "" -q
systemctl enable sshd
