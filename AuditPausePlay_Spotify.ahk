﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;next song
F2::
 	Winactivate, ahk_exe spotify.exe
	Send {Media_Next}
return

;previous song
F1::
 	Winactivate, ahk_exe spotify.exe
	Send {Media_Prev}
return

;play/pause
#IfWinActive CMI Auditor
z::
 	Winactivate, ahk_exe spotify.exe
	Send {Media_Play_Pause}
	WinActivate, CMI Auditor
return
#IfWinActive

;play/pause
#IfWinActive Spectrogram Player/Scroller
z::
 	Winactivate, ahk_exe spotify.exe
	Send {Media_Play_Pause}
return
#IfWinActive