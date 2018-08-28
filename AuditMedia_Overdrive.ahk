DetectHiddenWindows, On 
#IfWinActive CMI Auditor
e::
 	WinGetTitle, wintit
 	WinActivate, ahk_class #32770
	Sleep, 40
	SendInput, {Space}
	Sleep, 40
	WinActivate, ahk_class SunAwtFrame
	Sleep, 40
	SendInput, {Backspace}
	Sleep, 2100
 	WinGetTitle, wintit
 	WinActivate, ahk_class #32770
	Sleep, 40
	SendInput, {Space}
	Sleep, 40
	WinActivate, ahk_class SunAwtFrame
return
#IfWinActive