#!/bin/bash  
#Лёгкий строковый навигатор.
#Используя различные модули, можно просматривать каталоги и файлы, различные списки.
#  Module_List[0]              file_name 
#  Module_List[1]              file_name 
#  Module_List[2]              file_name 
#  Module_List[3]              file_name 
#                 ----------------------------
#                 |1 Module_Info_1           |
#                 |2 Module_Info_2           |
#  Module_List[4] |3        1  file_name     | LN_Top_Line=4
#  Module_List[5] |4        2  file_name     | верхняя видимая строка
#  Module_List[6] |5        3  file_name     |
#  Module_List[7] |6        4  file_name <-- | LN_Current_Line=7
#  Module_List[8] |7        5  file_name     | текущая строка
#  Module_List[9] |8        6  file_name     |
# Module_List[10] |9        7  file_name     |
# Module_List[11] |10       8  file_name     | LN_Number_of_Visible_Lines=8
#                 |11________________________| количество видимых строк
# Module_List[12]              file_name       (меньше или равно высоте 
# Module_List[13]              file_name        высоте видимой области) 
# Module_List[14]              file_name 
#
#      LN_Visible_List_Area=8      высота видимой области в строках 
#        LN_Number_of_Lines=14      количество строк 
# LN_Number_of_Screen_Lines=11      высота экрана терминала в строках
#              LN_Info_Area=2       количество строк дополнительной информации

LN_Screen_Rendering (){ #отрисовка списка
    LN_Info_Area=$(($((eval ${Module_Caption}; eval ${Module_Info_1}; eval ${Module_Info_2}) | wc -l)+3)) #запоминаем, сколько строк дополнительной информации
    LN_Number_of_Lines=${#Module_List[@]} #считаем количество cтрок в списке
    LN_Visible_List_Area=$((${LN_Number_of_Screen_Lines}-${LN_Info_Area}-1)) #считаем область под видимую часть списка в строках
    if [[ ${LN_Number_of_Lines} -lt ${LN_Visible_List_Area} ]]; then #если строк в списке меньше вместимости видимой области, то 
        LN_Number_of_Visible_Lines=${LN_Number_of_Lines} #количество видимых строк равно количеству строк в списке
    else
        LN_Number_of_Visible_Lines=${LN_Visible_List_Area} #количество видимых строк равно вместимости видимой области списка
    fi
    tput clear #чистим экран
    eval ${Module_Caption} #печатаем заголовок
    echo
    eval ${Module_Info_1} #печатаем первый информационный модуль
    echo
    eval ${Module_Info_2} #печатаем второй информационный модуль
    echo
    printf "   %.$((${LN_Number_of_Screen_Columns}-3))s\n" ${Module_List[@]:${LN_Top_Line}:${LN_Number_of_Visible_Lines}} #печатаем видимую часть списка
    tput cup ${LN_Info_Area} 0 #ставим курсор на первую строку видимой области
    tput setaf 2 #задаём цвет 
    printf " %s \n" ${LN_Mark_List[@]:${LN_Top_Line}:${LN_Number_of_Visible_Lines}} #печатаем отметки
    tput sgr0 #сбрасываем все атрибуты терминала
}

LN_Cursor_Rendering (){ #отрисовка текущей строки
    tput cup $((${LN_Current_Line}-${LN_Top_Line}+${LN_Info_Area})) 3 #ставим курсор в начало текста текущей строки в видимой области
    tput setab 4 #задаём цвет фона
    printf "%.$((${LN_Number_of_Screen_Columns}-3))s" ${Module_List[${LN_Current_Line}]} #печатаем текущую строку
    tput sgr0 #сбрасываем все атрибуты терминала
}

LN_Cursor_Erase (){ #возврат текущей строки в исходное состояние
    tput cup $((${LN_Current_Line}-${LN_Top_Line}+${LN_Info_Area})) 0 #ставим курсор в начало текущей строки в видимой области
    tput setaf 2 #задаём цвет 
    printf " %s " ${LN_Mark_List[${LN_Current_Line}]} #печатаем отметку
    tput sgr0 #сбрасываем все атрибуты терминала
    printf "%.$((${LN_Number_of_Screen_Columns}-3))s" ${Module_List[${LN_Current_Line}]} #печатаем текущую строку
}

LN_Resize_Window() {
    LN_Number_of_Screen_Lines=$(tput lines) #узнаём количество строк в окне
    LN_Number_of_Screen_Columns=$(tput cols) #узнаём количество столбцов в окне
    LN_Screen_Rendering #отрисовка списка
    LN_Cursor_Rendering #отрисовка текущей строки
    ${Debug_Toggle} #для отслеживания состояния переменных
}
trap 'LN_Resize_Window' WINCH # ловушка на изменение размера окна

#параметры скрипта
while getopts "m:d" OPTION; do
    case $OPTION in
        m) #имя подключаемого модуля
            Module_Name="${OPTARG}";; 
        d) #для отслеживания состояния переменных
            source ${Path_Install}/litenavi/debug.sh
            Debug_Toggle="Debug";;
    esac
