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

$hGUI_BattleSettings = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)

$hGUI_BattleSettings_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_BattleSettings_TAB_ITEM1 = GUICtrlCreateTabItem("Attacks Settings")

Local $xStart = 0, $yStart = 0

   ; SmartZap Settings

Local $x = $xStart + 30, $y = $yStart + 50

   $grpStatsMisc = GUICtrlCreateGroup("SmartZap", $x - 20, $y - 20, 420, 150)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 30, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x - 10, $y + 3, 24, 24)
		$chkSmartLightSpell = GUICtrlCreateCheckbox("Use Lightning Spells to Zap Drills", $x + 20, $y + 5, -1, -1)
		$txtTip =	"Check this to drop Lightning Spells on top of Dark Elixir Drills." & @CRLF & @CRLF & _
				"Remember to go to the tab 'troops' and put the maximum capacity " & @CRLF & _
				"of your spell factory and the number of spells so that the bot " & @CRLF & _
				"can function perfectly."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartLightSpell")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$chkSmartZapDB = GUICtrlCreateCheckbox("Only Zap Drills in Dead Bases", $x + 20, $y + 31, -1, -1)
		$txtTip =	"It is recommended you only zap drills in dead bases as most of the " & @CRLF & _
				"Dark Elixir in a live base will be in the storage."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapDB")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$lblSmartZap = GUICtrlCreateLabel("Min. amount of Dark Elixir:", $x - 10, $y + 58, 160, -1, $SS_RIGHT)
		$txtMinDark = GUICtrlCreateInput("478", $x + 155, $y + 55, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		$txtTip =	"The value here depends a lot on what level your Town Hall is, " & @CRLF & _
				"and what level drills you most often see."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
		$chkSmartZapSaveHeroes = GUICtrlCreateCheckbox("TH snipe NoZap if Heroes Deployed", $x + 20, $y + 79, -1, -1)
		$txtTip =	"This will stop SmartZap from zapping a base on a Town Hall Snipe " & @CRLF & _
				"if your heroes were deployed. " & @CRLF & @CRLF & _
				"This protects their health so they will be ready for battle sooner!"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapSaveHeroes")
			GUICtrlSetState(-1, $GUI_CHECKED)
	Local $x = 220, $y = 70
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 160, $y + 3, 24, 24)
		$lblSmartZap = GUICtrlCreateLabel("0", $x + 60, $y + 5, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Number of dark elixir zapped during the attack with lightning."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 160, $y + 40, 24, 24)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x + 60, $y + 40, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Amount of used spells."
			GUICtrlSetTip(-1, $txtTip)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
