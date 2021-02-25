#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Do a copy-to-clipboard
NumpadAdd::
Send, ^{Insert}
Return

; Do a paste-from-clipboard
NumpadSub::
Send, +{Insert}
Return

; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return


	
