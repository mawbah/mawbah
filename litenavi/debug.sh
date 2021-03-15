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

    tput cup $(($x+13)) $y 
    printf "%30s [%s]\n" Filter_Input "${Filter_Input}"
    tput cup $(($x+14)) $y 
    printf "%30s [%s]\n" Filter "${Filter}"
    tput cup $(($x+15)) $y 
    printf "%30s [%s]\n" List_FS "${List_FS[0]}"
    tput cup $(($x+16)) $y 
    printf "%30s [%s]\n" Condition "${Condition}"
    tput cup $(($x+17)) $y 
    printf "%30s [%s]\n" Filter_Value "${Filter_Value}"
    tput cup $(($x+18)) $y 
    printf "%30s [%s]\n" List_FS_Value "${List_FS_Value}"
    tput cup $(($x+20)) $y 
    printf "%30s [%s]\n" Sort_Input "${Sort_Input}"
    tput cup $(($x+21)) $y 
    printf "%30s [%s]\n" Sort "${Sort}"

    tput cup $(($x+23)) $y 
    printf "%30s [%s]\n"  Module_List "${Module_List[@]}"
}
