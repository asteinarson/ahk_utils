#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;CapsLock::
;Send, cl
;Click, down, middle
;return

CapsLock::MButton
return

+4::Send, dollar
return  

<^>!4::Send, sun
return

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return

; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return
