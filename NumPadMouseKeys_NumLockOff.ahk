#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^NumpadIns::
Send, ^{Click}
;MsgBox NI_CtrlClick
Return

+NumpadIns:: 
Send, +{Click}
;MsgBox NI_ShiftClick
Return


^+NumpadIns::
Send, ^+{Click}
;MsgBox NI_ShiftCtrlClick
Return

; This makes left alt 
!NumpadIns::
Send, !{Click}
;MsgBox NI_AltClick
Return

RAlt & NumpadIns::
Send, !{Click}
;MsgBox NI_AltGrClick2
Return

; Using Send below does not recreate any Shift/Ctrl qualifiers. 
; Therefore the dedicated options above.
NumpadIns::
{
  Click, Down
  ; Send, {RButton down}
  keywait, NumpadIns
  Click, Up
  ; Send, {RButton up}
}
Return

NumpadDel::MButton
Return 
  
NumpadEnter::LButton
Return

; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
