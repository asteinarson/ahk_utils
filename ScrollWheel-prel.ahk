#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


tick := 0
s_up := 0
s_down := 0
y_lim := 35
x_lim := 35
compensate := 1

; Caps lock - simulates mouse middle button
Insert::
	MouseGetPos ,mx_o, my_o
	SetTimer, ScrollWheelSimulate, 50, 100000
	keywait,Insert 
	SetTimer, ScrollWheelSimulate, Off, 
	;SoundBeep, 800, 20
	return 

^Insert::
	MsgBox tick-%tick% s_up-%s_up% s_down-%s_down%
	return

ScrollWheelSimulate:
	;:SoundBeep, 500, 20
	tick := tick + 1
	MouseGetPos ,mx, my
	comp_y := 0
	while my > my_o + y_lim {
		my_o := my_o + y_lim
		s_down := s_down + 1
		comp_y := comp_y - y_lim
		send, {WheelDown}
	}
	while my < my_o - y_lim {
		my_o := my_o - y_lim
		s_up := s_up + 1
		comp_y := comp_y + y_lim
		send, {WheelUp}
	}	
	
	comp_x := 0
	while mx > mx_o + x_lim {
		mx_o := mx_o + x_lim
		s_down := s_down + 1
		comp_x := comp_x - x_lim
		send, {WheelRight}
	}
	while mx < mx_o - x_lim {
		mx_o := mx_o - x_lim
		s_up := s_up + 1
		comp_x := comp_x + x_lim
		send, {WheelLeft}
	}	
	if compensate != 0 
	{ 
		if (comp_x != 0) || (comp_y != 0)
		{
			MouseMove, mx+comp_x, my+comp_y 
			mx_o := mx_o + comp_x 
			my_o := my_o + comp_y
		}
	}	
	return 


; This exits AHK itself - Ctrl Shift Esc
^+Escape::ExitApp
Return

	
	
						