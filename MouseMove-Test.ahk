#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Coordmode, Mouse, Screen

^Home::
;MouseGetPos ,mx, my
;MouseMove, 20, 20, 0, R
;MsgBox, mx: %mx% -- my: %my%

;SysGet, Mon2, Monitor, 2
;MouseMove, (Mon2Right - Mon2Left) / 2, (Mon2Bottom - Mon2Top) / 2
;MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%

	MouseGetPos, mx_o, my_o
	; MouseMove, mx_o+20, my_o+20 
	DllCall("SetCursorPos", "int", mx_o+20, "int", my_o+20)
	return 


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						