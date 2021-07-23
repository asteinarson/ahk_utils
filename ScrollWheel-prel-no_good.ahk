#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


tick := 0
have_timer := 0

; Caps lock - simulates mouse middle button
Insert::
if (have_timer = 0)
{
  have_timer := 1
  SetTimer, ScrollWheelSimulate, 100, 100000
  MouseGetPos ,mx, my
  SoundBeep, 300, 20
}
return 

Insert up::
have_timer := -1
;MsgBox, Tick %tick% 
return 

ScrollWheelSimulate:
if (have_timer = 1)
{
  SoundBeep, 500, 20
  tick := tick + 1
  mx_old := mx
  my_old := my
  MouseGetPos ,mx, my
}
else
{
  have_timer := 0
  SetTimer,, Off
  tick := tick + 10000
  SoundBeep, 800, 20
}  
return 


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						