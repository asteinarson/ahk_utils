#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ^Numpad0::
; Send, ^{Click}
; Return

; Using Send below does not recreate any Shift/Ctrl qualifiers. 
; Therefore the dedicated Ctrl option above.
Numpad0::
^Numpad0::
+Numpad0::
+^Numpad0::
{
  Click, Down
  ; Send, {RButton down}
  keywait, Numpad0 
  Click, Up
  ; Send, {RButton up}
}
Return

NumpadDot::MButton
Return 
  
NumpadEnter::LButton
Return

; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
