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

$hGUI_Divers = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)

$hGUI_Divers_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_Divers_TAB_ITEM1 = GUICtrlCreateTabItem("Miscellaneous Settings")

Local $xStart = 0, $yStart = 0

   ; Collect Treasury

Local $x = $xStart + 230, $y = $yStart - 80

	    $grpTreasury = GUICtrlCreateGroup("Collect Treasury", $x - 220, $y + 110 , 420, 100) ;70
		$chkCollectTresory = GUICtrlCreateCheckbox( "Enable", $x - 210, $y + 135, -1, -1)
		$txtTip = "Enable auto collect of treasury."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkCollectTresory")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
		$leurequisertarienTresor = GUICtrlCreateLabel("", $x - 180, $y + 135, -1, -1, $SS_RIGHT)
		GUICtrlCreateIcon ($pIconLib, $eIcnGold,  $x - 120 , $y + 150, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
		$chkTRFull = GUICtrlCreateCheckbox("When Full",$x - 210,$y + 165, -1, -1)
		$txtTip = "Check to the bot collect the treasury when full"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_HIDE)
		$txtTreasuryGold = GUICtrlCreateInput("0",  $x  -100, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Minimum Gold amount below which the bot will collect the treasury."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		GUICtrlSetState(-1, $GUI_HIDE)

		$chkCollectTresoryGold = GUICtrlCreateCheckbox( "Gold", $x - 90, $y + 125, -1, -1)
		$txtTip = "Enable automatic collect of treasury according to Gold amount."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkCollectTresoryGold")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
		GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x - 15, $y + 150, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
		$btnResetOR = GUICtrlCreateButton("Reset", $x - 92 , $y + 180, 45, 18)
 		GUICtrlSetOnEvent(-1, "ResetOr")
		GUICtrlSetState(-1, $GUI_HIDE)

		$txtTreasuryElixir = GUICtrlCreateInput("0", $x + 5, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Minimum Elixir amount below which the bot will collect the treasury."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		GUICtrlSetState(-1, $GUI_HIDE)
		$chkCollectTresoryElixir = GUICtrlCreateCheckbox( "Elixir", $x + 10, $y + 125, -1, -1)
		$txtTip = "Enable automatic collect of treasury according to Elixir amount."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkCollectTresoryElixir")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
		GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 90, $y + 150, 16, 16)
		GUICtrlSetState(-1, $GUI_HIDE)
		$btnResetEL = GUICtrlCreateButton("Reset", $x + 13 , $y + 180, 45, 18)
 		GUICtrlSetOnEvent(-1, "ResetEL")
		GUICtrlSetState(-1, $GUI_HIDE)

		$txtTreasuryDark = GUICtrlCreateInput("0", $x + 110, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Minimum Dark Elixir amount below which the bot will collect the treasury."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		GUICtrlSetState(-1, $GUI_HIDE)
		$chkCollectTresoryDark = GUICtrlCreateCheckbox( "Dark Elixir", $x + 115, $y + 125, -1, -1)
		$txtTip = "Enable automatic collect of treasury according to Dark Elixir amount."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkCollectTresoryDark")
		GUICtrlSetState(-1, $GUI_UNCHECKED)
		GUICtrlSetState(-1, $GUI_HIDE)
		$btnResetDE = GUICtrlCreateButton("Reset", $x + 118, $y + 180, 45, 18)
 		GUICtrlSetOnEvent(-1, "ResetDE")
		GUICtrlSetState(-1, $GUI_HIDE)

		GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")
