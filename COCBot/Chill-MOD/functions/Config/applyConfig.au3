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
			chkBBTrophyRange()
			chkEnableBBAttack()

		Case "Save"
			; Builder Base Attack
			$g_bChkEnableBBAttack = (GUICtrlRead($g_hChkEnableBBAttack) = $GUI_CHECKED)
			$g_bChkBBTrophyRange = (GUICtrlRead($g_hChkBBTrophyRange) = $GUI_CHECKED)
			$g_iTxtBBTrophyLowerLimit = GUICtrlRead($g_hTxtBBTrophyLowerLimit)
			$g_iTxtBBTrophyUpperLimit = GUICtrlRead($g_hTxtBBTrophyUpperLimit)
			$g_bChkBBAttIfLootAvail = (GUICtrlRead($g_hChkBBAttIfLootAvail) = $GUI_CHECKED)
			$g_bChkBBWaitForMachine = (GUICtrlRead($g_hChkBBWaitForMachine) = $GUI_CHECKED)
	EndSwitch
EndFunc