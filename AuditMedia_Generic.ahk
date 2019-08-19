DetectHiddenWindows, On 
CoordMode, Mouse, Screen

InputBox, playSoundKey, Playsound, What is 'playSound' mapped to in your current config? Be sure to write in AHK notation: https://www.autohotkey.com/docs/KeyList.htm, , 640, 180
InputBox, clickX, X, X coordinate of click? Use WindowSpy (included with AHK download and also in AHK_CMI repo) if needed, look for 'Screen:' under 'Mouse Position'., , 440, 180
InputBox, clickY, Y, Y coordinate of click? Use WindowSpy (included with AHK download and also in AHK_CMI repo) if needed, look for 'Screen:' under 'Mouse Position'., , 440, 180

Hotkey, IfWinActive, CMI Auditor
Hotkey,% playSoundKey,SendOutsideClick
Return

SendOutsideClick:
MouseGetPos, xpos1, ypos1 
Click, %clickX%, %clickY%
WinActivate, CMI Auditor 
Sleep, 100
SendInput, {%playSoundKey%}
Sleep, 2300
Click, %clickX%, %clickY%
MouseMove, xpos1, ypos1
WinActivate, CMI Auditor 
Return