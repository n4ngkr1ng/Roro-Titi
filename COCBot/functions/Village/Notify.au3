; #FUNCTION# ====================================================================================================================
; Name ..........:
; Description ...: This function will report to your mobile phone your values and last attack
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func _RemoteControl()
	;Telegram[Surbiks]
	If $TelegramEnabled = 1 And $pRemoteTelegram = 1 Then
		_RemoteControlTelegram()
	EndIf
	;Telegram

	If $PushBulletEnabled = 0 Then Return
	If $pRemote = 1 Then _RemoteControlPushBullet()
EndFunc   ;==>_RemoteControl

Func ReportNotify()
	;Telegram[Surbiks]
	If $TelegramEnabled = 1 Then
		If $iAlertTVillage = 1 And $IsTonotifyOneTime <= 1 Then
			_Telegram($iOrigTelegram & " :\n\nVillage Report:" & "\n[G]: " & _NumberFormat($iGoldCurrent) & "\n[E]: " & _NumberFormat($iElixirCurrent) & "\n[D]: " & _NumberFormat($iDarkCurrent) & "\n[T]: " & _NumberFormat($iTrophyCurrent) & "\n[No. of Free Builders]: " & _NumberFormat($iFreeBuilderCount))
		EndIf
		If $iLastAttackT = 1 Then
			If Not ($iGoldLast = "" And $iElixirLast = "") Then _Telegram($iOrigTelegram & " :\n\nLast Gain :\n[G]: " & _NumberFormat($iGoldLast) & "\n[E]: " & _NumberFormat($iElixirLast) & "\n[D]: " & _NumberFormat($iDarkLast) & "\n[T]: " & _NumberFormat($iTrophyLast))
		EndIf
		If _Sleep($iDelayReportPushBullet1) Then Return
		checkMainScreen(False)
 	EndIf
	;Telegram

	If $PushBulletEnabled = 0 Then Return
	If $iAlertPBVillage = 1 And $IsTonotifyOneTime <= 1 Then
		_PushBullet($iOrigPushBullet & " | My Village:" & "\n" & " [" & GetTranslated(620,35, "G") & "]: " & _NumberFormat($iGoldCurrent) & " [" & GetTranslated(620,36, "E") & "]: " & _NumberFormat($iElixirCurrent) & " [" & GetTranslated(620,37, "D") & "]: " & _NumberFormat($iDarkCurrent) & "  [" & GetTranslated(620,38, "T") & "]: " & _NumberFormat($iTrophyCurrent) & " [" & GetTranslated(620,42, "No. of Free Builders") & "]: " & _NumberFormat($iFreeBuilderCount))
	EndIf
	If $iLastAttackPB = 1 Then
		;Chalicucu If Not ($iGoldLast = "" And $iElixirLast = "") Then _PushBullet($iOrigPushBullet & " | Last Gain :" & "\n" & " [" & GetTranslated(620,35, "G") & "]: " & _NumberFormat($iGoldLast) & " [" & GetTranslated(620,36, "E") & "]: " & _NumberFormat($iElixirLast) & " [" & GetTranslated(620,37, "D") & "]: " & _NumberFormat($iDarkLast) & "  [" & GetTranslated(620,38, "T") & "]: " & _NumberFormat($iTrophyLast))
		If Not ($iGoldLast = "" And $iElixirLast = "") Then _PushBullet($iOrigPushBullet & " | Last Gain :" & "\n[" & _NumberFormat($nCurCOCAcc) & "] [" & GetTranslated(620,35, "G") & "]: " & _NumberFormat($iGoldLast) & " [" & GetTranslated(620,36, "E") & "]: " & _NumberFormat($iElixirLast) & " [" & GetTranslated(620,37, "D") & "]: " & _NumberFormat($iDarkLast) & "  [" & GetTranslated(620,38, "T") & "]: " & _NumberFormat($iTrophyLast))
	EndIf
	If _Sleep($iDelayReportPushBullet1) Then Return
	checkMainScreen(False)
EndFunc   ;==>Report

Func _DeletePush()
	;Telegram[Surbiks]
	;If $TelegramEnabled = 1 Then
		;_DeletePushOfTelegram()
		;SetLog("Delete all previous Telegram messages...", $COLOR_BLUE)
	;EndIf
	;Telegram

	If $PushBulletEnabled = 0 Then Return
		_DeletePushOfPushBullet()
		SetLog("Delete all previous PushBullet messages...", $COLOR_BLUE)
EndFunc   ;==>_DeletePush

Func PushMsg($Message, $Source = "")
	;Telegram[Surbiks]
	If $TelegramEnabled = 1 Then
		PushMsgToTelegram($Message, $Source)
	EndIf
	;Telegram

	If $PushBulletEnabled = 0 Then Return
	PushMsgToPushBullet($Message, $Source)
EndFunc   ;==>PushMsg

Func _DeleteOldPushes()
	If $PushBulletEnabled = 0 Then Return
	If $PushBulletToken = "" Or $ichkDeleteOldPBPushes = 0 Then Return
		_DeleteOldPushesOfPushBullet()
EndFunc   ;==>_DeleteOldPushes

Func _GetDateFromUnix($nPosix)
	;Telegram[Surbiks]
	;If $PushBulletEnabled = 0 Then Return
	If $PushBulletEnabled = 0 And $TelegramEnabled = 0 Then Return
	;Telegram

	Local $nYear = 1970, $nMon = 1, $nDay = 1, $nHour = 00, $nMin = 00, $nSec = 00, $aNumDays = StringSplit("31,28,31,30,31,30,31,31,30,31,30,31", ",")
	While 1
		If (Mod($nYear + 1, 400) = 0) Or (Mod($nYear + 1, 4) = 0 And Mod($nYear + 1, 100) <> 0) Then; is leap year
			If $nPosix < 31536000 + 86400 Then ExitLoop
			$nPosix -= 31536000 + 86400
			$nYear += 1
		Else
			If $nPosix < 31536000 Then ExitLoop
			$nPosix -= 31536000
			$nYear += 1
		EndIf
	WEnd
	While $nPosix > 86400
		$nPosix -= 86400
		$nDay += 1
	WEnd
	While $nPosix > 3600
		$nPosix -= 3600
		$nHour += 1
	WEnd
	While $nPosix > 60
		$nPosix -= 60
		$nMin += 1
	WEnd
	$nSec = $nPosix
	For $i = 1 To 12
		If $nDay < $aNumDays[$i] Then ExitLoop
		$nDay -= $aNumDays[$i]
		$nMon += 1
	Next
	Return $nYear & "-" & $nMon & "-" & $nDay & " " & $nHour & ":" & $nMin & ":" & StringFormat("%02i", $nSec)
EndFunc   ;==>_GetDateFromUnix
