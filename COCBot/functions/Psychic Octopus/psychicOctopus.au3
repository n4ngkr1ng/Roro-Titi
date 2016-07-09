; #FUNCTION# ====================================================================================================================
; Name ..........: protectionAntiBot
; Description ...: Contains functions to protect against Super Cell Anti-Bot detection
; Syntax ........:
; Parameters ....:
; Return values .: None
; Author ........: LunaEclipse(April, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

#include <Date.au3>

Func CloseCOCAndWait($timeRemaining)

	Local $tempCloseCoC = 0

	; RAndom Stay connect on Game Or Close the Game while Training
	If ($ichkCloseTraining = 1 And $RAndomCloseTraining = 1 And $RAndomCloseTraining2 = 1) Then Return

	; RAndom Close Or Leave
	If $RAndomCoCOpen = 1 Then
		if $debugSetlog = 1 Then  Setlog("Random Close Or Leave ...", $COLOR_RED)
		$tempCloseCoC = RAndom(0,1,1)
		if $debugSetlog = 1 Then  Setlog("$tempCloseCoC: " & $tempCloseCoC)
	EndIf

	If $ichkUseSpellsTrainingClose = 1 Then $IsTonotifyOneTime = 0 ; Cas exceptionnel FullArmy/Tps de Formation Sorts coché/Fermeture après démarrage car sorts en formation

	; Randomly choose whether to actually exit COC Or do nothing (time out)
	If $CloseCoCGame = 1 Or ($RandomCoCOpen = 1 And $tempCloseCoC = 1) Then
		Setlog("Classical closure of CoC", $COLOR_BLUE)
		$RandomSecondsClassical = (Random(0, 60, 1) * 1000)
		; Force close the bot
		; Find And wait for the confirmation of exit "okay" button
		Local $counter = 0
		While 1
			checkObstacles()
			AndroidBackButton()

			; Wait for window to open
			If _Sleep($iDelayAttackDisable1000) Then Return
			; Confirm okay to exit
			If ClickOkay("ExitCoCokay", True) = True Then ExitLoop

			If $counter > 10 Then
				If $debugImageSave = 1 Then DebugImageSave("CheckAttackDisableFailedButtonCheck_")
				Setlog("Can not find Okay button to exit CoC, Forcefully Closing CoC", $COLOR_RED)

				CloseCoC()
				ExitLoop
			EndIf
			$counter += 1
		WEnd
		; Short wait for CoC to exit
		If _Sleep(1500) Then Return
		If CloseAndroid() Then Return

		; Pushbullet Msg
		;PushMsg("TakeBreak")
		; Log off CoC for set time
		SetLog(" ")
		SetLog("Waiting " & $timeRemaining / 60 & " minutes and " & ($RandomSecondsClassical / 1000) & " seconds before restarting Emulator and CoC", $COLOR_PURPLE)
		If _Sleep(($timeRemaining * 1000) + $RandomSeconds) Then Return
		StartAndroidCoC()

	Else

		Setlog("Timeout closure of CoC", $COLOR_BLUE)
		; Nothing is needed here for timeout, as WaitnOpenCoC will stop the bot from doing anything so it will timeout naturally
		; Pushbullet Msg
		;PushMsg("TakeBreak")
		; Just wait without close the CoC

		If $timeRemaining > 600 Then
			$RandomSecondsTimeoutInactivity = ((Random(1, 60, 1)) * 1000)
			$RandomSecondsInactivity = ((Random(0, $RandomSecondsTimeoutInactivity, 1)) * 1000)

			SetLog("Troops training delay > 10mins :", $COLOR_PURPLE)
			SetLog("Inactivity during 6 minutes and " & ($RandomSecondsInactivity / 1000) & " seconds then Emulator closing", $COLOR_PURPLE)
			SetLog(" ")
			SetLog("Waiting " & (((($timeRemaining * 1000) + 360000) / 60) / 1000) & " minutes and " & (($RandomSecondsTimeoutInactivity + $RandomSecondsInactivity) / 1000) & " seconds before starting to play again", $COLOR_PURPLE)
			SetLog("Waiting 6 minutes and " & ($RandomSecondsInactivity / 1000) & " before closing Emulator", $COLOR_PURPLE)

			If _Sleep(360000 + $RandomSecondsInactivity) Then Return
				If CloseAndroid() Then Return

				SetLog("Waiting " & (((($timeRemaining * 1000) - 360000) / 60) / 1000) & " minutes and " & (($RandomSecondsTimeoutInactivity - $RandomSecondsInactivity) / 1000) & " seconds before restarting Emulator and CoC", $COLOR_PURPLE)
				If _Sleep((($timeRemaining * 1000) + $RandomSecondsTimeoutInactivity) - (360000 + $RandomSecondsInactivity))	Then Return
				StartAndroidCoC()

		Else

			$RandomSecondsTimeout = (Random(0, 60, 1) * 1000)

			SetLog("Troops training delay < 10mins :", $COLOR_PURPLE)
			SetLog("Just inactivity, no Emulator closing", $COLOR_PURPLE)
			SetLog(" ")
			SetLog("Waiting " & ($timeRemaining / 60) & " minutes and " & ($RandomSecondsTimeout / 1000) & " seconds before starting CoC", $COLOR_PURPLE)

			WaitnOpenCoC(($timeRemaining * 1000) + $RandomSecondsTimeout), True, False)
		EndIf

	EndIf

