;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;
;-;-;-;-;-;-;-;-;-;-;-;-;-;-;  INITIALIZATION ;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;
;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;
;SetCapsLockState, off
;SetCapsLockState, alwaysoff
SetMouseDelay, 0
SetKeyDelay, 0
SetWinDelay, 0
SendMode Input
SetTitleMatchMode, 2
#SingleInstance Force
#MaxThreads 999
#MaxThreadsPerHotkey 99
#MaxHotkeysPerInterval 999
#MaxThreadsBuffer On
#NoEnv
StringCaseSense, off
DetectHiddenWindows, on
SetBatchLines, -1
CoordMode, Mouse, Screen

;-;-;-;-;-;-; Variable Init ;-;-;-;-;-;-;
Global MyText
3Time:=0
variable:=0
GuiActiveArray:=Array()
Usage:=Array()

;-;-;-;-;-;-; Build 5 GUI's ;-;-;-;-;-;-;
GuiNumber:=0
while (GuiNumber<5) {
GuiNumber++
BuildGUI(GuiNumber)
Gui, %GuiNumber%: Hide
}
GuiNumber:=

;-;-;-;-;-;-; Three is used for GUI 3 ;-;-;-;-;-;-;
SetTimer, Three, 25
SetTimer, Three, on
SetTimer, Usage, 50
SetTimer, Usage, on
SetTimer, UsageReport, 10000
SetTimer, UsageReport, on
;-;-;-;-;-;-; Set and Show String on GUI 3 ;-;-;-;-;-;-;
3String=Usage_Stats - Initialization Finish.
3Time:=40*1 ;; 40 = 1 second
GuiConF(3,3,3String,-1)

InitFinish:=1

;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;
;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;  FUNCTIONS  ;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;
;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;-;

BuildGUI(GuiNumber) {
global GuiActiveArray
CustomColor = 0B0D0F
OutlineCounter:=0
While (OutlineCounter<4) {
	OutlineCounter++
	GuiOutlineID=%GuiNumber%Outline%OutlineCounter%
	GuiActiveArray[GuiOutlineID]:=1
	Gui, %GuiOutlineID%: Default
	Gui, %GuiOutlineID%: Destroy
	Gui, %GuiOutlineID%: New, +LastFound -Caption +ToolWindow +AlwaysOnTop +E0x20
	Gui, %GuiOutlineID%: Color, %CustomColor%
	if (GuiNumber=1) {
		Gui, %GuiOutlineID%: Font, s18, Magneto
		Gui, %GuiOutlineID%: Add, Text, vMyText +c0A0F0A, XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	} else  {
		Gui, %GuiOutlineID%: Font, Bold s14, OCR A Std ; Fixedsys ; DejaVu Sans
		Gui, %GuiOutlineID%: Add, Text, vMyText +c0B0D0F, XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	}
	WinSet, TransColor, %CustomColor% 255
	GuiControl, +c0A0B0C, MyText
}
CustomColor = 000000
Gui, %GuiNumber%: Default
Gui, %GuiNumber%: Destroy
Gui, %GuiNumber%: New, +LastFound -Caption +ToolWindow +AlwaysOnTop +E0x20
Gui, %GuiNumber%: Color, %CustomColor%
if (GuiNumber=1) {
	Gui, %GuiNumber%: Font, s18, Magneto ; Matura MT Script Capitals ; DejaVu Sans
	Gui, %GuiNumber%: Add, Text, vMyText +cWhite, XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
} else {
	Gui, %GuiNumber%: Font, s14, OCR A Std ; Mistral ; Franklin Gothic Book ;Corbel
	Gui, %GuiNumber%: Add, Text, vMyText +cWhite, XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
}
WinSet, TransColor, %CustomColor% 255
return
}

/*
examples:
Hide a GUI - GuiConF(GUI,2,-1,-1)
Set Text - GuiConF(GUI,3,TEXT,-1)
Show Gui - GuiConF(GUI,1,X,Y)
*/
GuiConF(GuiNumber,ConType,xLoc,yLoc)
{
	if (GuiNumber) { 
		if (ConType=1) {
			xFLoc1:=xLoc+2
			xFLoc2:=xLoc-2
			yFLoc1:=yLoc+2
			yFLoc2:=yLoc-2
			Gui, %GuiNumber%: Show, x%xLoc% y%yLoc% NoActivate
			GuiNumCounter:=0
			while (GuiNumCounter<=4) {
				GuiNumCounter++			
				if (GuiNumCounter=2) {
					Gui, %GuiNumber%Outline%GuiNumCounter%: Show, x%xFLoc1% y%yFLoc2% NoActivate
				}
					if (GuiNumCounter=3) {
						Gui, %GuiNumber%Outline%GuiNumCounter%: Show, x%xFLoc2% y%yFLoc1% NoActivate
					}
				if (GuiNumber!=1) {
				if (GuiNumCounter=1) {
						Gui, %GuiNumber%Outline%GuiNumCounter%: Show, x%xFLoc1% y%yFLoc1% NoActivate
					}
					if (GuiNumCounter=4) {
						Gui, %GuiNumber%Outline%GuiNumCounter%: Show, x%xFLoc2% y%yFLoc2% NoActivate
					}
				}
			}
		} else if (ConType=2) {
			Gui, %GuiNumber%: Hide
			GuiNumCounter:=0
			while (GuiNumCounter<=4) {
				GuiNumCounter++
				Gui, %GuiNumber%Outline%GuiNumCounter%: Hide
			}
		} else if (ConType=3) {
			Gui, %GuiNumber%: Default
			GuiControl,, MyText, %xLoc%
			Gui, %GuiNumber%Outline1: Default
			GuiControl,, MyText, %xLoc%
			Gui, %GuiNumber%Outline2: Default
			GuiControl,, MyText, %xLoc%
			Gui, %GuiNumber%Outline3: Default
			GuiControl,, MyText, %xLoc%
			Gui, %GuiNumber%Outline4: Default
			GuiControl,, MyText, %xLoc%
		}
	return
	}
}

#If InitFinish=1

Three:
MouseGetPos, ThreeX, ThreeY
if (3Time>=0) {
	3Time--
	if(3Time>=1)
		GuiConF(3,1,ThreeX-10,ThreeY+50)
	else
		GuiConF(3,2,-1,-1)
	}
return

Usage:
time_val := 50
;WinGetActiveTitle, Title
WinGetClass, WinClass, A
keycount:=0
for key, val in Usage {
	keycount++
	if (key == WinClass) {
		time_val := val + time_val
		Usage.RemoveAt(keycount)
	}
}
Usage[WinClass]:=time_val
return

UsageReport:
ifExist, %A_ScriptDir%\Usage_Report.txt
	fileDelete, %A_ScriptDir%\Usage_Report.txt
for key, val in Usage {
	time_val := round(val/1000, 2)
	fileAppend, %key%`, %time_val%`n, %A_ScriptDir%\Usage_Report.txt
}
return