done

IFS="
"
tput civis #убираем курсор

: ${Module_Name:=files.lnm} #модуль по умолчанию - работа с файлами
: ${Module_Caption:=echo "aha"} #первый информационный блок по умолчанию - пустая строка
: ${Module_Info_1:=echo } #первый информационный блок по умолчанию - пустая строка
: ${Module_Info_2:=echo } #второй информационный блок по умолчанию - пустая строка

LN_Current_Line=0 #номер текущей строки в списке
LN_Top_Line=0 #номер первой видимой строки в списке

source ${Path_Install}/litenavi/${Module_Name}
Module_List #печатаем лист
LN_Mark_List=($(printf "%.s \n" ${Module_List[@]}))
LN_Resize_Window #полностью перерисовываем экран вместе с курсором

while read -s -n1 < /dev/tty; do
    case "$REPLY" in
        'j') #вниз по списку.
            if [[ ${LN_Current_Line} -lt $((${LN_Number_of_Lines}-1)) ]]; then #если текущая строка не последняя в списке, то
                [[ ${LN_Current_Line} -eq $((${LN_Top_Line}+${LN_Visible_List_Area}-1)) ]] && ((++LN_Top_Line)) && LN_Screen_Rendering #если текущая строка последняя в видимой области, то сдвигаем область вниз на одну строку и перерисовываем экран
                LN_Cursor_Erase #затираем курсор
                ((++LN_Current_Line)) #двигаем текущую строку вниз на один
            fi;;

        'k') #вверх по списку.
            if [[ ${LN_Current_Line} -gt 0 ]]; then #если текущая строка не первая в списке, то
                [[ ${LN_Current_Line} -eq ${LN_Top_Line} ]] && ((--LN_Top_Line)) && LN_Screen_Rendering #если текущая строка первая в видимой области, то сдвигаем область вверх на одну строку и перерисовываем экран
                LN_Cursor_Erase #затираем курсор
                ((--LN_Current_Line)) #двигаем текущую строку вверх на один
            fi;;

        ' '${Lock_Space}) #отметить строку
            [[ ${LN_Mark_List[${LN_Current_Line}]} = ' ' ]] && LN_Mark_List[${LN_Current_Line}]='x' || LN_Mark_List[${LN_Current_Line}]=' '
            tput cup $((${LN_Current_Line}-${LN_Top_Line}+${LN_Info_Area})) 1 #ставим курсор в на метку текущей строки
            printf "%s" ${LN_Mark_List[${LN_Current_Line}]};;

        ${Lock_Enter}$(printf "\n")) #применить
            for i in ${!LN_Mark_List[@]}; do
                [[ ${LN_Mark_List[$i]} = 'x' ]] && LN_Output+=($i)
            done
            [[ ${LN_Output[0]} = '' ]] && LN_Output+=${LN_Current_Line}
            Module_Output ${LN_Output[@]}
            break;;

        '/') #применить
            read < /dev/tty
            LN_Search=$(($(printf "%s\n" ${Module_List[@]} | sed -n "/*$REPLY*/=;/*$REPLY*/q; d")-1)) #ищем номер строки с запросом
            [[ -n ${LN_Search} ]] && LN_Current_Line=${LN_Search} && LN_Resize_Window;;

        'q') #q - выход из скрипта
            break;;

        *) #прочие нажатия
            Module_Keys;;
    esac
    LN_Cursor_Rendering #отрисовываем текущую строку
    ${Debug_Toggle}
done

tput sgr0 #отключаем все атрибуты
tput cnorm #делаем курсор видимым
tput clear #чистим экран
