DetectHiddenWindows, On 
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

InputBox, toggleSet, Toggle, What key (must be one key) would you like to map to toggling append and replace in CMI Auditor? This will only be active when CMI Auditor is activated. Be sure to write in AHK notation: https://www.autohotkey.com/docs/KeyList.htm, , 640, 180
InputBox, clickY_rep, Y_rep, Y coordinate of REPLACE click? Use WindowSpy (included with AHK download and also in AHK_CMI repo) if needed, look for Window: under Mouse Position., , 440, 180
InputBox, clickY_app, Y_app, Y coordinate of APPEND click? Use WindowSpy (included with AHK download and also in AHK_CMI repo) if needed, look for Window: under Mouse Position., , 440, 180
InputBox, clickX, X, X coordinate of both clicks? Since they're in a vertical line they should have the same X coord. Use WindowSpy (included with AHK download and also in AHK_CMI repo) if needed look for Window: under Mouse Position., , 440, 180

InputBox, clickY_axisHi, clickY_axisHi, Y coordinate of the center of the bottom axis text of the TOP row of windows? This is used to find the active window by looking for red text., , 440, 180
InputBox, clickY_axisLo, clickY_axisHi, Y coordinate of the center of the bottom axis text of the BOTTOM row of windows? This is used to find the active window by looking for red text., , 440, 180

#IfWinActive CMI Auditor
Hotkey,% toggleSet,SendAppendClick
Return

SendAppendClick:
SetControlDelay -1
Click, %clickX%, %clickY_app%
#PixelSearch, redX, redY, 200, 200, 300, 300, 0x9d6346, 3, Fast
# Need to find out how to loop through PixelSearch OR even better PixelGetColor to see where the red is, then use A_TimeIdleKeyboard in a while loop to click that spot when a label is added, so it stays on the right spot (also the toggle disallows label setting so this fixes that too)
KeyWait, %toggleSet%
Click, %clickX%, %clickY_rep%
Return