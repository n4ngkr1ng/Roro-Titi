; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
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
Global $FirstControlToHideModrorotiti = GUICtrlCreateDummy()

$hGUI_MOD = GUICreate("", $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $frmBot)
;GUISetBkColor($COLOR_WHITE, $hGUI_BOT)

#include "MBR GUI Design Child Mod - DocOc.au3"
#include "MBR GUI Design Child Mod - Battlesettings.au3"
#include "MBR GUI Design Child Mod - Divers.au3"
#include "MBR GUI Design Child Mod - Meteo.au3"

GUISwitch($hGUI_MOD)

$hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem("DocOc")
; this tab will be empty because it is only used to display a child GUI
$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem("Attacks Settings")
; this tab will be empty because it is only used to display a child GUI
$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem("Miscellaneous Settings")
; this tab will be empty because it is only used to display a child GUI
$hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem("Forecast")
; this tab will be empty because it is only used to display a child GUI
GUICtrlCreateTabItem("")