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

$hGUI_NOTIFY = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_VILLAGE)
;GUISetBkColor($COLOR_WHITE, $hGUI_NOTIFY)

$hGUI_NOTIFY_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
;$hGUI_NOTIFY_TAB_ITEM1 = GUICtrlCreateTabItem("How")
;	Local $x = 25, $y = 45
;GUICtrlCreateTabItem("")

$hGUI_NOTIFY_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslated(600,18,"PushBullet"))
	Global $grpPushBullet, $chkPBenabled,$chkPBRemote,$chkDeleteAllPBPushes,$btnDeletePBmessages,$chkDeleteOldPBPushes,$cmbHoursPushBullet
	Global $PushBulletTokenValue, $OrigPushBullet, $chkAlertPBVMFound, $chkAlertPBLastRaid, $chkAlertPBLastRaidTxt, $chkAlertPBCampFull
	Global $chkAlertPBWallUpgrade, $chkAlertPBOOS, $chkAlertPBVBreak, $chkAlertPBVillage, $chkAlertPBLastAttack
	Global $chkAlertPBOtherDevice

	Local $x = 25, $y = 45
		$grpPushBullet = GUICtrlCreateGroup(GetTranslated(619,2, "PushBullet Alert"), $x - 20, $y - 20, 430, 334)
		$x -= 10
		$picPushBullet = GUICtrlCreateIcon ($pIconLib, $eIcnPushBullet, $x + 3, $y, 32, 32)
		$chkPBenabled = GUICtrlCreateCheckbox(GetTranslated(619,3, "Enable"), $x + 40, $y)
			GUICtrlSetOnEvent(-1, "chkPBenabled")
			GUICtrlSetTip(-1, GetTranslated(619,4, "Enable PushBullet notifications"))
		$y += 22
		$chkPBRemote = GUICtrlCreateCheckbox(GetTranslated(619,5, "Remote Control"), $x + 40, $y)
			GUICtrlSetTip(-1, GetTranslated(619,6, "Enables PushBullet Remote function"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y = 45
		$chkDeleteAllPBPushes = GUICtrlCreateCheckbox(GetTranslated(619,7, "Delete Msg on Start"), $x + 160, $y)
			GUICtrlSetTip(-1, GetTranslated(619,8, "It will delete all previous push notification when you start bot"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnDeletePBmessages = GUICtrlCreateButton(GetTranslated(619,9, "Delete all Msg now"), $x + 300, $y, 100, 20)
			GUICtrlSetTip(-1, GetTranslated(619,10, "Click here to delete all Pushbullet messages."))
			GUICtrlSetOnEvent(-1, "btnDeletePBMessages")
			IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 22
		$chkDeleteOldPBPushes = GUICtrlCreateCheckbox(GetTranslated(619,11, "Delete Msg older than"), $x + 160, $y)
			GUICtrlSetTip(-1, GetTranslated(619,12, "Delete all previous push notification older than specified hour"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkDeleteOldPBPushes")
		$cmbHoursPushBullet = GUICtrlCreateCombo("", $x + 300, $y, 100, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, GetTranslated(619,13, "Set the interval for messages to be deleted."))
			$sTxtHours = GetTranslated(603,14, "Hours")
			GUICtrlSetData(-1, "1 " & GetTranslated(603,15, "Hour") &"|2 " & $sTxtHours & "|3 " & $sTxtHours & "|4 " & $sTxtHours & "|5 " & $sTxtHours & "|6 " & $sTxtHours & "|7 " & $sTxtHours & "|8 " &$sTxtHours & "|9 " & $sTxtHours & "|10 " & $sTxtHours & "|11 " & $sTxtHours & "|12 " & $sTxtHours & "|13 " & $sTxtHours & "|14 " & $sTxtHours & "|15 " & $sTxtHours & "|16 " & $sTxtHours & "|17 " & $sTxtHours & "|18 " & $sTxtHours & "|19 " & $sTxtHours & "|20 " & $sTxtHours & "|21 " & $sTxtHours & "|22 " & $sTxtHours & "|23 " & $sTxtHours & "|24 " & $sTxtHours )
			_GUICtrlComboBox_SetCurSel(-1,0)
			GUICtrlSetState (-1, $GUI_DISABLE)
		$y += 30
		$lblPushBulletTokenValue = GUICtrlCreateLabel(GetTranslated(619,14, "Access Token") & ":", $x, $y, -1, -1, $SS_RIGHT)
		$PushBulletTokenValue = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
			GUICtrlSetTip(-1, GetTranslated(619,15, "You need a Token to use PushBullet notifications. Get a token from PushBullet.com"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 25
		$lblOrigPushBullet = GUICtrlCreateLabel(GetTranslated(619,16, "Origin") & ":", $x, $y, -1, -1, $SS_RIGHT)
			$txtTip = GetTranslated(619,17, "Origin - Village name.")
			GUICtrlSetTip(-1, $txtTip)
		$OrigPushBullet = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 25
		$lblNotifyPBWhen = GUICtrlCreateLabel(GetTranslated(619,18, "Send a PushBullet message for these options") & ":", $x, $y, -1, -1, $SS_RIGHT)
		$y += 15
		$chkAlertPBVMFound = GUICtrlCreateCheckbox(GetTranslated(619,19, "Match Found"), $x + 10, $y)
			GUICtrlSetTip(-1, GetTranslated(619,20, "Send the amount of available loot when bot finds a village to attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastRaid = GUICtrlCreateCheckbox(GetTranslated(619,21, "Last raid as image"), $x + 100, $y)
			GUICtrlSetTip(-1, GetTranslated(619,22, "Send the last raid screenshot."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastRaidTxt = GUICtrlCreateCheckbox(GetTranslated(619,23, "Last raid as Text"), $x + 210, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetTip(-1, GetTranslated(619,24, "Send the last raid results as text."))
		$chkAlertPBCampFull = GUICtrlCreateCheckbox(GetTranslated(619,25, "Army Camp Full"), $x + 315, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,26, "Sent an Alert when your Army Camp is full."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertPBWallUpgrade = GUICtrlCreateCheckbox(GetTranslated(619,27, "Wall upgrade"), $x + 10, $y, -1, -1)
			 GUICtrlSetTip(-1, GetTranslated(619,28, "Send info about wall upgrades."))
			 GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBOOS = GUICtrlCreateCheckbox(GetTranslated(619,29, "Error: Out Of Sync"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,30, "Send an Alert when you get the Error: Client and Server out of sync"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBVBreak = GUICtrlCreateCheckbox(GetTranslated(619,31, "Take a break"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,32, "Send an Alert when you have been playing for too long and your villagers need to rest."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertPBVillage = GUICtrlCreateCheckbox(GetTranslated(619,33, "Village Report"), $x + 10, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,34, "Send a Village Report."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastAttack = GUICtrlCreateCheckbox(GetTranslated(619,35, "Alert Last Attack"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,36, "Send info about the Last Attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBOtherDevice = GUICtrlCreateCheckbox(GetTranslated(619,37, "Another device connected"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,38, "Send an Alert when your village is connected to from another device."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

$hGUI_NOTIFY_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(600,19,"PushBullet Help"))
	Local $x = 25, $y = 45
		$lblgrppushbullet = GUICtrlCreateGroup(GetTranslated(620,0, "PushBullet Instructions :"), $x - 20, $y - 20, 430, 334)
			$x -= 10
			$lblPBdesc = GUICtrlCreateLabel(" " & @CRLF & _
			    GetTranslated(620,1, "BOT") & " " & GetTranslated(620,14,"HELP") & GetTranslated(620,2, " - send this help message") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(620,15,"DELETE") & GetTranslated(620,3, " - delete all your previous messages") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,16,"RESTART") & GetTranslated(620,4, " - restart the bot named <Village Name> and Android Emulator") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,17,"STOP") & GetTranslated(620,5, " - stop the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,18,"PAUSE") & GetTranslated(620,6, " - pause the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,19,"RESUME") & GetTranslated(620,7, " - resume the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,20,"STATS") & GetTranslated(620,8, " - send Village Statistics of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,21,"LOG") & GetTranslated(620,9, " - send the current log file of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,22,"LASTRAID") & GetTranslated(620,10, " - send the last raid loot screenshot of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,23,"LASTRAIDTXT") & GetTranslated(620,11, " - send the last raid loot values of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,24,"SCREENSHOT") & GetTranslated(620,12, " - send a screenshot of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,1,"ACC <Target1><~><Target8>") & GetTranslated(638,11, " - reorder COC accounts") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,2,"PRO <Pro1><~><Pro8>") & GetTranslated(638,12, " - reorder bot profiles") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,3,"GETORDER") & GetTranslated(638,13, " - get current CoC account and bot profile") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,4,"STOPSTART") & GetTranslated(638,14, " - stop then start bot again") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,5,"ALLPRO <Pro1><~><Pro8>") & GetTranslated(638,15, " - set up profiles correspond to all exists accounts") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,6,"MAP <Pro1>-<Pro2>") & GetTranslated(638,16, " - set up profile for only one account") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,7,"ADD n") & GetTranslated(638,17, " - add account number n to playing list") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,8,"REM n") & GetTranslated(638,18, " - remove account number n from playing list") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,9,"HIDE") & GetTranslated(638,19, " - hide android emulator") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,10,"ATKP 1/0") & GetTranslated(638,20, " - 1-enable/0-disable attack plan"), $x, $y - 5, -1, -1, $SS_LEFT)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;Telegram[Surbiks]
$hGUI_NOTIFY_TAB_ITEM3 = GUICtrlCreateTabItem("Telegram")
	Global $grpTelegram, $chkTEnabled,$chkTRemote,$btnDeleteTMessages,$cmbHoursTelegram
	Global $TelegramTokenValue, $OrigTelegram, $chkAlertTVMFound, $chkAlertTLastRaid, $chkAlertTLastRaidTxt, $chkAlertTCampFull
	Global $chkAlertTWallUpgrade, $chkAlertTOOS, $chkAlertTVBreak, $chkAlertTVillage, $chkAlertTLastAttack
	Global $chkAlertTOtherDevice

	Local $x = 25, $y = 45
		$grpTelegram = GUICtrlCreateGroup("Telegram Alert", $x - 20, $y - 20, 430, 334)
		$x -= 10
		$picTelegram = GUICtrlCreateIcon ($pIconLib, $eIcnTelegram, $x + 3, $y, 32, 32)
		$chkTEnabled = GUICtrlCreateCheckbox("Enable", $x + 40, $y)
			GUICtrlSetOnEvent(-1, "chkTEnabled")
			GUICtrlSetTip(-1, "Enable Telegram notifications")
		$y += 22
		$chkTRemote = GUICtrlCreateCheckbox("Remote Control", $x + 40, $y)
			GUICtrlSetTip(-1, "Enables Telegram Remote function")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 30
		$lblTelegramTokenValue = GUICtrlCreateLabel(GetTranslated(619,14, "Access Token") & ":", $x, $y, -1, -1, $SS_RIGHT)
		$TelegramTokenValue = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
			GUICtrlSetTip(-1, GetTranslated(619,15, "You need a Token to use Telegram notifications. Get a token from Telegram.org"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 25
		$lblOrigTelegram = GUICtrlCreateLabel(GetTranslated(619,16, "Origin") & ":", $x, $y, -1, -1, $SS_RIGHT)
			$txtTip = GetTranslated(619,17, "Origin - Village name.")
			GUICtrlSetTip(-1, $txtTip)
		$OrigTelegram = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 25
		$lblNotifyTWhen = GUICtrlCreateLabel("Send a Telegram message for these options : ", $x, $y, -1, -1, $SS_RIGHT)
	    $y += 15
		$chkAlertTVMFound = GUICtrlCreateCheckbox(GetTranslated(619,19, "Match Found"), $x + 10, $y)
			GUICtrlSetTip(-1, GetTranslated(619,20, "Send the amount of available loot when bot finds a village to attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTLastRaid = GUICtrlCreateCheckbox(GetTranslated(619,21, "Last raid as image"), $x + 100, $y)
			GUICtrlSetTip(-1, GetTranslated(619,22, "Send the last raid screenshot."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTLastRaidTxt = GUICtrlCreateCheckbox(GetTranslated(619,23, "Last raid as Text"), $x + 210, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetTip(-1, GetTranslated(619,24, "Send the last raid results as text."))
		$chkAlertTCampFull = GUICtrlCreateCheckbox(GetTranslated(619,25, "Army Camp Full"), $x + 315, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,26, "Sent an Alert when your Army Camp is full."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertTWallUpgrade = GUICtrlCreateCheckbox(GetTranslated(619,27, "Wall upgrade"), $x + 10, $y, -1, -1)
			 GUICtrlSetTip(-1, GetTranslated(619,28, "Send info about wall upgrades."))
			 GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTOOS = GUICtrlCreateCheckbox(GetTranslated(619,29, "Error: Out Of Sync"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,30, "Send an Alert when you get the Error: Client and Server out of sync"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTVBreak = GUICtrlCreateCheckbox(GetTranslated(619,31, "Take a break"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,32, "Send an Alert when you have been playing for too long and your villagers need to rest."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertTVillage = GUICtrlCreateCheckbox(GetTranslated(619,33, "Village Report"), $x + 10, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,34, "Send a Village Report."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTLastAttack = GUICtrlCreateCheckbox(GetTranslated(619,35, "Alert Last Attack"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,36, "Send info about the Last Attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertTOtherDevice = GUICtrlCreateCheckbox(GetTranslated(619,37, "Another device connected"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619,38, "Send an Alert when your village is connected to from another device."))
			GUICtrlSetState(-1, $GUI_DISABLE)


		GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
;Telegram

$hGUI_NOTIFY_TAB_ITEM4 = GUICtrlCreateTabItem(GetTranslated(600,19,"Telegram Help"))
	Local $x = 25, $y = 45
		$lblgrppushbullet = GUICtrlCreateGroup(GetTranslated(620,0, "Telegram Instructions :"), $x - 20, $y - 20, 430, 400)
			$x -= 10
			$lblTLdesc = GUICtrlCreateLabel(" " & @CRLF & _
			    "/Stats - send Village Statistics." & @CRLF & _
				"/CampStatus - send Village current camp status." & @CRLF & _
				"/Screenshot - send a screenshot from village." & @CRLF & _
				"/LastRaidText - send the last raid loot values" & @CRLF & _
				"/LastRaid - send the last raid loot screenshot" & @CRLF & _
				"/Stop - stop the bot" & @CRLF & _
				"/Pause - pause the bot" & @CRLF & _
				"/Restart - restart the bot and Android emulator" & @CRLF & _
				"/Resume - resume the bot" & @CRLF & _
				"/Help - send this help message" & @CRLF & _
				"/Unsubscribe - unsubscribe you and stop send message to you." & @CRLF & _
				"                                   (sending any message subscribe you again)" & @CRLF & _
				"/Delete - delete all your previous message" & @CRLF & _
				"/Log - send the current log file", $x, $y - 5, -1, -1, $SS_LEFT)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;GUISetState()