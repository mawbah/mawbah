#!/bin/bash
## настройка udev 
## управление устройствами
cp 10-usb_mount.rules /etc/udev/rules.d/10-usb_mount.rules
cp usb_mount@.service /etc/systemd/system/usb_mount@.service
cp usb_mount.sh /usr/bin/usb_mount.sh

cp 10-cd_mount.rules /etc/udev/rules.d/10-cd_mount.rules
cp cd_mount@.service /etc/systemd/system/cd_mount@.service
cp cd_mount.sh /usr/bin/cd_mount.sh

udevadm control --reload-rules
systemctl daemon-reload
