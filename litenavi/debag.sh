#!/bin/sh

Debug (){
    : ${x:=10}
    : ${y:=20}
    tput cup $x $y 
    printf "%30s [%s]\n" Top_Line "${LN_Top_Line}" 
    tput cup $(($x+1)) $y 
    printf "%30s [%s]\n" Current_Line "${LN_Current_Line}"
    tput cup $(($x+2)) $y 
    printf "%30s [%s]\n" Number_of_Visible_Lines "${LN_Number_of_Visible_Lines}"
    tput cup $(($x+3)) $y 
    printf "%30s [%s]\n" Number_of_Lines "${LN_Number_of_Lines}"
    tput cup $(($x+4)) $y 
    printf "%30s [%s]\n" Number_of_Screen_Lines "${LN_Number_of_Screen_Lines}"
    tput cup $(($x+5)) $y 
    printf "%30s [%s]\n" Visible_List_Area "${LN_Visible_List_Area}"
    tput cup $(($x+6)) $y 
    printf "%30s [%s]\n" PWD "$PWD"
    tput cup $(($x+7)) $y 
    printf "%30s [%s]\n" Root_Dir "${Root_Dir}"
    tput cup $(($x+8)) $y 
    printf "%30s [%s]\n" Old_Dir "${Old_Dir}"
    tput cup $(($x+9)) $y 
    printf "%30s [%s]\n" Current_File_Name "${Current_File_Name}"
    tput cup $(($x+10)) $y 
    printf "%30s [%s]\n" Info_Area "${LN_Info_Area}"
    tput cup $(($x+11)) $y 
    printf "%30s [%s]\n" Module_List[${LN_Current_Line}] "${Module_List[${LN_Current_Line}]}"
    tput cup $(($x+12)) $y 
#    printf "%30s [%s]\n"  "${LN_}"
#    tput cup $(($x+15)) $y 
}
