#!/bin/sh
# собираем информацию о системе:

## set path for scripts
[[ "${HOME}" != "/root" ]] && export REPO="${HOME}"
export PATH_INSTALL="${REPO}/mawbah.github.io-master/mawbah"

## delete the old installation dirs and files (if they are)
rm -rf ${HOME}/master.zip* ${REPO}/mawbah.github.io-master*

## if there is no wget, then install it
[[ -z "$( pacman -Qi wget )" ]] && pacman -Sy --noconfirm wget && WGET_INSTALL="wget"

## download archive with scripts
wget -P ${HOME}/ https://github.com/mawbah/mawbah.github.io/archive/master.zip

## if there is no unzip, then install it
[[ -z "$( pacman -Qi unzip )" ]] && pacman -Sy --noconfirm unzip && UNZIP_INSTALL="unzip"

## unpack arcive
unzip ${HOME}/master.zip -d ${REPO}/

## if it wasn't befor, then delete unzip
[[ -n "${UNZIP_INSTALL}" ]] && pacman -R --noconfirm unzip

## if it wasn't befor, then delete wget
[[ -n "${WGET_INSTALL}" ]] && pacman -R --noconfirm wget

## delete archive 
rm -rf ${HOME}/master.zip*

## config localization
export R='\e[0;31m'
export NC='\e[0m'

export DELAY=100
export RATE=1000 
export GRAPHICS_ADAPTER_DRIVER=""
export CONSOLE_FONT=""
export LOCAL_TIME=true
export NTP=true
export RP=""
export UN="root"
export UP=""
export HOSTNAME="host"
export MODE=""
export SLICING_TEMPLATE=""
export BOOT_PART=""
export GIT_USER_NAME="mawbah"
export GIT_USER_EMAIL=""

export COUNTRY="Russia"
export COUNTRY_SHORTNAME="RU"
export LOCALE1="en_EN"
export LOCALE2="ru_RU"
export LOCALE3="reserve"
export SYSTEM_LOCALE="LANG=ru_RU.UTF-8"
export CONSOLE_KEYMAP="ruwin_ct_sh-UTF-8"
export X11_KEYMAP_LAYOUT="us,ru"
export X11_KEYMAP_MODEL="pc104"
export X11_KEYMAP_VARIANT="-"
export X11_KEYMAP_OPTIONS="grp:shifts_toggle,terminate:ctrl_alt_bksp,grp_led:scroll"
#export DEFAULT_FONT="UniCyr_8x16"
export DEFAULT_FONT="cyr-sun16"
export TIME_ZONE="Asia/Vladivostok"

export Q01="выберите действие: " 
export Q02="далее" 
export Q03="назад" 
export Q04="выход" 
export Q05="повторите ввод"
export Q06="ошибка!"
export Q07=" -> "

export Q0="Главное меню"

export Q1="установка операционной системы" 
    export Q1P=""
    export Q1E="ПРИСТУПИТЬ К УСТАНОВКЕ ОПЕРАЦИОННОЙ СИСТЕМЫ?(y/n)"
    export Q11="разделы" 
        export Q110="конфигурация разделов: " 
        export Q111="ручная настройка"
            export Q11111="выберите диск: "
            export Q11121="выберите раздел: "
            export Q11122="выберите файловую систему: "
            export Q11123="введите новое имя раздела: "
            export Q11131="выберите раздел: "
            export Q11132="выберите точку монтирования: "
            export Q11133="задать другую"
            export Q11134="выбрать заданную"
            export Q11135="заданная точка монтирования: "
            export Q11136="выберите директорию: "
        export Q112="пароль суперпользователя" 
        export Q113="имя пользователя" 
        export Q114="nароль пользователя" 
        export Q115="имя компьютера" 
    export Q12="RAID" 
    export Q13="LVM" 

export Q2="установка программ" 
    export Q2E="ПРИСТУПИТЬ К УСТАНОВКЕ ПРОГРАММ?(y/n)"
    export Q20="выберите список устанавливаемых программ: "
        export Q200="выберите драйвер для видеокарты: "
        export Q201="другой" 
    export Q21="базовый"
    export Q22="стандарный"
    export Q23="для сервера"
    export Q24="составить свой список"
        export Q240="выберите программу: "
            export Q240E="ВНИМАНИЕ! ДАННЫЙ ПАКЕТ КРИТИЧЕСКИ ВАЖЕН ДЛЯ УСПЕШНОЙ ИНСТАЛЛЯЦИИ ОПЕРАЦИОННОЙ СИСТЕМЫ. ВЫ ДЕЙСТВИТЕЛЬНО ХОТИТЕ ЕГО УДАЛИТЬ?(y/n)"

export Q3="прочие операции" 
    export Q31="настройка зеркал" 
    export Q32="настройка сети" 
    export Q33="драйвер GPU" 
        export Q33E="УСТАНОВИТЬ ДРАЙВЕР ВИДЕОКАРТЫ?(y/n)"

## exec start script
source ${PATH_INSTALL}/start.sh
