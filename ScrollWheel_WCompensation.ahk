#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen

tick := 0
n_mm := 0
s_up := 0
s_down := 0
my_acc := 0
mx_acc := 0
y_lim := 60
x_lim := 60
compensate := 1
cnt_move = 0

; Caps lock - simulates mouse middle button
Insert::
    mx_acc := 0
    my_acc := 0
	MouseGetPos ,mx_o, my_o
    cnt_move := 0
	SetTimer, ScrollWheelSimulate, 10, 100000
	keywait,Insert 
	SetTimer, ScrollWheelSimulate, Off, 
	;MouseMove, mx_o, my_o
	DllCall("SetCursorPos", "int", mx_o, "int", my_o)
	return 

; Shows some statistics
^+Insert::
	MsgBox tick-%tick% s_up-%s_up% s_down-%s_down% n_mm-%n_mm% 
	return

ScrollWheelSimulate:
	tick := tick + 1
	MouseGetPos ,mx, my
	if (my != my_o)
	{
		my_acc := my_acc + my - my_o 
		cnt := 0
		;MsgBox, my_o%my_o% my%my% my_acc%my_acc% 
		while (cnt < 10) && (my_acc >= y_lim)
		{
			my_acc := my_acc - y_lim
			s_down := s_down + 1
			send, {WheelDown}
			cnt := cnt + 1 
		}
		while (cnt < 10) && (my_acc <= (y_lim * -1))
		{
			my_acc := my_acc + y_lim
			s_up := s_up + 1
			send, {WheelUp}	
			cnt := cnt + 1 
		}
	}

	if (mx != mx_o) || (my != my_o)
	{
		cnt_move := cnt_move + 1	
	    if (cnt_move>0)
		{
			;MsgBox, my_o%my_o% my%my% mx%mx% mx_o%mx_o%
			n_mm := n_mm + 1
			DllCall("SetCursorPos", "int", mx_o, "int", my_o)
			;MouseMove, mx_o, my_o 
			;MouseMove, mx_o-mx, my_o-my, 0, R 
			cnt_move := 0
		}
	}	
	return 


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						