EndFunc   ;==>CloseCOCAndWait

Func calculateDailyAttackLimit()
	Local $result = RAndom(_Min($rangeAttacksStart, $rangeAttacksEnd), _Max($rangeAttacksStart, $rangeAttacksEnd), 1)

	Return $result
EndFunc   ;==>calculateDailyAttackLimit

Func calculateSleepStart()
	; Calculate a rAndom offset for the start time
	Local $sleepOffset = RAndom(-30, 30, 1)
	; Create the start time string
	Local $dateString = @YEAR & "/" & @MON & "/" & @MDAY & " " & StringFormat("%02i", $sleepStart) & ":00:00"

	; Check if we are past the start hour And need to add one day
	If (@HOUR = $sleepStart - 1 And @MIN >= 30) Or @HOUR >= $sleepStart Then $dateString = _DateAdd("D", 1, $dateString)

	; Add the offset to the start time
	Return _DateAdd("n", $sleepOffset, $dateString)
EndFunc   ;==>calculateSleepStart

Func calculateSleepEnd()
	; Calculate a rAndom offset for the end time
	Local $sleepOffset = RAndom(-30, 30, 1)
	; Create the end time string
	Local $dateString = @YEAR & "/" & @MON & "/" & @MDAY & " " & StringFormat("%02i", $sleepEnd) & ":00:00"

	; Check if we are past the start hour And need to add one day
	If (@HOUR = $sleepEnd - 1 And @MIN >= 30) Or @HOUR >= $sleepEnd Then $dateString = _DateAdd("D", 1, $dateString)

	; Add the offset to the end time
	Return _DateAdd("n", $sleepOffset, $dateString)
EndFunc   ;==>calculateSleepEnd

Func calculateTimeRemaining($compareTime, $currentTime = _NowCalc())
	; Calculate how many seconds remain until it will stop sleeping
	Local $result = _DateDiff("s", $currentTime, $compareTime)

	; Returns the amount of time until sleeping ends in seconds
	Return $result
EndFunc   ;==>calculateTimeRemaining

Func isTimeAfter($compareTime, $currentTime = _NowCalc())
	; Check to see if the amount of seconds remaining is less than 0
	Local $result = _DateDiff("s", $currentTime, $compareTime) < 0

	Return $result
EndFunc   ;==>isTimeAfter

Func isTimeBefore($compareTime, $currentTime = _NowCalc())
	; Check to see if the amount of seconds remaining is greater than 0
	Local $result = _DateDiff("s", $currentTime, $compareTime) > 0

	Return $result
EndFunc   ;==>isTimeBefore

