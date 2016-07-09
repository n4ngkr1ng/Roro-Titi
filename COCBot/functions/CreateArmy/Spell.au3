; #FUNCTION# ====================================================================================================================
; Name ..........: BrewSpells
; Description ...: Create Normal Spells and Dark Spells
; Syntax ........: BrewSpells()
; Parameters ....:
; Return values .: None
; Author ........: ProMac ( 08-2015)
; Modified ......: Monkeyhunter (01/05-2016), Moebius14 05/2016
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func BrewSpells()

	; ATTENTION : This function only works if the ArmyOverView Windows is open
	Local $iLightningSpell, $iHealSpell, $iRageSpell, $iJumpSpell, $iFreezeSpell, $iPoisonSpell, $iEarthSpell, $iHasteSpell
	Local $ClickSpellDelay[6] = [1, 20, 40, 80, 160, 200] ; facteur 5 en ms entre chaque click sur un sort

	If $iTotalCountSpell = 0 Then Return

	If $numFactorySpellAvaiables = 1 And ($iLightningSpellComp > 0 Or $iRageSpellComp > 0 Or $iHealSpellComp > 0 Or $iJumpSpellComp > 0 Or $iFreezeSpellComp > 0) Then
		$iBarrHere = 0
		While Not (isSpellFactory())
			If Not (IsTrainPage()) Then Return
			_TrainMoveBtn(+1) ;click Next button
			$iBarrHere += 1
			If _Sleep($iDelayTrain3) Then ExitLoop
			If $iBarrHere = 8 Then ExitLoop
		WEnd
		If isSpellFactory() Then
			If $iLightningSpellComp > 0 Then ; Lightning Spells
				Local $iTempLightningSpell = Number(getBarracksTroopQuantity(175 + 107 * 0, 296 + $midOffsetY))
				
				$iLightningSpell = $iLightningSpellComp - ($CurLightningSpell + $iTempLightningSpell) ; not full, add more spell if needed
												
				If $debugsetlogTrain = 1 Then SetLog("Making Lightning Spell: " & $iLightningSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iLightningSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Lightning Spell(s)")
				EndIf
				If $iLightningSpell > 0 And $iChkBarrackSpell = 0 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Lightning Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else							
							GemClick(220 + 107 * 0, 354 + $midOffsetY, $iLightningSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iLightningSpell & " Lightning Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iLightningSpellBrewInAdvance = 1 Then
				$iLightningSpell = ($iLightningSpellComp - $iTempLightningSpell)
				EndIf
				If $iTempLightningSpell = $iLightningSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Lightning Spell(s) (Barrack Mode)")
				EndIf
				If $iLightningSpell > 0 And $iChkBarrackSpell = 1 And $iLightningSpellBrewInAdvance = 1 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Lightning Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 0, 354 + $midOffsetY, $iLightningSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iLightningSpell & " Lightning Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
			
			
			If $iHealSpellComp > 0 Then ; Heal Spells
				Local $iTempHealSpell = Number(getBarracksTroopQuantity(175 + 107 * 1, 296 + $midOffsetY))
				
				$iHealSpell = $iHealSpellComp - ($CurHealSpell + $iTempHealSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Heal Spell: " & $iHealSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iHealSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Heal Spell(s)")
				EndIf
				If $iHealSpell > 0 And $iChkBarrackSpell = 0 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
						setlog("Not enough Elixir to create Heal Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 1, 354 + $midOffsetY, $iHealSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iHealSpell & " Heal Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iHealSpellBrewInAdvance = 1 Then
				$iHealSpell = ($iHealSpellComp - $iTempHealSpell)
				EndIf
				If $iTempHealSpell = $iHealSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Heal Spell(s) (Barrack Mode)")
				EndIf
				If $iHealSpell > 0 And $iChkBarrackSpell = 1 And $iHealSpellBrewInAdvance = 1 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
						setlog("Not enough Elixir to create Heal Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 1, 354 + $midOffsetY, $iHealSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iHealSpell & " Heal Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
			
			
			If $iRageSpellComp > 0 Then ; Rage Spells
				Local $iTempRageSpell = Number(getBarracksTroopQuantity(175 + 107 * 2, 296 + $midOffsetY))
				
				$iRageSpell = $iRageSpellComp - ($CurRageSpell + $iTempRageSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Rage Spell: " & $iRageSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iRageSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Rage Spell(s)")
				EndIf
				If $iRageSpell > 0 And $iChkBarrackSpell = 0 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
						setlog("Not enough Elixir to create Rage Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 2, 354 + $midOffsetY, $iRageSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iRageSpell & " Rage Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iRageSpellBrewInAdvance = 1 Then
				$iRageSpell = ($iRageSpellComp - $iTempRageSpell)
				EndIf
				If $iTempRageSpell = $iRageSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Rage Spell(s) (Barrack Mode)")
				EndIf
				If $iRageSpell > 0 And $iChkBarrackSpell = 1 And $iRageSpellBrewInAdvance = 1 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
						setlog("Not enough Elixir to create Rage Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 2, 354 + $midOffsetY, $iRageSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iRageSpell & " Rage Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
			
			If $iJumpSpellComp > 0 Then ; Jump Spells
				Local $iTempJumpSpell = Number(getBarracksTroopQuantity(175 + 107 * 3, 296 + $midOffsetY))
				
				$iJumpSpell = $iJumpSpellComp - ($CurJumpSpell + $iTempJumpSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Jump Spell: " & $iJumpSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iJumpSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Jump Spell(s)")
				EndIf
				If $iJumpSpell > 0 And $iChkBarrackSpell = 0 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 3, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Jump Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 3, 354 + $midOffsetY, $iJumpSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iJumpSpell & " Jump Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iJumpSpellBrewInAdvance = 1 Then
				$iJumpSpell = ($iJumpSpellComp - $iTempJumpSpell)
				EndIf
				If $iTempJumpSpell = $iJumpSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Jump Spell(s) (Barrack Mode)")
				EndIf
				If $iJumpSpell > 0 And $iChkBarrackSpell = 1 And $iJumpSpellBrewInAdvance = 1 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 3, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Jump Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 3, 354 + $midOffsetY, $iJumpSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iJumpSpell & " Jump Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
			
			If $iFreezeSpellComp > 0 Then ; Freeze Spells
				Local $iTempFreezeSpell = Number(getBarracksTroopQuantity(175 + 107 * 4, 296 + $midOffsetY))
				
				$iFreezeSpell = $iFreezeSpellComp - ($CurFreezeSpell + $iTempFreezeSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Freeze Spell: " & $iFreezeSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iFreezeSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Freeze Spell(s)")
				EndIf
				If $iFreezeSpell > 0 And $iChkBarrackSpell = 0 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 4, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Freeze Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 4, 354 + $midOffsetY, $iFreezeSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iFreezeSpell & " Freeze Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iFreezeSpellBrewInAdvance = 1 Then
				$iFreezeSpell = ($iFreezeSpellComp - $iTempFreezeSpell)
				EndIf
				If $iTempFreezeSpell = $iFreezeSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Freeze Spell(s) (Barrack Mode)")
				EndIf
				If $iFreezeSpell > 0 And $iChkBarrackSpell = 1 And $iFreezeSpellBrewInAdvance = 1 Then
					If _ColorCheck(_GetPixelColor(235 + 107 * 4, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
						setlog("Not enough Elixir to create Freeze Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(220 + 107 * 4, 354 + $midOffsetY, $iFreezeSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iFreezeSpell & " Freeze Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
		Else
			SetLog("Spell Factory not found...", $COLOR_BLUE)
		EndIf
	EndIf

	If $numFactoryDarkSpellAvaiables = 1 And ($iPoisonSpellComp > 0 Or $iEarthSpellComp > 0 Or $iHasteSpellComp > 0) Then
		$iBarrHere = 0
		While Not (isDarkSpellFactory())
			If Not (IsTrainPage()) Then Return
			_TrainMoveBtn(+1) ;click Next button
			$iBarrHere += 1
			If $iBarrHere = 8 Then ExitLoop
			If _Sleep($iDelayTrain3) Then Return
		WEnd
		If isDarkSpellFactory() Then
			If $iPoisonSpellComp > 0 Then ; Poison Spells
				Local $iTempPoisonSpell = Number(getBarracksTroopQuantity(175 + 107 * 0, 296 + $midOffsetY))
				
				$iPoisonSpell = $iPoisonSpellComp - ($CurPoisonSpell + $iTempPoisonSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Poison Spell: " & $iPoisonSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iPoisonSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Poison Spell(s)")
				EndIf
				If ($iPoisonSpell > 0 And $iChkBarrackSpell = 0) Or ($iPoisonSpell > 0 And $iChkBarrackSpell = 1 And $iPoisonSpellBrewInAdvance = 0) Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Poison Spell", $COLOR_RED)
						If $debugsetlogTrain = 1 Then setlog("colorceck: " & 233 + 107 * 0& "," &  375 + $midOffsetY,$COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(222, 354 + $midOffsetY, $iPoisonSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iPoisonSpell & " Poison Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iPoisonSpellBrewInAdvance = 1 Then
				$iPoisonSpell = ($iPoisonSpellComp - $iTempPoisonSpell)
				EndIf
				If $iTempPoisonSpell = $iPoisonSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Poison Spell(s) (Barrack Mode)")
				EndIf
				If $iPoisonSpell > 0 And $iChkBarrackSpell = 1 And $iPoisonSpellBrewInAdvance = 1 Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 0, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Poison Spell", $COLOR_RED)
						If $debugsetlogTrain = 1 Then setlog("colorceck: " & 233 + 107 * 0& "," &  375 + $midOffsetY,$COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(222, 354 + $midOffsetY, $iPoisonSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iPoisonSpell & " Poison Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf

			If $iEarthSpellComp > 0 Then ; EarthQuake Spells
				Local $iTempEarthSpell = Number(getBarracksTroopQuantity(175 + 107 * 1, 296 + $midOffsetY))
				
				$iEarthSpell = $iEarthSpellComp - ($CurEarthSpell + $iTempEarthSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Earthquake Spell: " & $iEarthSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iEarthSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done EarthQuake Spell(s)")
				EndIf
				If ($iEarthSpell > 0 And $iChkBarrackSpell = 0) Or ($iEarthSpell > 0 And $iChkBarrackSpell = 1 And $iEarthSpellBrewInAdvance = 0) Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Earthquake Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(329, 354 + $midOffsetY, $iEarthSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iEarthSpell & " EarthQuake Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iEarthSpellBrewInAdvance = 1 Then
				$iEarthSpell = ($iEarthSpellComp - $iTempEarthSpell)
				EndIf
				If $iTempEarthSpell = $iEarthSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Earthquake Spell(s) (Barrack Mode)")
				EndIf
				If $iEarthSpell > 0 And $iChkBarrackSpell = 1 And $iEarthSpellBrewInAdvance = 1 Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 1, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Earthquake Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(329, 354 + $midOffsetY, $iEarthSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iEarthSpell & " EarthQuake Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf

			If $iHasteSpellComp > 0 Then ; Haste Spells
				Local $iTempHasteSpell = Number(getBarracksTroopQuantity(175 + 107 * 2, 296 + $midOffsetY))
				
				$iHasteSpell = $iHasteSpellComp - ($CurHasteSpell + $iTempHasteSpell) ; not full, add more spell if needed
				
				If $debugsetlogTrain = 1 Then SetLog("Making Haste Spell: " & $iHasteSpell)
				If _sleep($iDelayTrain2) Then Return
				
				If $iHasteSpell <= 0 And $iChkBarrackSpell = 0 Then
				Setlog("Already done Haste Spell(s)")
				EndIf
				If ($iHasteSpell > 0 And $iChkBarrackSpell = 0) Or ($iHasteSpell > 0 And $iChkBarrackSpell = 1 And $iHasteSpellBrewInAdvance = 0) Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Haste Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(430, 354 + $midOffsetY, $iHasteSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iHasteSpell & " Haste Spell(s)", $COLOR_BLUE)
					EndIf
				EndIf
				
				If $iChkBarrackSpell = 1 And $iEarthSpellBrewInAdvance = 1 Then
				$iHasteSpell = ($iHasteSpellComp - $iTempHasteSpell)
				EndIf
				If $iTempHasteSpell = $iHasteSpellComp And $iChkBarrackSpell = 1 Then
					Setlog("Already done Haste Spell(s) (Barrack Mode)")
				EndIf
				If $iHasteSpell > 0 And $iChkBarrackSpell = 1 And $iHasteSpellBrewInAdvance = 1 Then
					If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(233 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False And _; White into number 0
						   _ColorCheck(_GetPixelColor(235 + 107 * 2, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 5
						setlog("Not enough Elixir to create Haste Spell", $COLOR_RED)
						Return
					ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
						setlog("Spell Factory Full", $COLOR_RED)
						Return
					Else
							GemClick(430, 354 + $midOffsetY, $iHasteSpell, $iDelayTrain7 * $ClickSpellDelay[Random(0, 5, 1)], "#0290")
							SetLog("Created " & $iHasteSpell & " Haste Spell(s) (Barrack Mode)", $COLOR_BLUE)
					EndIf
				EndIf
			EndIf
		Else
			SetLog("Dark Spell Factory not found...", $COLOR_BLUE)
		EndIf
	EndIf
EndFunc   ;==>BrewSpells
