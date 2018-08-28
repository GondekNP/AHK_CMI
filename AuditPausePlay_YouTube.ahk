#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Determines whether invisible windows are "seen" by the script
DetectHiddenWindows, On

; sets title matching to search for "containing" isntead of "exact"
SetTitleMatchMode, 2

;sets controlID to 0 every time the script is reloaded
controlID       := 0

return

#IfWinNotActive, ahk_exe chrome.exe

#IfWinActive CMI Auditor
z::
    ; Gets the control ID of google chrome
    ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome

    ; Focuses on chrome without breaking focus on what you're doing
    ControlFocus,,ahk_id %controlID%

    ; Checks to make sure YouTube isn't the first tab before starting the loop
    ; Saves time when youtube is the tab it's on
    IfWinExist, YouTube
    {
        ControlSend, Chrome_RenderWidgetHostHWND1, k , Google Chrome
        return
    }

    ; Sends ctrl+1 to your browser to set it at tab 1
    ControlSend, , ^1, Google Chrome

    ; Starts loop to find youtube tab
    Loop
    {
        IfWinExist, YouTube
        {
            break
        }

        ;Scrolls through the tabs.
        ControlSend, ,{Control Down}{Tab}{Control Up}, Google Chrome

        ; if the script acts weird and is getting confused, raise this number
        ; Sleep, is measures in milliseconds. 1000 ms = 1 sec
        Sleep, 150
    }

    Sleep, 50

    ; Sends the K button to chrome
    ; K is the default pause/unpause of YouTube (People think space is. Don't use space!
    ; It'll scroll you down the youtube page when the player doesn't have focus.
    ControlSend, Chrome_RenderWidgetHostHWND1, k , Google Chrome
return
#IfWinActive

#IfWinNotActive