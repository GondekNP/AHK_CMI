DetectHiddenWindows, On 
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

InputBox, toggleSet, Toggle, What key (must be one key) would you like to map to toggling append and replace in CMI Auditor? This will only be active when CMI Auditor is activated. Be sure to write in AHK notation: https://www.autohotkey.com/docs/KeyList.htm, , 640, 180
InputBox, toggleAppend, Toggle, What key is mapped to your append toggle in your config file?, , 640, 180
InputBox, toggleReplace, Toggle, What key is mapped to your append toggle in your config file?, , 640, 180

#IfWinActive CMI Auditor
Hotkey,% toggleSet,SendAppendClick
Return

SendAppendClick:
SetControlDelay -1
SendInput, {%toggleAppend%}
KeyWait, %toggleSet%
SendInput, {%toggleReplace%}
SendInput, {Down}
Return