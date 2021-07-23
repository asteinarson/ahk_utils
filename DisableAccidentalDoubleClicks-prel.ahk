#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


tick := 1

LButton::
   If (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey < 150)
   {
       SoundBeep, 500, 40
       Return
   }
   Send {RButton down}
   Return

LButton up::
  Send {RButton Up}
  return

^Insert::
	MsgBox tick-%tick% s_up-%s_up% s_down-%s_down%
	return


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						