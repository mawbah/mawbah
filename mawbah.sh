#!/bin/bash
#Cтартовый файл. Его и нужно тянуть с github.
#Запустить mawbah можно из консоли двумя способами:
#1) с помощью curl (3 ссылки на выбор):
#   $ curl -L https://github.com/mawbah/mawbah/raw/main/mawbah.sh | sh
#   $ curl -L https://raw.github.com/mawbah/mawbah/master/mawbah.sh | sh
#   $ сurl -L https://raw.githubusercontent.com/mawbah/mawbah/master/mawbah.sh | sh
#
#2) клонировать git'ом и запустить из директории репозитория:
#   $ git clone https://github.com/mawbah/mawbah.git "$HOME" && source "$HOME/mawbah/mawbah.sh"

export Name_Script="$(basename $0)"
export Time_Install="$(date +%d.%m.%y_%R)"
export Link_Repository="https://github.com/mawbah/mawbah.git"
export Name_User="$(whoami)"
export Name_Host="$(uname -n)"

#если надо, клонируем репозиторий. Определяем путь до него.
case "${Name_Script}" in
    sh|bash|zsh)
        #если нельзя установить в /tmp (нет директории или недостаточно прав), то устанавливаем в $HOME
        if [[ -d /tmp && -r /tmp && -w /tmp && -x /tmp ]]; then
            export Path_Install="/tmp/mawbah"
        else
            export Path_Install="$HOME/mawbah"
        fi
        #если осталась старая директория - переименуем её
        [[ -d ${Path_Install} ]] && mv "${Path_Install}" "${Path_Install}_${Time_Install}" 
        #качаем git, если его нет
        [[ -z "$(pacman -Qi git)" ]] && pacman -Sy --noconfirm git && Mark_Utility_Install+="git "
        #качаем репозиторий
        git clone "${Link_Repository}" "${Path_Install}"
        #удаляем установленное 
        [[ -n ${Mark_Utility_Install} ]] && pacman -R ${Mark_Utility_Install};;

    mawbah.sh) 
        #определяем путь до корня репозитория
        export Path_Install="$(cd $(dirname $0) && pwd)";;
esac

#запускаем навигатор с главным меню
export Lock_Enter=1
cd ${Path_Install}/menu
${Path_Install}/litenavi/litenavi.sh

#удаляем репозиторий после завершения скрипта
#trap "rm -rf ${Path_Install}" EXIT

