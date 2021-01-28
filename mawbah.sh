#!/bin/bash
#   Cтартовый файл. Его и нужно тянуть с github.
#   Запустить mawbah можно из консоли двумя способами:
#   1. с помощью curl (3 ссылки на выбор):
#      $ curl -L https://github.com/mawbah/mawbah/raw/main/mawbah.sh | sh
#      $ curl -L https://raw.github.com/mawbah/mawbah/master/mawbah.sh | sh
#      $ сurl -L https://raw.githubusercontent.com/mawbah/mawbah/master/mawbah.sh | sh
#
#   2. склонировать git'ом и запустить из директории репозитория:
#      $ git clone https://github.com/mawbah/mawbah.git && cd mawbah && ./mawbah.sh 

export Name_Script=$(basename $0)
export Time_Installation="$(date +%R_%d.%m.%y)"
export Link_Repository="https://github.com/mawbah/mawbah.git"
#по имени процесса определяем способ запуска скрипта
if [[ "${Name_Script}" =  in
    sh|bash|zhs) #если скрипт запущен через curl, то нужно качать репозиторий 
        #если нельзя установить в /tmp (его нет или недостаточно прав), то устанавливаем в домашнюю директорию
        if [[ -d /tmp && -r /tmp && -w /tmp && -x /tmp ]] then
            export Path_Installation="/tmp/"
        else
            export Path_Installation="~/"
        fi
        #если осталась старая директория - переименуем её
        mv "${Path_Installation}mawbah" "${Path_Installation}${Time_Installation}_mawbah" 
        #качаем git, если его нет
        [[ -z "$(pacman -Qi git)" ]] && pacman -Sy --noconfirm git && Mark_Utility_Installation="git $Mark_Utility_Installation"
        #качаем репозиторий
        git clone "${Link_Repository}"
        #удаляем установленное 
        pacman -R ${Mark_Utility_Installation}
        ;;
    mawbah.sh)
        ;;
esac




