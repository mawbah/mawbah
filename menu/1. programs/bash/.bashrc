#!/bin/bash 

# проверка на интерактивность шелла
[[ $- != *i* ]] && return

HISTSIZE=10000 # размер истории команд
HISTFILESIZE=10000 # размер файла истории команд
HISTCONTROL=ignoreboth:erasedups # не сохранять дубликаты и команды начинающиеся с пробела : удалять все дубликаты из истории 
HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S:' # добавляет в файл истории команд время их исполнения

shopt -s histappend # включена история комманд
shopt -s cdspell # исправляет опечатки в путях к директориям
shopt -s dirspell # исправляет опечатки в именах директорий
shopt -s checkjobs # запрещает выход из консоли, если есть выполняющиеся процессы
shopt -s globstar # включаем глобы
shopt -s dotglob # включает в списки файлы с точкой
shopt -s histreedit # возможность редактировать команды из истории 
shopt -s cmdhist # все строки многострочной команды сохраняются в истории как одна строка
shopt -s checkwinsize # после каждой команды проверяет и размеры окна и пишет в LINES и COLUMNS

# включаем настройки vi для командной строки
set -o vi

sinf(){
date "+%A %d %B %Y %H:%M (UTC %:z)" #дата
hostnamectl
echo
echo "uptime:$(uptime | sed "s/gc up.*$//") since $(uptime -s)" #время работы
echo
w -fih | sed "s/gc^.*[0-9]*:[0-9]*, *//" #пользователи в текущий момент
echo 
#ss -tua #сетевые подключения
ip a | grep inet | grep -v "inet6" | grep -v 127.0.0.1 | sed 's/^ *inet //; s/\/.*$//' #ip локальный 
curl -s ifconfig.me || wget -O - -q icanhazip.com #ip глобальный
echo
echo
free -h #RAM 

#погода
E=$(echo -e "\u2190")
S=$(echo -e "\u2191")
W=$(echo -e "\u2192")
N=$(echo -e "\u2193")
SE=$(echo -e "\u2196")
SW=$(echo -e "\u2197")
NW=$(echo -e "\u2198")
NE=$(echo -e "\u2199")
# убрать ошибку если нет ip
curl -s ru.wttr.in/vladivostok?0 | tail -6 | sed "s/$N/ветер северный/; s/$NE/ветер северо-восточный/; s/$E/ветер восточный/; s/$SE/ветер юго-восточный/; s/$S/ветер южный/; s/$SW/ветер юго-западный/; s/$W/ветер западный/; s/$NW/ветер северо-западный/"
echo

#почта
#инфа по арчу
#новости
}

newprompt(){
    CONTROL=$?
    LINE_COLOR="\[\e[38;5;34m\]"
    LINE_Clu="\342\224\214" # угол левый верхний
    LINE_H="\342\224\200" # горизонталь
    LINE_Cld="\342\224\224" # угод левый нижний
    TIME_COLOR="\[\e[38;5;226m\]"
    TIME_VALUE=""
    USER_COLOR="\[\e[38;5;82m\]"
    CHROOT_VALUE=""
    USER_VALUE="\u"
    HOST_COLOR="\[\e[38;5;34m\]"
    SSH_VALUE=""
    HOST_VALUE="\h"
    ERR_COLOR="\[\e[38;5;82m\]"
    DIR_COLOR="\[\e[38;5;208m\]"
    DIR_VALUE="\w"
    FILE_INFO_COLOR="\[\e[38;5;39m\]"
    DIR_FILE_COUNT="$(($(ls -la | wc -l)-3))"
    DIR_COUNT="$(($(ls -la | awk '$9=="." {print $2}')-2))"
    FILE_COUNT="$((${DIR_FILE_COUNT}-${DIR_COUNT}))"
    DIR_FILE_SIZE="$(du -sh 2>/dev/null | awk '{print $1}')"
    FILE_SIZE="$(ls -lah | awk '$1=="итого" {print $2}')"
    SYMBOL_COLOR="\[\e[38;5;39m\]"
    SYMBOL_VALUE="\\$"
    INPUT_COLOR="\[\e[38;5;15m\]"

    # проверка консоли. Если голая, то показываем время
    [[ $(tty | grep "tty") ]] && TIME_VALUE="\A " 
    PS1="${TIME_COLOR}${TIME_VALUE}"

    # проверка рута. Если рут, то красим имя и символ в красный
    if [[ "${EUID}" == 0 ]]; then
        USER_COLOR="\[\e[38;5;160m\]"
    else
        USER_COLOR="\[\e[38;5;82m\]"
    fi
    PS1+="${USER_COLOR}${USER_VALUE}@"

    # проверка SSH. Если удалёнка, то делаем приписку и красим хост
    if [[ -z "$SSH_CLIENT" ]]; then
        SSH_VALUE=""
        HOST_COLOR="\[\e[38;5;34m\]"
    else
        SSH_VALUE="SSH:"
        HOST_COLOR="\[\e[38;5;51m\]"
    fi
    PS1+="${HOST_COLOR}${SSH_VALUE}${HOST_VALUE} "

    # красим полный путь
    PS1+="${DIR_COLOR}${DIR_VALUE} "
    
    # красим размеры и количество директорий и файлов
#    PS1+="${FILE_INFO_COLOR}${DIR_FILE_SIZE} d${DIR_COUNT}+f${FILE_COUNT} "

    # переход на другую строку
    PS1+="\n"

    # проверка выполнения команды. Если ошибка - красный крест, нормально - зелёная галка.
    if [[ "$CONTROL" -eq "0" ]]; then
        ERR_COLOR="\[\e[38;5;82m\]"
    else
        ERR_COLOR="\[\e[38;5;160m\]"
    fi

    # красим приглашение и сбрасываем всё для ввода
    PS1+="${ERR_COLOR}${SYMBOL_VALUE} ${INPUT_COLOR}"

PS2='>'
}

PROMPT_COMMAND='newprompt; history -a' # новый промпт и добавлять набранные комманды в файл истории сразу.

# цветной вывод в less
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# aлиасы и цветной вывод для некоторых программ
if [ -x /usr/bin/dircolors ];then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias less='/usr/share/vim/vim81/macros/less.sh'
    #alias less='less -R'
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias dmesg='dmesg --color=auto'
    alias gcc='gcc -fdiagnostic-color=auto'
    alias pacman='pacman --color=auto'
    alias fdisk='fdisk --color=auto'
    alias sinf='sinf'
fi
