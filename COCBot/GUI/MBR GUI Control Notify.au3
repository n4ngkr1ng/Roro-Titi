;#FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Notify
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

Func PushBulletRemoteControl()
	;Telegram[Surbiks]
	;If $PushBulletEnabled And $pRemote Then _RemoteControl()
	_RemoteControl()
	;Telegram
EndFunc   ;==>PushBulletRemoteControl

Func PushBulletDeleteOldPushes()
	;Telegram[Surbiks]
	If $PushBulletEnabled = 1 And $ichkDeleteOldPBPushes = 1 Then _DeleteOldPushes() ; check every 30 min if must to delete old pushbullet messages, increase delay time for anti ban pushbullet
	;_DeleteOldPushes()
	;Telegram
EndFunc   ;==>PushBulletDeleteOldPushes

Func chkPBenabled()
	If GUICtrlRead($chkPBenabled) = $GUI_CHECKED Then
		$PushBulletEnabled = 1
		GUICtrlSetState($chkPBRemote, $GUI_ENABLE)
		GUICtrlSetState($PushBulletTokenValue, $GUI_ENABLE)
		GUICtrlSetState($OrigPushBullet, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBVMFound, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBLastRaid, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBWallUpgrade, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBLastRaidTxt, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBOOS, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBVBreak, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBVillage, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBOtherDevice, $GUI_ENABLE)
		GUICtrlSetState($chkDeleteAllPBPushes, $GUI_ENABLE)
		GUICtrlSetState($chkDeleteOldPBPushes, $GUI_ENABLE)
		GUICtrlSetState($btnDeletePBmessages, $GUI_ENABLE)
		GUICtrlSetState($chkAlertPBCampFull, $GUI_ENABLE)

		 For $i = $chkPBRemote To $chkAlertPBOtherDevice
			GUICtrlSetState($i, $GUI_SHOW)
		 Next

		If $ichkDeleteOldPBPushes = 1 Then
			GUICtrlSetState($cmbHoursPushBullet, $GUI_ENABLE)
		EndIf
	Else
		$PushBulletEnabled = 0
		GUICtrlSetState($chkPBRemote, $GUI_DISABLE)
		GUICtrlSetState($PushBulletTokenValue, $GUI_DISABLE)
		GUICtrlSetState($OrigPushBullet, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBVMFound, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBLastRaid, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBWallUpgrade, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBLastRaidTxt, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBOOS, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBVBreak, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBVillage, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBLastAttack, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBOtherDevice, $GUI_DISABLE)
		GUICtrlSetState($chkDeleteAllPBPushes, $GUI_DISABLE)
		GUICtrlSetState($chkDeleteOldPBPushes, $GUI_DISABLE)
		GUICtrlSetState($btnDeletePBmessages, $GUI_DISABLE)
		GUICtrlSetState($chkAlertPBCampFull, $GUI_DISABLE)

		GUICtrlSetState($cmbHoursPushBullet, $GUI_DISABLE)

		 For $i = $chkPBRemote To $chkAlertPBOtherDevice
			GUICtrlSetState($i, $GUI_HIDE)
		 Next

	EndIf
EndFunc   ;==>chkPBenabled

