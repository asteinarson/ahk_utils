#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Shift 4 types $ instead of ¤
+4::Send, $
return 
; This does not work
; <^>!4::Send, ¤
; return


; Caps lock - simulates mouse middle button
CapsLock::MButton

; Caps lock - simulates mouse middle button
F12::MButton


; Alt Up/Down to do mouse wheel zoom
; !Up::WheelUp
; !Down::WheelDown


; Zoom in/out with Win Z/X
<#z::
send, {WheelUp}
return 
<#x::
send, {WheelDown}
return 


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						