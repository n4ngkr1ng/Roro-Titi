; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab DocOc
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(April, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================


$hGUI_DOCOC = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)

GUISwitch($hGUI_DOCOC)

$hGUI_DOCOC_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_DOCOC_TAB_ITEM1 = GUICtrlCreateTabItem("Close CoC when troops are training")
	; Close When Training Settings
	Local $xStart = 0, $yStart = 0
	Local $x = $xStart + 30, $y = $yStart + 50
	$grpTrainingClose = GUICtrlCreateGroup("Formation settings", $x - 20, $y - 20, 420, 215)
		GUICtrlCreateIcon ($pIconLib, $eIcnTrainMode, $x - 10, $y + 10, 48, 48)
		$chkUseTrainingClose = GUICtrlCreateCheckbox("Close CoC during troops training", $x + 50, $y - 5 , -1, -1)
			$txtTip = "Check to close CoC when there are more than 2mins of traing."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkUseTrainingClose")
			GUICtrlSetState(-1, $GUI_CHECKED)
		 $y +=18
		$chkUseSpellsTrainingClose = GUICtrlCreateCheckbox("Take spells into account", $x + 50, $y - 5, -1, -1)
			$txtTip = "Check to take in account spells brewing time."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$lblExtraTimeMin = GUICtrlCreateLabel("Extra Time Min: ", $x + 67, $y + 25, 90, -1, $SS_RIGHT)
		$lblExtraTimeMinNumber = GUICtrlCreateLabel("2", $x + 165, $y + 25, 15, 15, $SS_RIGHT)
		$lblExtraTimeMinUnit = GUICtrlCreateLabel("minutes", $x + 185, $y + 25, -1, -1)
		$sldExtraTimeMin = GUICtrlCreateSlider($x + 235, $y + 23, 150, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			$txtTip = "Select minimum extra time to add to training time." & @CRLF & _
				      "     Value must be between 0 and 30 mins."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 30)
			GUICtrlSetData(-1, 2)
			GUICtrlSetOnEvent(-1, "sldExtraTimeMin")
		$lblExtraTimeMax = GUICtrlCreateLabel("Extra Time Max: ", $x + 70, $y + 51, 90, -1, $SS_RIGHT)
		$lblExtraTimeMaxNumber = GUICtrlCreateLabel("12", $x + 165, $y + 51, 15, 15, $SS_RIGHT)
		$lblExtraTimeMaxUnit = GUICtrlCreateLabel("minutes", $x + 185, $y + 51, -1, -1)
		$sldExtraTimeMax = GUICtrlCreateSlider($x + 235, $y + 48, 150, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			$txtTip = "Select maximum extra time to add to training time." & @CRLF & _
				      "     Value must be between 0 and 30 mins."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 30)
			GUICtrlSetData(-1, 12)
			GUICtrlSetOnEvent(-1, "sldExtraTimeMax")
		$radLeaveCoCOpen = GUICtrlCreateRadio("Auto disconnect by inactivity and then close Emu if delay > 10mins", $x + 60, $y + 80, -1, -1)
			GUICtrlSetTip(-1, "During training, the bot will do nothing and CoC will disconnect automatically due to inactivity (Timeout).")
		$radCloseCoCGame = GUICtrlCreateRadio("Close CoC and then close Emu", $x + 60, $y + 98, -1, -1)
			GUICtrlSetTip(-1, "During training, the bot will close CoC and stay on the Android home screen (Classic).")
		$radRandomCoCOpen = GUICtrlCreateRadio("Classic closing or closing by inactivity", $x + 60, $y + 116, -1, -1)
			GUICtrlSetTip(-1, "During training, the bot will ramdomly close or stay on the Android home screen (Random Classic or Timeout Closing).")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$chkRandomStayORClose = GUICtrlCreateCheckbox("In addition to the previous choices, ability to stay connected", $x + 50, $y + 145, -1, -1)
			$txtTip = ("Enable this option to randomize the maintenance online or the option chosen above during training.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateTabItem("")

$hGUI_DOCOC_TAB_ITEM2 = GUICtrlCreateTabItem("Sleep Time")
	; Simulate Sleep Settings
	Local $xStart = 0, $yStart = 0
	Local $x = $xStart + 30, $y = $yStart + 50
	$grpSleep = GUICtrlCreateGroup("Sleep simulation", $x - 20, $y - 20, 420, 100)
		$chkUseSleep = GUICtrlCreateCheckbox("Sleep time", $x + 50, $y - 5, -1, -1)
			$txtTip = "Enable to simulate a period of sleep after heavy activity." & @CRLF & @CRLF & _
				      "     Doctor's Recommendation: Use at least 8 hours of sleep."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkUseSleep")
		$lblStartSleep = GUICtrlCreateLabel("Start: ", $x + 150, $y, 90, -1, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$cmbStartSleep = GUICtrlCreateCombo("", $x + 250, $y - 3, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select the time from which sleep begins." & @CRLF & _
				      "     Approximation +/- 30 mins." & @CRLF & @CRLF & _
				      "     Doctor's Recommendation: Minimum 8 hours between start and end."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "12 AM|  1 AM|  2 AM|  3 AM|  4 AM|  5 AM|  6 AM|  7 AM|  8 AM|  9 AM|10 AM|11 AM|12 PM|  1 PM|  2 PM|  3 PM|  4 PM|  5 PM|  6 PM|  7 PM|  8 PM|  9 PM|10 PM|11 PM", "12 AM")
			GUICtrlSetOnEvent(-1, "cmbStartSleep")
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblEndSleep = GUICtrlCreateLabel("End: ", $x + 150, $y + 26, 90, -1, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$cmbEndSleep = GUICtrlCreateCombo("", $x + 250, $y + 23, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select the time from which the sleep stops." & @CRLF & _
				      "     Approximation +/- 30 mins." & @CRLF & @CRLF & _
				      "     Doctor's Recommendation: Minimum 8 hours between start and end."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "12 AM|  1 AM|  2 AM|  3 AM|  4 AM|  5 AM|  6 AM|  7 AM|  8 AM|  9 AM|10 AM|11 AM|12 PM|  1 PM|  2 PM|  3 PM|  4 PM|  5 PM|  6 PM|  7 PM|  8 PM|  9 PM|10 PM|11 PM", "  8 AM")
			GUICtrlSetOnEvent(-1, "cmbEndSleep")
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblTotalSleep = GUICtrlCreateLabel("Estimated sleep time: 7-9 hours", $x - 10, $y + 50, 420, -1, $SS_CENTER)
		GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlCreateIcon ($pIconLib, $eIcnSleepMode, $x - 10, $y + 10, 48, 48)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateTabItem("")

$hGUI_DOCOC_TAB_ITEM3 = GUICtrlCreateTabItem("Daily Activity")
	Local $xStart = 0, $yStart = 0
	Local $x = $xStart + 30, $y = $yStart + 50
	; Daily Settings
	$grpTrainingClose = GUICtrlCreateGroup("Daily settings", $x - 20, $y - 20, 420, 100)
	GUICtrlCreateIcon ($pIconLib, $eIcnDailyProgram, $x - 10, $y + 10, 48, 48)
		$chkUseAttackLimit = GUICtrlCreateCheckbox("Maximum daily attacks", $x + 50, $y - 5, -1, -1)
			$txtTip = "Enable this option to limit the number of daily attacks that the bot can perform." & @CRLF & @CRLF & _
				      "     Doctor's Recommendation: Use this setting to limit the excess of attacks."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkUseAttackLimit")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$lblAttacksMin = GUICtrlCreateLabel("Min Attacks: ", $x + 70, $y + 24, 90, -1, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$lblAttacksMinNumber = GUICtrlCreateLabel("20", $x + 165, $y + 24, 15, 15, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$lblAttacksMinUnit = GUICtrlCreateLabel("Attacks", $x + 185, $y + 24, -1, -1)
		GUICtrlSetState(-1, $GUI_HIDE)
		$sldAttacksMin = GUICtrlCreateSlider($x + 235, $y + 22, 150, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			$txtTip = "Select the minimum limit of daily attacks." & @CRLF & _
				      "     The value must be between 0 and 25 attacks."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 25)
			GUICtrlSetData(-1, 20)
			GUICtrlSetOnEvent(-1, "sldAttacksMin")
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblAttacksMax = GUICtrlCreateLabel("Max Attacks: ", $x + 70, $y + 50, 90, -1, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$lblAttacksMaxNumber = GUICtrlCreateLabel("25", $x + 165, $y + 50, 15, 15, $SS_RIGHT)
		GUICtrlSetState(-1, $GUI_HIDE)
		$lblAttacksMaxUnit = GUICtrlCreateLabel("Attacks", $x + 185, $y + 50, -1, -1)
		GUICtrlSetState(-1, $GUI_HIDE)
		$sldAttacksMax = GUICtrlCreateSlider($x + 235, $y + 47, 150, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			$txtTip = "Select the maximum limit of daily attacks." & @CRLF & _
				      "     The value must be between 0 and 25 attacks."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 25)
			GUICtrlSetData(-1, 25)
			GUICtrlSetOnEvent(-1, "sldAttacksMax")
			GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