Func chkDeleteOldPBPushes()
	If GUICtrlRead($chkDeleteOldPBPushes) = $GUI_CHECKED Then
		$ichkDeleteOldPBPushes = 1
		If $PushBulletEnabled Then GUICtrlSetState($cmbHoursPushBullet, $GUI_ENABLE)
	Else
		$ichkDeleteOldPBPushes = 0
		GUICtrlSetState($cmbHoursPushBullet, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkDeleteOldPBPushes

Func btnDeletePBMessages()
	$iDeleteAllPBPushesNow = True
EndFunc   ;==>btnDeletePBMessages

; Script by wewawe, renamed&disabled by Cosote 2016-01
Func _Restart_()
	Local $sCmdFile
	FileDelete(@TempDir & "restart.bat")
	$sCmdFile = 'tasklist /FI "IMAGENAME eq ' & @ScriptFullPath & '" | find /i "' & @ScriptFullPath & '"' & @CRLF _
			 & 'IF ERRORLEVEL 1 GOTO LAUNCHPROGRAM' & @CRLF _
			 & ' :LAUNCHPROGRAM ' & @CRLF _
			 & ' start "" "' & @ScriptFullPath & '" ' & @CRLF _
			 & 'call :deleteSelf&exit /b ' & @CRLF _
			 & ':deleteSelf ' & @CRLF _
			 & 'start /b "" cmd /c del "%~f0"&exit /b'
	FileWrite(@TempDir & "restart.bat", $sCmdFile)
	IniWrite($config, "general", "Restarted", 1)
	Run(@TempDir & "restart.bat", @TempDir, @SW_HIDE)
	CloseAndroid()
	BotClose()
EndFunc   ;==>_Restart_

; Restart Bot
Func _Restart()
	SetDebugLog("Restart " & $sBotTitle)
	Local $sCmdLine = ProcessGetCommandLine(@AutoItPID)
	If @error <> 0 Then
		SetLog("Cannot prepare to restart " & $sBotTitle & ", error code " & @error, $COLOR_RED)
		Return SetError(1, 0, 0)
	EndIf
	IniWrite($config, "general", "Restarted", 1)

	; add restart option (if not already there)
	If StringRight($sCmdLine, 9) <> " /Restart" Then
		$sCmdLine &= " /Restart"
	EndIf

	; Restart My Bot
	Local $pid = Run("cmd.exe /c start """" " & $sCmdLine, $WorkingDir, @SW_HIDE) ; cmd.exe only used to support launched like "..\AutoIt3\autoit3.exe" from console
	If @error = 0 Then
		CloseAndroid()
		SetLog("Restarting " & $sBotTitle)
		; Wait 1 Minute to get closed
		_SleepStatus(60 * 1000)
	Else
		SetLog("Cannot restart " & $sBotTitle, $COLOR_RED)
	EndIf

	Return SetError(2, 0, 0)
EndFunc   ;==>_Restart

;Telegram[Surbiks]
Func chkTEnabled()
	If GUICtrlRead($chkTEnabled) = $GUI_CHECKED Then
		$TelegramEnabled = 1
		GUICtrlSetState($chkTRemote, $GUI_ENABLE)
		GUICtrlSetState($TelegramTokenValue, $GUI_ENABLE)
		GUICtrlSetState($OrigTelegram, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTVMFound, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTLastRaid, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTWallUpgrade, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTLastRaidTxt, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTOOS, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTVBreak, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTVillage, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTLastAttack, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTOtherDevice, $GUI_ENABLE)
		GUICtrlSetState($btnDeleteTMessages, $GUI_ENABLE)
		GUICtrlSetState($chkAlertTCampFull, $GUI_ENABLE)
		For $i = $chkTRemote To $chkAlertTOtherDevice
		   GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$TelegramEnabled = 0
		GUICtrlSetState($chkTRemote, $GUI_DISABLE)
		GUICtrlSetState($TelegramTokenValue, $GUI_DISABLE)
		GUICtrlSetState($OrigTelegram, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTVMFound, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTLastRaid, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTWallUpgrade, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTLastRaidTxt, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTOOS, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTVBreak, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTVillage, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTLastAttack, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTOtherDevice, $GUI_DISABLE)
		GUICtrlSetState($btnDeleteTMessages, $GUI_DISABLE)
		GUICtrlSetState($chkAlertTCampFull, $GUI_DISABLE)
		For $i = $chkTRemote To $chkAlertTOtherDevice
		   GUICtrlSetState($i, $GUI_HIDE)
		Next

		GUICtrlSetState($cmbHoursTelegram, $GUI_DISABLE)

	EndIf
EndFunc

Func btnDeleteTMessages()
	$iDeleteAllTPushesNow = True
EndFunc
