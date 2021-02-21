#!/bin/bash
#$1 - действие udev (ACTION=="add" или ACTION=="remove")
#$2 - имя блока (sd[c-z][0-9]) #файл для логов
LOG="/var/log/udev"

#имя блока
DEV=$2

#устройство подключили
if [ "$1" = "add" ]; then
    #отметка в логах
    echo "`date` mounting /dev/${DEV}" >> ${LOG}
    #создаём директорию
    [[ -d /media/${DEV} ]] || mkdir /media/${DEV} >> ${LOG} 2>&1
    #даём на неё права всем пользователям
    chmod a+rwx /media/${DEV}
    #монтируем устройство как рут
    mount /dev/${DEV} /media/${DEV} -o umask=0000 >> ${LOG} 2>&1

#устройство отключили
elif [ "$1" = "remove" ]; then
    #отметка в логах
    echo "`date` unmounting /dev/${DEV}" >> ${LOG}
    #размонтируем
    umount /dev/${DEV} >> ${LOG} 2>&1
    #удаляем директорию
    rmdir /media/${DEV} >> ${LOG} 2>&1
fi