Func isTimeInRange($startTime, $endTime)
	Local $currentTime = _NowCalc()
	; Calculate if time until start time is less than 0 And time until end time is greater than 0
	Local $result = isTimeAfter($startTime, $currentTime) And isTimeBefore($endTime, $currentTime)

	; Returns whether the current time is within the range
	Return $result
EndFunc   ;==>isTimeInRange

Func checkRemainingTraining()
	If $ichkCloseTraining = 0 Then Return

	; Get the time remaining in minutes
	If $ichkUseSpellsTrainingClose = 0 Then
	Local $iRemainingTimeTroops = getRemainingTraining(True, False)
	ElseIf $ichkUseSpellsTrainingClose = 1 Then
	Local $iRemainingTimeTroops = getRemainingTraining(True, True)
	EndIf

	; Check if the Remaining time is less Then 2 minutes
	If $iRemainingTimeTroops <= 2 Then Return
If $Extratime = 1 Then
	; Add rAndom additional time from $minTrainAddition minute to $maxTrainAddition minutes
	$TempsAdditionnel += RAndom($minTrainAddition, $maxTrainAddition, 1)
	$iRemainingTimeTroops += $TempsAdditionnel
	; Convert remaining time to seconds And close COC And wait for that length of time
	If $RAndomCloseTraining2 = 0 Then
	If $TempsAdditionnel = 1 Then
	Setlog("Additional time : : " & $TempsAdditionnel & " minute", $COLOR_BLUE)
	ElseIf $TempsAdditionnel > 1 Then
	Setlog("Additional time : " & $TempsAdditionnel & " minutes", $COLOR_BLUE)
	ElseIf $TempsAdditionnel = 0 Then
	Setlog("No additional time", $COLOR_BLUE)
	EndIf
	EndIf
EndIf
	CloseCOCAndWait($iRemainingTimeTroops * 60)
	$TempsAdditionnel = 0
EndFunc   ;==>checkRemainingTraining
Func checkSleep()
	Local $result = False

	; Check to see if we have calculated a rAndom daily attack limit
	If $dailyAttackLimit = 0 Then
		If $debugSetLog = 1 Then SetLog("Calculating Daily Attack Limit because there is no limit set!", $COLOR_MAROON)
		$dailyAttackLimit = calculateDailyAttackLimit()
	EndIf
	; Lets reset the daily attacks as we don't know when they were supposed to finish
	If $dailyAttacks > 0 And $nextSleepEnd = -999 Then
		If $debugSetLog = 1 Then SetLog("Resetting Daily Attack Count because there is no time for when it finished!", $COLOR_MAROON)
		$dailyAttacks = 0
	EndIf
	; Calculate the new start time if none is stored
	If $nextSleepStart = -999 Then
		If $debugSetLog = 1 Then SetLog("There is no sleep start time stored, calculating it now...", $COLOR_MAROON)
		$nextSleepStart = calculateSleepStart()
	EndIf
	; Calculate the new end time if none is stored
	If $nextSleepEnd = -999 Then
		If $debugSetLog = 1 Then SetLog("There is no sleep end time stored, calculating it now...", $COLOR_MAROON)
		$nextSleepEnd = calculateSleepEnd()
	EndIf
	; If the end time is before the start time, subtract 1 day
	If isTimeBefore($nextSleepStart, $nextSleepEnd) Then
		$nextSleepStart = _DateAdd("D", -1, $nextSleepStart)
		If $debugSetLog = 1 Then SetLog("Start time adjusted because its after the finish time!", $COLOR_MAROON)
	EndIf

	; Check to see if its withing sleeping times
	If isTimeInRange($nextSleepStart, $nextSleepEnd) Then
		$result = True
	ElseIf isTimeAfter($nextSleepEnd) Then
		If $debugSetLog = 1 Then SetLog("Calculating new sleep times!", $COLOR_MAROON)
		; Calculate the new start And end times because the current end time has been passed
		$nextSleepStart = calculateSleepStart()
		$nextSleepEnd = calculateSleepEnd()

		; Reset the number of attacks for the day
		$dailyAttackLimit = calculateDailyAttackLimit()
		$dailyAttacks = 0
	EndIf

	Return $result
EndFunc   ;==>checkSleep
