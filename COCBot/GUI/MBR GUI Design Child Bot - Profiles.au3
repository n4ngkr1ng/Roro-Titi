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

Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

$hGUI_Profiles = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_BOT)
;GUISetBkColor($COLOR_WHITE, $hGUI_Profiles)

GUISwitch($hGUI_Profiles)

Local $x = 20, $y = -35

		; Chalicucu & demen: switch CoC Acc GUI
		GUICtrlCreateGroup("Multi-Farming", $x - 20, $y + 35, 440, 176)
			$x -= 8
			$y += 54
			$chkSwitchAcc = GUICtrlCreateCheckbox("Enable Switch Account", $x, $y, -1, -1)
			$txtTip = "Switch to another account & profile when camp is less than 85%" & @CRLF & _
			          "This function supports maximum 8 CoC accounts & 8 Bot profiles" & @CRLF & _
			          "Make sure to align the accounts with profiles in listing order"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSwitchAcc")

			$y += 24
			$lbTotalCoCAcc = GUICtrlCreateLabel("I have", $x , $y, 40, 20)
			$txtTotalCoCAcc = GUICtrlCreateInput("0", $x + 35 , $y - 2, 20, 20,  BitOR($GUI_SS_DEFAULT_INPUT, $SS_LEFT, $ES_NUMBER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 1)
			GUICtrlSetTip(-1,"Number of Google Accounts on emulator. Supporting maximum 8 Accounts.")
			$lbTotalCoCAccAcc = GUICtrlCreateLabel("accounts on the emulator", $x + 60 , $y, 160, 20)

			$y += 24
		    $lbActiveCoCAcc = GUICtrlCreateLabel("and I set", $x, $y, 45, 20)
		    $txtActiveCoCAcc = GUICtrlCreateInput("0", $x + 45, $y - 2, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $SS_LEFT, $ES_NUMBER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 1)
			$txtTip = "Number of Google Accounts that you set for botting."
			GUICtrlSetTip(-1,$txtTip)
		    $lbActiveCoCAccAct = GUICtrlCreateLabel("active account for botting", $x + 70, $y, 170, 20)

			$y += 24
			$lbAccBottingOrder = GUICtrlCreateLabel("and I want to switch between them into the following order :", $x , $y, 280, 20)
			$txtAccBottingOrder = GUICtrlCreateInput("12345678", $x + 285 , $y - 2, 65, 20,  BitOR($SS_LEFT, $ES_AUTOHSCROLL))
			;GUICtrlSetLimit(-1, 8)
			GUICtrlSetTip(-1,"Input the desired order of switching CoC Accounts.")

			$y += 24
			$lbProfileIdxOrder = GUICtrlCreateLabel("Each of these accounts correspond respectively to the following profiles :", $x , $y, 350, 20)
			$txtProfileIdxOrder = GUICtrlCreateInput("12345678", $x + 350 , $y - 2, 65, 20,  BitOR($SS_LEFT, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 8)
			GUICtrlSetTip(-1,"Input the order of Profiles to align with CoC Accounts order. Supporting maximum 8 Profiles")

			$y += 19
			$chkAtkPln = GUICtrlCreateCheckbox("Always attack when the army is full", $x, $y, -1, -1)
			$txtTip = "Enable/Disable attack plan"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAtkPln")
			GUICtrlSetState(-1, $GUI_CHECKED)

			$y += 19
			$chkAccRelax = GUICtrlCreateCheckbox("Close the emulator when no attack are planned on the current profile", $x, $y, -1, -1)
			$txtTip = "If attack is not planned for current profile" & @CRLF & _
								"Then bot stop emulator and relax"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAccRelaxTogether")
			;GUICtrlSetState(-1, $GUI_CHECKED)

			$y += 29
			$HelpSwich = GUICtrlCreateLabel("If it's your first configuration, please create 1 profile for each account you have. Then, empty all the boxes." & @CRLF & _
			" " & @CRLF & _
			"If you have 2 accounts : first box, enter 2, second box, enter 12, third box, enter 12, so account 1 will match with profile 1 in the list under ""Switch Profile"" at the top of this tab, and account 2 with profile 2. You can also enter 2 - 12 - 21, in this case, account 1 will match with profile 2 and account 2 with profile 1." & @CRLF & _
			" " & @CRLF & _
			"If you have 3 account, but you want to use only 2 of them : enter 3 - 13 (if you want to use account 1 and 3) - 13, so account 1 will match with profile 1 and account 3 with profile 3." & @CRLF & _
			" " & @CRLF & _
			"A last thing, you can create more complex configurations : enter 2 - 12 - 3142, so account 1 will match with profile 3 and then with profile 4 and then with profile 3... and account 2 with profile 1 then with profile 2 then with profile 1...                  Now, you should be ready, GO !!!", $x - 10 , $y, 435, 200)

		GUICtrlCreateGroup("", -99, -99, 1, 1)

		Local $x = 225, $y = 35
			$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Profiles Manager"), $x - 15, $y - 20, 225, 50)
				;$y -= 5
				$x -= 5
				;$lblProfile = GUICtrlCreateLabel(GetTranslated(7,27, "Current Profile") & ":", $x, $y, -1, -1)
				;$y += 15
				$cmbProfile = GUICtrlCreateCombo("", $x - 5, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					$txtTip = GetTranslated(637,2, "Use this to switch to a different profile")& @CRLF & GetTranslated(637,3, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
					GUICtrlSetTip(-1, $txtTip)
					setupProfileComboBox()
					PopulatePresetComboBox()
					GUICtrlSetState(-1, $GUI_SHOW)
					GUICtrlSetOnEvent(-1, "cmbProfile")
				$txtVillageName = GUICtrlCreateInput(GetTranslated(637,4, "MyVillage"), $x - 5, $y, 130, 22, $ES_AUTOHSCROLL)
					GUICtrlSetLimit (-1, 100, 0)
					GUICtrlSetFont(-1, 9, 400, 1)
					GUICtrlSetTip(-1, GetTranslated(637,5, "Your village/profile's name"))
					GUICtrlSetState(-1, $GUI_HIDE)
					; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed

				$bIconAdd = _GUIImageList_Create(22, 22, 4)
					_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
					_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
					_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
					_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
					_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
				$bIconConfirm = _GUIImageList_Create(22, 22, 4)
					_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
					_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
					_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
					_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
					_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
				$bIconDelete = _GUIImageList_Create(22, 22, 4)
					_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
					_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
					_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
					_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
					_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
				$bIconCancel = _GUIImageList_Create(22, 22, 4)
					_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
					_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
					_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
					_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
					_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
				$bIconEdit = _GUIImageList_Create(22, 22, 4)
					_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
					_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
					_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
					_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
					_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")

				$btnAdd = GUICtrlCreateButton("", $x + 133, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
					GUICtrlSetOnEvent(-1, "btnAddConfirm")
					GUICtrlSetState(-1, $GUI_SHOW)
					GUICtrlSetTip(-1, GetTranslated(637,6, "Add New Profile"))
				$btnConfirmAdd = GUICtrlCreateButton("", $x + 133, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
					GUICtrlSetOnEvent(-1, "btnAddConfirm")
					GUICtrlSetState(-1, $GUI_HIDE)
					GUICtrlSetTip(-1, GetTranslated(637,7, "Confirm"))
				$btnConfirmRename = GUICtrlCreateButton("", $x + 133, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
					GUICtrlSetOnEvent(-1, "btnRenameConfirm")
					GUICtrlSetState(-1, $GUI_HIDE)
					GUICtrlSetTip(-1, GetTranslated(637,7, -1))
				$btnDelete = GUICtrlCreateButton("", $x + 160, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
					GUICtrlSetOnEvent(-1, "btnDeleteCancel")
					GUICtrlSetState(-1, $GUI_SHOW)
					GUICtrlSetTip(-1, GetTranslated(637,8, "Delete Profile"))
					If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
						GUICtrlSetState(-1, $GUI_DISABLE)
					Else
						GUICtrlSetState(-1, $GUI_ENABLE)
					EndIf
				$btnCancel = GUICtrlCreateButton("", $x + 160, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
					GUICtrlSetOnEvent(-1, "btnDeleteCancel")
					GUICtrlSetState(-1, $GUI_HIDE)
					GUICtrlSetTip(-1, GetTranslated(637,9, "Cancel"))
				$btnRename = GUICtrlCreateButton("", $x + 188, $y, 22, 22)
					_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
					GUICtrlSetOnEvent(-1, "btnRenameConfirm")
					GUICtrlSetTip(-1, GetTranslated(637,10, "Rename Profile"))
					If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
						GUICtrlSetState(-1, $GUI_DISABLE)
					Else
						GUICtrlSetState(-1, $GUI_ENABLE)
					EndIf

				GUICtrlCreateGroup("", -99, -99, 1, 1)

;GUISetState()
