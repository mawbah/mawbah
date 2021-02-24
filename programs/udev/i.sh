#!/bin/bash
## настройка udev 
## управление устройствами
cp *.rules /etc/udev/rules.d/*.rules
cp *.service /etc/systemd/system/*.service
cp *.sh /usr/bin/*.sh

udevadm control --reload-rules
systemctl daemon-reload
