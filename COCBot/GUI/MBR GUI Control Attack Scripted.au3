; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Attack Scripted
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: MyBot.run team
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func PopulateComboScriptsFilesDB()
	Dim $FileSearch, $NewFile
	$FileSearch = FileFindFirstFile($dirAttacksCSV & "\*.csv")
	Dim $output = ""
	While True
		$NewFile = FileFindNextFile($FileSearch)
		If @error Then ExitLoop
		$output = $output & StringLeft($NewFile, StringLen($NewFile) - 4) & "|"
	WEnd
	FileClose($FileSearch)
	;remove last |
	$output = StringLeft($output, StringLen($output) - 1)
	;reset combo box
	_GUICtrlComboBox_ResetContent($cmbScriptNameDB)
	;set combo box
	GUICtrlSetData($cmbScriptNameDB, $output)
	_GUICtrlComboBox_SetCurSel($cmbScriptNameDB, _GUICtrlComboBox_FindStringExact($cmbScriptNameDB, ""))
	GUICtrlSetData($lblNotesScriptDB, "")
EndFunc   ;==>PopulateComboScriptsFilesDB


Func PopulateComboScriptsFilesAB()
	Dim $FileSearch, $NewFile
	$FileSearch = FileFindFirstFile($dirAttacksCSV & "\*.csv")
	Dim $output = ""
	While True
		$NewFile = FileFindNextFile($FileSearch)
		If @error Then ExitLoop
		$output = $output & StringLeft($NewFile, StringLen($NewFile) - 4) & "|"
	WEnd
	FileClose($FileSearch)
	;remove last |
	$output = StringLeft($output, StringLen($output) - 1)
	;reset combo box
	_GUICtrlComboBox_ResetContent($cmbScriptNameAB)
	;set combo box
	GUICtrlSetData($cmbScriptNameAB, $output)
	_GUICtrlComboBox_SetCurSel($cmbScriptNameAB, _GUICtrlComboBox_FindStringExact($cmbScriptNameAB, ""))
	GUICtrlSetData($lblNotesScriptAB, "")
EndFunc   ;==>PopulateComboScriptsFilesAB







