#!/bin/bash
#Cтартовый файл. Его и нужно тянуть с github.
#Запустить mawbah можно из консоли двумя способами:
#1: с помощью curl (3 ссылки на выбор):
#   $ curl -L https://github.com/mawbah/mawbah/raw/main/mawbah.sh | sh
#   $ curl -L https://raw.github.com/mawbah/mawbah/master/mawbah.sh | sh
#   $ сurl -L https://raw.githubusercontent.com/mawbah/mawbah/master/mawbah.sh | sh
#
#2: клонировать git'ом и запустить из директории репозитория:
#   $ git clone https://github.com/mawbah/mawbah.git "$HOME" && source "$HOME/mawbah/mawbah.sh"

export Name_Script=$(basename $0)
export Time_Install="$(date +%d.%m.%y_%R)"
export Link_Repository="https://github.com/mawbah/mawbah.git"

#если скрипт запущен первым способом, то клонируем репозиторий
case "${Name_Script}" in
    sh|bash|zsh)
        #если нельзя установить в /tmp (нет директории или недостаточно прав), то устанавливаем в $HOME
        if [[ -d /tmp && -r /tmp && -w /tmp && -x /tmp ]]; then
            export Path_Install="/tmp/mawbah"
        else
            export Path_Install="$HOME/mawbah"
        fi

        #если осталась старая директория - переименуем её
        mv "${Path_Install}" "${Path_Install}_${Time_Install}" 

        #качаем git, если его нет
        [[ -z "$(pacman -Qi git)" ]] && pacman -Sy --noconfirm git && Mark_Utility_Install+=" git"

        #качаем репозиторий
        git clone "${Link_Repository}" "${Path_Install}"
        echo 1!!!!!!!!!!!!!!!!!!!!!
        
        sleep 4

        #удаляем установленное 
        pacman -R ${Mark_Utility_Install}
        echo 2!!!!!!!!!!!!!!!!!!!!!
        sleep 4
        ;;
    mawbah.sh) 
        #определяем путь до корня репозитория
        export Path_Install="$(cd $(dirname $0) && pwd)"
        ;;
    *)
        echo -e "Err2:Wrong <Name_Script>! ["${Name_Script}"]\nCheck the shell (allowed sh, bash, zsh).\nCheck the name of the startup script."
        exit 2 
        ;;
esac

#запускаем навигатор с главным меню
        echo 3!!!!!!!!!!!!!!!!!!!!!
        sleep 3
cd ${Path_Install}/menu
        echo 4!!!!!!!!!!!!!!!!!!!!!
        sleep 6
source ${Path_Install}/litenavi/litenavi.sh -m files.lnm
        echo 5!!!!!!!!!!!!!!!!!!!!!
        sleep 6
exit


