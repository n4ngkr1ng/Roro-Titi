; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Moebius14 06/2016
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$hGUI_METEO = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)

$hGUI_METEO_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 285, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_METEO_TAB_ITEM1 = GUICtrlCreateTabItem("Breaks && Boosts && Switch")

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 30

$grpActualValue = GUICtrlCreateGroup("Weather index", $x , $y , 420, 60)
$TxtActualIndexValue = GUICtrlCreateLabel("Actual weather index" , $x + 80, $y + 27, 160, 15, $SS_RIGHT)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$TxtActualIndexValueEgal = GUICtrlCreateLabel("  = " , $x + 110, $y + 29, 160, 15, $SS_RIGHT)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$lblActualIndexValue = GUICtrlCreateLabel("" , $x + 275, $y + 27, 30, 15, $SS_RIGHT)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
$surdix = GUICtrlCreateLabel("/10" , $x + 305, $y + 27, 30, 15, $SS_RIGHT)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetFont(-1, 12.5, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
GUICtrlSetColor(-1, 0x000000)
GUICtrlCreateGroup("", -99, -99, 1, 1)


$y += 70
$grpPauses = GUICtrlCreateGroup("Weather breaks", $x , $y , 420, 80)
	$chkForecastPause = GUICtrlCreateCheckbox("Take breaks when the weather index <", $x + 10, $y + 25, -1, -1)
		$txtTip = "The bot will pause when the index drops below the set value."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkForecastPause")
		GUICtrlSetState(-1, $GUI_ENABLE)
		GUICtrlSetState(-1, $GUI_UNCHECKED)
	$txtForecastPause = GUICtrlCreateInput("2.5", $x + 225, $y + 27, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		$txtTip = "Minimum loot index."
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetData(-1, 2.5)
		GUICtrlSetTip(-1, $txtTip)
		_GUICtrlEdit_SetReadOnly(-1, True)
	$chkDontRemoveredzone = GUICtrlCreateCheckbox("Don't empty barracks at each reconnection if the index is below the set value", $x + 10, $y + 50, -1, -1)
		$txtTip ="The bot doesn't empty barracks at each reconnection if the index is below the set value."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += 85
$grpBoost = GUICtrlCreateGroup("Boosts", $x , $y , 420, 70)
	$chkForecastBoost = GUICtrlCreateCheckbox("Boost only when the weather index >", $x + 10, $y + 25, -1, -1)
		$txtTip = "Boost Barracks, Spells, and/or Heroes (Specified on the Troops tab) only when the loot index is above the specified value."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkForecastBoost")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
	$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 210, $y + 27, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		$txtTip = "Minimum loot index for boosting."
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetData(-1, 6.0)
		GUICtrlSetTip(-1, $txtTip)
		_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += 80
$grpHoping = GUICtrlCreateGroup("Profile Switch", $x , $y , 420, 90)
	$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox("Switch to", $x + 10, $y + 25, -1, -1)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
	$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 80, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMax = GUICtrlCreateLabel("When Weather Index <", $x + 180, $y + 30, -1, -1)
	$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 300, $y + 28, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
	$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox("Switch to", $x + 10, $y + 55, -1, -1)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
	$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 80, $y + 55, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMin = GUICtrlCreateLabel("When Weather Index >", $x + 180, $y + 60, -1, -1)
	$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 300, $y + 58, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBox()
GUICtrlCreateTabItem("")
;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideModrorotiti = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideModrorotiti + 1]
;~ -------------------------------------------------------------
