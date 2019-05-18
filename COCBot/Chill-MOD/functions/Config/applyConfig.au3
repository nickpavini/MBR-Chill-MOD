; #FUNCTION# ====================================================================================================================
; Name ..........: applyConfig_MOD
; Description ...: Applies all of the  variable to the GUI
; Syntax ........: applyConfig_MOD()
; Parameters ....: $TypeReadSave = "Read" : Read GUI Values and set Variables. $TypeReadSave = "Save" : Set the GUI Settings with the Variables
; Return values .: NA
; Author ........: Chilly-Chill (05/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func ApplyConfig_MOD($TypeReadSave) ;Applies the data from config to the controls in GUI
	Switch $TypeReadSave
		Case "Read"
			; Builder Base Attack
			GUICtrlSetState($g_hChkEnableBBAttack, $g_bChkEnableBBAttack ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkBBTrophyRange, $g_bChkBBTrophyRange ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_hTxtBBTrophyLowerLimit, $g_iTxtBBTrophyLowerLimit)
			GUICtrlSetData($g_hTxtBBTrophyUpperLimit, $g_iTxtBBTrophyUpperLimit)
			GUICtrlSetState($g_hChkBBAttIfLootAvail, $g_bChkBBAttIfLootAvail ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkBBWaitForMachine, $g_bChkBBWaitForMachine ? $GUI_CHECKED : $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($g_hCmbBBNextTroopDelay, (($g_iBBNextTroopDelay - $g_iBBNextTroopDelayDefault) / $g_iBBNextTroopDelayIncrement) + 4) ; set combos based on delays
			_GUICtrlComboBox_SetCurSel($g_hCmbBBSameTroopDelay, (($g_iBBSameTroopDelay - $g_iBBSameTroopDelayDefault) / $g_iBBSameTroopDelayIncrement) + 4)
			chkBBTrophyRange()
			chkEnableBBAttack()

			; Builder Base Drop Order
			If $g_bBBDropOrderSet Then
				GUICtrlSetState($g_hChkBBCustomDropOrderEnable, $GUI_CHECKED)
				GUICtrlSetState($g_hBtnBBDropOrderSet, $GUI_ENABLE)
				GUICtrlSetState($g_hBtnBBRemoveDropOrder, $GUI_ENABLE)
				Local $asBBDropOrder = StringSplit($g_sBBDropOrder, "|")
				For $i=0 To $g_iBBTroopCount - 1
					_GUICtrlComboBox_SetCurSel($g_ahCmbBBDropOrder[$i], _GUICtrlComboBox_SelectString($g_ahCmbBBDropOrder[$i], $asBBDropOrder[$i+1]))
				Next
				GUICtrlSetBkColor($g_hBtnBBDropOrder, $COLOR_GREEN)
			EndIf

			; BB Suggested Upgrades
			GUICtrlSetState($g_hChkBBIgnoreWalls, $g_bChkBBIgnoreWalls ? $GUI_CHECKED : $GUI_UNCHECKED)

		Case "Save"
			; Builder Base Attack
			$g_bChkEnableBBAttack = (GUICtrlRead($g_hChkEnableBBAttack) = $GUI_CHECKED)
			$g_bChkBBTrophyRange = (GUICtrlRead($g_hChkBBTrophyRange) = $GUI_CHECKED)
			$g_iTxtBBTrophyLowerLimit = GUICtrlRead($g_hTxtBBTrophyLowerLimit)
			$g_iTxtBBTrophyUpperLimit = GUICtrlRead($g_hTxtBBTrophyUpperLimit)
			$g_bChkBBAttIfLootAvail = (GUICtrlRead($g_hChkBBAttIfLootAvail) = $GUI_CHECKED)
			$g_bChkBBWaitForMachine = (GUICtrlRead($g_hChkBBWaitForMachine) = $GUI_CHECKED)

			; BB Suggested Upgrades
			$g_bChkBBIgnoreWalls = (GUICtrlRead($g_hChkBBIgnoreWalls) = $GUI_CHECKED)
	EndSwitch
EndFunc