Func cmbScriptNameDB()

	Local $tempvect1 = _GUICtrlComboBox_GetListArray($cmbScriptNameDB)
	Local $filename = $tempvect1[_GUICtrlComboBox_GetCurSel($cmbScriptNameDB) + 1]
	Local $f, $result = ""
	Local $tempvect, $line, $t

	$scmbScriptNameDB = $filename

	If FileExists($dirAttacksCSV & "\" & $filename & ".csv") Then
		$f = FileOpen($dirAttacksCSV & "\" & $filename & ".csv", 0)
		; Read in lines of text until the EOF is reached
		While 1
			$line = FileReadLine($f)
			If @error = -1 Then ExitLoop
			$tempvect = StringSplit($line, "|", 2)
			If UBound($tempvect) >= 2 Then
				If StringStripWS(StringUpper($tempvect[0]), 2) = "NOTE" Then $result &= $tempvect[1] & @CRLF
			EndIf
		WEnd
		FileClose($f)

	EndIf
	GUICtrlSetData($lblNotesScriptDB, $result)

EndFunc   ;==>cmbScriptNameDB


Func cmbScriptNameAB()

	Local $tempvect1 = _GUICtrlComboBox_GetListArray($cmbScriptNameAB)
	Local $filename = $tempvect1[_GUICtrlComboBox_GetCurSel($cmbScriptNameAB) + 1]
	Local $f, $result = ""
	Local $tempvect, $line, $t

	$scmbScriptNameAB = $filename

	If FileExists($dirAttacksCSV & "\" & $filename & ".csv") Then
		$f = FileOpen($dirAttacksCSV & "\" & $filename & ".csv", 0)
		; Read in lines of text until the EOF is reached
		While 1
			$line = FileReadLine($f)
			If @error = -1 Then ExitLoop
			$tempvect = StringSplit($line, "|", 2)
			If UBound($tempvect) >= 2 Then
				If StringStripWS(StringUpper($tempvect[0]), 2) = "NOTE" Then $result &= $tempvect[1] & @CRLF
			EndIf
		WEnd
		FileClose($f)

	EndIf
	GUICtrlSetData($lblNotesScriptAB, $result)

EndFunc   ;==>cmbScriptNameAB



Func UpdateComboScriptNameDB()
	Local $indexofscript = _GUICtrlComboBox_GetCurSel($cmbScriptNameDB)
	Local $scriptname
	_GUICtrlComboBox_GetLBText($cmbScriptNameDB, $indexofscript, $scriptname)
	PopulateComboScriptsFilesDB()
	_GUICtrlComboBox_SetCurSel($cmbScriptNameDB, _GUICtrlComboBox_FindStringExact($cmbScriptNameDB, $scriptname))
	cmbScriptNameDB()
EndFunc   ;==>UpdateComboScriptNameDB


Func UpdateComboScriptNameAB()
	Local $indexofscript = _GUICtrlComboBox_GetCurSel($cmbScriptNameAB)
	Local $scriptname
	_GUICtrlComboBox_GetLBText($cmbScriptNameAB, $indexofscript, $scriptname)
	PopulateComboScriptsFilesAB()
	_GUICtrlComboBox_SetCurSel($cmbScriptNameAB, _GUICtrlComboBox_FindStringExact($cmbScriptNameAB, $scriptname))
	cmbScriptNameAB()
EndFunc   ;==>UpdateComboScriptNameAB





Func EditScriptDB()
	Local $tempvect1 = _GUICtrlComboBox_GetListArray($cmbScriptNameDB)
	Local $filename = $tempvect1[_GUICtrlComboBox_GetCurSel($cmbScriptNameDB) + 1]
	Local $f, $result = ""
	Local $tempvect, $line, $t
	If FileExists($dirAttacksCSV & "\" & $filename & ".csv") Then
		ShellExecute("notepad.exe", $dirAttacksCSV & "\" & $filename & ".csv")
	EndIf
EndFunc   ;==>EditScriptDB

Func EditScriptAB()
	Local $tempvect1 = _GUICtrlComboBox_GetListArray($cmbScriptNameAB)
	Local $filename = $tempvect1[_GUICtrlComboBox_GetCurSel($cmbScriptNameAB) + 1]
	Local $f, $result = ""
	Local $tempvect, $line, $t
	If FileExists($dirAttacksCSV & "\" & $filename & ".csv") Then
		ShellExecute("notepad.exe", $dirAttacksCSV & "\" & $filename & ".csv")
	EndIf
EndFunc   ;==>EditScriptAB


Func AttackCSVAssignDefaultScriptName()
	Dim $FileSearch, $NewFile
	$FileSearch = FileFindFirstFile($dirAttacksCSV & "\*.csv")
	Dim $output = ""
	$NewFile = FileFindNextFile($FileSearch)
	If @error Then $output = ""
	$output = StringLeft($NewFile, StringLen($NewFile) - 4)
	FileClose($FileSearch)
	;remove last |
	_GUICtrlComboBox_SetCurSel($cmbScriptNameDB, _GUICtrlComboBox_FindStringExact($cmbScriptNameDB, $output))
	_GUICtrlComboBox_SetCurSel($cmbScriptNameAB, _GUICtrlComboBox_FindStringExact($cmbScriptNameAB, $output))

	cmbScriptNameDB()
	cmbScriptNameAB()
EndFunc   ;==>AttackCSVAssignDefaultScriptName

;Parse this first on load of bot, needed outside the function to update current language.ini file. Used on Func NewABScript() and NewDBScript()
Local $temp1 = GetTranslated(635,1, "Create New Script File"), $temp2 = GetTranslated(635,2, "New Script Filename")
Local $temp3 = GetTranslated(635,3, "File exists, please input a new name"), $temp4 = GetTranslated(635,4, "An error occurred when creating the file.")
Local $temp1 = 0, $temp2 = 0, $temp3 = 0, $temp4 = 0 ; empty temp vars

Func NewScriptDB()
	Local $filenameScript = InputBox(GetTranslated(635,1, -1), GetTranslated(635,2, -1) & ":")
	If StringLen($filenameScript) > 0 Then
		If FileExists($dirAttacksCSV & "\" & $filenameScript & ".csv") Then
			MsgBox("", "", GetTranslated(635,3, -1))
		Else
			Local $hFileOpen = FileOpen($dirAttacksCSV & "\" & $filenameScript & ".csv", $FO_APPEND)
			If $hFileOpen = -1 Then
				MsgBox($MB_SYSTEMMODAL, "", GetTranslated(635,4, -1))
				Return False
			Else
				FileClose($hFileOpen)
				$scmbDBScriptName = $filenameScript
				UpdateComboScriptNameDB()
				UpdateComboScriptNameAB()
			EndIf
		EndIf
	EndIf
EndFunc   ;==>NewScriptDB


Func NewScriptAB()
	Local $filenameScript = InputBox(GetTranslated(635,1, -1), GetTranslated(635,2, -1) & ":")
	If StringLen($filenameScript) > 0 Then
		If FileExists($dirAttacksCSV & "\" & $filenameScript & ".csv") Then
			MsgBox("", "", GetTranslated(635,3, -1))
		Else
			Local $hFileOpen = FileOpen($dirAttacksCSV & "\" & $filenameScript & ".csv", $FO_APPEND)
			If $hFileOpen = -1 Then
				MsgBox($MB_SYSTEMMODAL, "", GetTranslated(635,4, -1))
				Return False
			Else
				FileClose($hFileOpen)
				$scmbABScriptName = $filenameScript
				UpdateComboScriptNameAB()
				UpdateComboScriptNameDB()

			EndIf
		EndIf
	EndIf
EndFunc   ;==>NewScriptAB



;Parse this first on load of bot, needed outside the function to update current language.ini file. Used on Func DuplicateABScript() and DuplicateDBScript()
Local $temp1 = GetTranslated(635,5, "Copy to New Script File"), $temp2 = GetTranslated(635,6, "Copy"), $temp3 = GetTranslated(635,7, "to New Script Filename")
Local $temp1 = 0, $temp2 = 0, $temp3 = 0 ; empty temp vars

Func DuplicateScriptDB()
	Local $indexofscript = _GUICtrlComboBox_GetCurSel($cmbScriptNameDB)
	Local $scriptname
	_GUICtrlComboBox_GetLBText($cmbScriptNameDB, $indexofscript, $scriptname)
	$scmbDBScriptName = $scriptname
	Local $filenameScript = InputBox(GetTranslated(635,5, -1), GetTranslated(635,6, -1) & ": <" & $scmbDBScriptName & ">" & @CRLF & GetTranslated(635,7, -1) & ":")
	If StringLen($filenameScript) > 0 Then
		If FileExists($dirAttacksCSV & "\" & $filenameScript & ".csv") Then
			MsgBox("", "", GetTranslated(635,3, -1))
		Else
			Local $hFileOpen = FileCopy($dirAttacksCSV & "\" & $scmbDBScriptName & ".csv", $dirAttacksCSV & "\" & $filenameScript & ".csv")

			If $hFileOpen = -1 Then
				MsgBox($MB_SYSTEMMODAL, "", GetTranslated(635,4, -1))
				Return False
			Else
				FileClose($hFileOpen)
				$scmbDBScriptName = $filenameScript
				UpdateComboScriptNameDB()
				UpdateComboScriptNameAB()

			EndIf
		EndIf
	EndIf
EndFunc   ;==>DuplicateScriptDB

Func DuplicateScriptAB()
	Local $indexofscript = _GUICtrlComboBox_GetCurSel($cmbScriptNameAB)
	Local $scriptname
	_GUICtrlComboBox_GetLBText($cmbScriptNameAB, $indexofscript, $scriptname)
	$scmbABScriptName = $scriptname
	Local $filenameScript = InputBox(GetTranslated(635,5, -1), GetTranslated(635,6, -1) & ": <" & $scmbABScriptName & ">" & @CRLF & GetTranslated(635,7, -1) & ":")
	If StringLen($filenameScript) > 0 Then
		If FileExists($dirAttacksCSV & "\" & $filenameScript & ".csv") Then
			MsgBox("", "", GetTranslated(635,3, -1))
		Else
			Local $hFileOpen = FileCopy($dirAttacksCSV & "\" & $scmbABScriptName & ".csv", $dirAttacksCSV & "\" & $filenameScript & ".csv")

			If $hFileOpen = -1 Then
				MsgBox($MB_SYSTEMMODAL, "", GetTranslated(635,4, -1))
				Return False
			Else
				FileClose($hFileOpen)
				$scmbABScriptName = $filenameScript
				UpdateComboScriptNameAB()
				UpdateComboScriptNameDB()
			EndIf
		EndIf
	EndIf
EndFunc   ;==>DuplicateScriptAB

; CSV Deployment Speed Mod
Func chkCSVSpeedStaticDB()
If GUICtrlRead($chkCSVSpeedStaticDB) = $GUI_CHECKED And GUICtrlRead($chkCSVSpeedVariableDB) = $GUI_UNCHECKED Then
		For $i = $lbltxtSelectedSpeedTxtDB To $sldSelectedSpeedDB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinDB To $sldSelectedSpeedMaxDB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkCSVSpeedStaticDB = 1
		$ichkCSVSpeedVariableDB = 0
ElseIf GUICtrlRead($chkCSVSpeedStaticDB) = $GUI_UNCHECKED And GUICtrlRead($chkCSVSpeedVariableDB) = $GUI_CHECKED Then
		For $i = $lbltxtSelectedSpeedTxtDB To $sldSelectedSpeedDB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinDB To $sldSelectedSpeedMaxDB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		$ichkCSVSpeedStaticDB = 0
		$ichkCSVSpeedVariableDB = 1
EndIf
EndFunc

Func chkCSVSpeedVariableDB()
If GUICtrlRead($chkCSVSpeedVariableDB) = $GUI_CHECKED And GUICtrlRead($chkCSVSpeedStaticDB) = $GUI_UNCHECKED Then
		For $i = $lbltxtSelectedSpeedTxtDB To $sldSelectedSpeedDB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinDB To $sldSelectedSpeedMaxDB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		$ichkCSVSpeedVariableDB = 1
		$ichkCSVSpeedStaticDB = 0
ElseIf GUICtrlRead($chkCSVSpeedVariableDB) = $GUI_UNCHECKED And GUICtrlRead($chkCSVSpeedStaticDB) = $GUI_CHECKED Then
		For $i = $lbltxtSelectedSpeedTxtDB To $sldSelectedSpeedDB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinDB To $sldSelectedSpeedMaxDB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkCSVSpeedVariableDB = 0
		$ichkCSVSpeedStaticDB = 1
EndIf
EndFunc

Func sldSelectedSpeedDB()
	$isldSelectedCSVSpeed[$DB] = GUICtrlRead($sldSelectedSpeedDB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$DB]] & " X";
	If $isldSelectedCSVSpeed[$DB] = 4 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedDB, $speedText)
EndFunc   ;==>sldSelectedSpeedDB

Func sldSelectedSpeedMinDB()
	$isldSelectedCSVSpeedMin[$DB] = GUICtrlRead($sldSelectedSpeedMinDB)
		
	If $isldSelectedCSVSpeedMin[$DB] > $isldSelectedCSVSpeedMax[$DB] Then
		$isldSelectedCSVSpeedMax[$DB] = $isldSelectedCSVSpeedMin[$DB]
		GUICtrlSetData($sldSelectedSpeedMaxDB, $isldSelectedCSVSpeedMin[$DB])
	EndIf
	
	Local $speedTextMinDB = $iCSVSpeeds[$isldSelectedCSVSpeedMin[$DB]] & " X";
	If $isldSelectedCSVSpeedMin[$DB] = 4 Then $speedTextMinDB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMinDB, $speedTextMinDB)
	Local $speedTextMaxDB = $iCSVSpeeds[$isldSelectedCSVSpeedMax[$DB]] & " X";
	If $isldSelectedCSVSpeedMax[$DB] = 4 Then $speedTextMaxDB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMaxDB, $speedTextMaxDB)
EndFunc   ;==>sldSelectedSpeedDB

Func sldSelectedSpeedMaxDB()
	$isldSelectedCSVSpeedMax[$DB] = GUICtrlRead($sldSelectedSpeedMaxDB)
	
		If $isldSelectedCSVSpeedMax[$DB] < $isldSelectedCSVSpeedMin[$DB] Then
		$isldSelectedCSVSpeedMin[$DB] = $isldSelectedCSVSpeedMax[$DB]
		GUICtrlSetData($sldSelectedSpeedMinDB, $isldSelectedCSVSpeedMax[$DB])
		EndIf
		
	Local $speedTextMaxDB = $iCSVSpeeds[$isldSelectedCSVSpeedMax[$DB]] & " X";
	If $isldSelectedCSVSpeedMax[$DB] = 4 Then $speedTextMaxDB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMaxDB, $speedTextMaxDB)
	Local $speedTextMinDB = $iCSVSpeeds[$isldSelectedCSVSpeedMin[$DB]] & " X";
	IF $isldSelectedCSVSpeedMin[$DB] = 4 Then $speedTextMinDB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMinDB, $speedTextMinDB)
	
EndFunc   ;==>sldSelectedSpeedDB

Func chkCSVSpeedStaticAB()
If GUICtrlRead($chkCSVSpeedStaticAB) = $GUI_CHECKED And GUICtrlRead($chkCSVSpeedVariableAB) = $GUI_UNCHECKED Then
		For $i = $lbltxtSelectedSpeedTxtAB To $sldSelectedSpeedAB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinAB To $sldSelectedSpeedMaxAB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkCSVSpeedStaticAB = 1
		$ichkCSVSpeedVariableAB = 0
ElseIf GUICtrlRead($chkCSVSpeedStaticAB) = $GUI_UNCHECKED And GUICtrlRead($chkCSVSpeedVariableAB) = $GUI_CHECKED Then
		For $i = $lbltxtSelectedSpeedTxtAB To $sldSelectedSpeedAB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinAB To $sldSelectedSpeedMaxAB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		$ichkCSVSpeedStaticAB = 0
		$ichkCSVSpeedVariableAB = 1
EndIf
EndFunc

Func chkCSVSpeedVariableAB()
If GUICtrlRead($chkCSVSpeedVariableAB) = $GUI_CHECKED And GUICtrlRead($chkCSVSpeedStaticAB) = $GUI_UNCHECKED Then
		For $i = $lbltxtSelectedSpeedTxtAB To $sldSelectedSpeedAB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinAB To $sldSelectedSpeedMaxAB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		$ichkCSVSpeedVariableAB = 1
		$ichkCSVSpeedStaticAB = 0
ElseIf GUICtrlRead($chkCSVSpeedVariableAB) = $GUI_UNCHECKED And GUICtrlRead($chkCSVSpeedStaticAB) = $GUI_CHECKED Then
		For $i = $lbltxtSelectedSpeedTxtAB To $sldSelectedSpeedAB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		For $i = $lbltxtSelectedSpeedTxtMinAB To $sldSelectedSpeedMaxAB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkCSVSpeedVariableAB = 0
		$ichkCSVSpeedStaticAB = 1
EndIf
EndFunc

Func sldSelectedSpeedAB()
	$isldSelectedCSVSpeed[$LB] = GUICtrlRead($sldSelectedSpeedAB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$LB]] & " X";
	If $isldSelectedCSVSpeed[$LB] = 3 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedAB, $speedText)
EndFunc   ;==>sldSelectedSpeedAB

Func sldSelectedSpeedMinAB()
	$isldSelectedCSVSpeedMin[$LB] = GUICtrlRead($sldSelectedSpeedMinAB)
		
	If $isldSelectedCSVSpeedMin[$LB] > $isldSelectedCSVSpeedMax[$LB] Then
		$isldSelectedCSVSpeedMax[$LB] = $isldSelectedCSVSpeedMin[$LB]
		GUICtrlSetData($sldSelectedSpeedMaxAB, $isldSelectedCSVSpeedMin[$LB])
	EndIf
	
	Local $speedTextMinAB = $iCSVSpeeds[$isldSelectedCSVSpeedMin[$LB]] & " X";
	If $isldSelectedCSVSpeedMin[$LB] = 4 Then $speedTextMinAB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMinAB, $speedTextMinAB)
	Local $speedTextMaxAB = $iCSVSpeeds[$isldSelectedCSVSpeedMax[$LB]] & " X";
	If $isldSelectedCSVSpeedMax[$LB] = 4 Then $speedTextMaxAB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMaxAB, $speedTextMaxAB)
EndFunc   ;==>sldSelectedSpeedAB

Func sldSelectedSpeedMaxAB()
	$isldSelectedCSVSpeedMax[$LB] = GUICtrlRead($sldSelectedSpeedMaxAB)
	
		If $isldSelectedCSVSpeedMax[$LB] < $isldSelectedCSVSpeedMin[$LB] Then
		$isldSelectedCSVSpeedMin[$LB] = $isldSelectedCSVSpeedMax[$LB]
		GUICtrlSetData($sldSelectedSpeedMinAB, $isldSelectedCSVSpeedMax[$LB])
		EndIf
		
	Local $speedTextMaxAB = $iCSVSpeeds[$isldSelectedCSVSpeedMax[$LB]] & " X";
	If $isldSelectedCSVSpeedMax[$LB] = 4 Then $speedTextMaxAB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMaxAB, $speedTextMaxAB)
	Local $speedTextMinAB = $iCSVSpeeds[$isldSelectedCSVSpeedMin[$LB]] & " X";
	IF $isldSelectedCSVSpeedMin[$LB] = 4 Then $speedTextMinAB = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedMinAB, $speedTextMinAB)
	
EndFunc   ;==>sldSelectedSpeedAB

Func AttackNow()
$iMatchMode = $LB			; Select Live Base As Attack Type
$iAtkAlgorithm[$LB] = 1			; Select Scripted Attack
$scmbABScriptName = GuiCtrlRead($cmbScriptNameAB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
$iMatchMode = 1			; Select Live Base As Attack Type
$RunState = True
PrepareAttack($iMatchMode)			; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack()			; Fire xD
EndFunc   ;==>AttackNow
