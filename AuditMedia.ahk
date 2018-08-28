DetectHiddenWindows, On 
#IfWinActive CMI Auditor
e & LButton::
	MouseClick, left
 	WinGetTitle, wintit
 	Winactivate, ahk_exe spotify.exe
	Sleep, 60
	SendInput, {Media_Play_Pause}
	WinActivate, wintit
	Sleep, 100
	MouseClick, left
	Sleep, 2200
 	WinGetTitle, wintit
 	Winactivate, ahk_exe spotify.exe
	Sleep, 60
	SendInput, {Media_Play_Pause}
	WinActivate, wintit
	WinActivate, CMI Auditor
return
#IfWinActive