; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func chkDBTimeStopAtk()
	If GUICtrlRead($chkDBTimeStopAtk) = $GUI_CHECKED Then
		$ichkTimeStopAtk[$DB] = 1
		GUICtrlSetState($txtDBTimeStopAtk, $GUI_ENABLE)
		GUICtrlSetState($lblDBTimeStopAtk, $GUI_ENABLE)
		For $i = $lblDBTimeStopAtka To $lblDBTimeStopAtk
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk[$DB] = 0
		GUICtrlSetState($txtDBTimeStopAtk, $GUI_DISABLE)
		GUICtrlSetState($lblDBTimeStopAtk, $GUI_DISABLE)
		For $i = $lblDBTimeStopAtka To $lblDBTimeStopAtk
		   GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkDBTimeStopAtk

Func chkDBTimeStopAtk2()
	If GUICtrlRead($chkDBTimeStopAtk2) = $GUI_CHECKED Then
		$ichkTimeStopAtk2[$DB] = 1
		GUICtrlSetState($txtDBTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblDBTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtDBMinGoldStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtDBMinElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtDBMinDarkElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblDBMinRerourcesAtk2, $GUI_ENABLE)
		For $i = $lblDBTimeStopAtk2a To $picDBMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk2[$DB] = 0
		GUICtrlSetState($txtDBTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblDBTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtDBMinGoldStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtDBMinElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtDBMinDarkElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblDBMinRerourcesAtk2, $GUI_DISABLE)
		For $i = $lblDBTimeStopAtk2a To $picDBMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkDBTimeStopAtk2

Func chkABTimeStopAtk()
	If GUICtrlRead($chkABTimeStopAtk) = $GUI_CHECKED Then
		$ichkTimeStopAtk[$LB] = 1
		GUICtrlSetState($txtABTimeStopAtk, $GUI_ENABLE)
		GUICtrlSetState($lblABTimeStopAtk, $GUI_ENABLE)
		For $i = $lblABTimeStopAtka To $lblABTimeStopAtk
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk[$LB] = 0
		GUICtrlSetState($txtABTimeStopAtk, $GUI_DISABLE)
		GUICtrlSetState($lblABTimeStopAtk, $GUI_DISABLE)
		For $i = $lblABTimeStopAtka To $lblABTimeStopAtk
		   GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkABTimeStopAtk

Func chkABTimeStopAtk2()
	If GUICtrlRead($chkABTimeStopAtk2) = $GUI_CHECKED Then
		$ichkTimeStopAtk2[$LB] = 1
		GUICtrlSetState($txtABTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblABTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtABMinGoldStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtABMinElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtABMinDarkElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblABMinRerourcesAtk2, $GUI_ENABLE)
		For $i = $lblABTimeStopAtk2a To $picABMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk2[$LB] = 0
		GUICtrlSetState($txtABTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblABTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtABMinGoldStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtABMinElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtABMinDarkElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblABMinRerourcesAtk2, $GUI_DISABLE)
		For $i = $lblABTimeStopAtk2a To $picABMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_HIDE)
		Next

	EndIf
EndFunc   ;==>chkABTimeStopAtk2
Func chkDESideEB()
	If GUICtrlRead($chkDESideEB) = $GUI_CHECKED Then
		For $i = $txtDELowEndMin To $lblDEEndAq
			GUICtrlSetState($i, $GUI_ENABLE)
			GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		For $i = $txtDELowEndMin To $lblDEEndAq
			GUICtrlSetState($i, $GUI_DISABLE)
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkDESideEB


Func chkTSMeetDE()
	If GUICtrlRead($chkTSMeetDE) = $GUI_CHECKED Then
		GUICtrlSetState($txtTSMinDarkElixir, $GUI_ENABLE)
		For $i = $txtTSMinDarkElixir To $picTSMinDarkElixir
		 GUICtrlSetState($i, $GUI_SHOW)
	    Next
	Else
		GUICtrlSetState($txtTSMinDarkElixir, $GUI_DISABLE)
		For $i = $txtTSMinDarkElixir To $picTSMinDarkElixir
		 GUICtrlSetState($i, $GUI_HIDE)
	    Next
	EndIf
EndFunc   ;==>chkTSMeetDE

Func chkTSTimeStopAtk()
	If GUICtrlRead($chkTSTimeStopAtk) = $GUI_CHECKED Then
		$ichkTimeStopAtk[$TS] = 1
		GUICtrlSetState($txtTSTimeStopAtk, $GUI_ENABLE)
		GUICtrlSetState($lblTSTimeStopAtk, $GUI_ENABLE)
		For $i = $lblTSTimeStopAtka To $lblTSTimeStopAtk
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk[$TS] = 0
		GUICtrlSetState($txtTSTimeStopAtk, $GUI_DISABLE)
		GUICtrlSetState($lblTSTimeStopAtk, $GUI_DISABLE)
		For $i = $lblTSTimeStopAtka To $lblTSTimeStopAtk
		   GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkTSTimeStopAtk

Func chkTSTimeStopAtk2()
	If GUICtrlRead($chkTSTimeStopAtk2) = $GUI_CHECKED Then
		$ichkTimeStopAtk2[$TS] = 1
		GUICtrlSetState($txtTSTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblTSTimeStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtTSMinGoldStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtTSMinElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($txtTSMinDarkElixirStopAtk2, $GUI_ENABLE)
		GUICtrlSetState($lblTSMinRerourcesAtk2, $GUI_ENABLE)
		For $i = $lblTSTimeStopAtk2a To $picTSMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$ichkTimeStopAtk2[$TS] = 0
		GUICtrlSetState($txtTSTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblTSTimeStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtTSMinGoldStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtTSMinElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($txtTSMinDarkElixirStopAtk2, $GUI_DISABLE)
		GUICtrlSetState($lblTSMinRerourcesAtk2, $GUI_DISABLE)
		For $i = $lblTSTimeStopAtk2a To $picTSMinDarkElixirStopAtk2
		   GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkTSTimeStopAtk2

Func btnConfigureReplayShare()
;~ 	OpenGUIReplayShare()
EndFunc   ;==>btnConfigureReplayShare

Func chkTakeLootSS()
	If GUICtrlRead($chkTakeLootSS) = $GUI_CHECKED Then
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_ENABLE)
	    GUICtrlSetState($chkScreenshotLootInfo, $GUI_SHOW)
	Else
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_DISABLE)
	    GUICtrlSetState($chkScreenshotLootInfo, $GUI_HIDE)
	EndIf
EndFunc   ;==>chkTakeLootSS
