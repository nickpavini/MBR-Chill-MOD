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
			; War Preparation
			GUICtrlSetState($g_hChkStopForWar, $g_bStopForWar ? $GUI_CHECKED : $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($g_hCmbStopTime, Abs($g_iStopTime))
			_GUICtrlComboBox_SetCurSel($g_hCmbStopBeforeBattle, $g_iStopTime < 0 ? 0 : 1)
			_GUICtrlComboBox_SetCurSel($g_hCmbReturnTime, $g_iReturnTime)

			GUICtrlSetState($g_hChkTrainWarTroop, $g_bTrainWarTroop ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkUseQuickTrainWar, $g_bUseQuickTrainWar ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmyWar[0], $g_aChkArmyWar[0] ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmyWar[1], $g_aChkArmyWar[1] ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmyWar[2], $g_aChkArmyWar[2] ? $GUI_CHECKED : $GUI_UNCHECKED)

			For $i = 0 To $eTroopCount - 1
				GUICtrlSetData($g_ahTxtTrainWarTroopCount[$i], $g_aiWarCompTroops[$i])
			Next
			For $j = 0 To $eSpellCount - 1
				GUICtrlSetData($g_ahTxtTrainWarSpellCount[$j], $g_aiWarCompSpells[$j])
			Next
			GUICtrlSetState($g_hChkRequestCCForWar, $g_bRequestCCForWar ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_hTxtRequestCCForWar, $g_sTxtRequestCCForWar)
			ReadConfig_600_52_2()
			ChkStopForWar()

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

			; Daily Discounts
			For $i=0 To $g_iDDCount-1
				GUICtrlSetState($g_ahChkDD_Deals[$i], $g_abChkDD_Deals[$i] = True ? $GUI_CHECKED : $GUI_UNCHECKED)
			Next
			GUICtrlSetBkColor($g_hBtnDailyDiscounts, $g_bDD_DealsSet = True ? $COLOR_GREEN : $COLOR_RED)

		Case "Save"
			; War Preparation
			$g_bStopForWar = GUICtrlRead($g_hChkStopForWar)  = $GUI_CHECKED

			$g_iStopTime = _GUICtrlComboBox_GetCurSel($g_hCmbStopTime)
			If _GUICtrlComboBox_GetCurSel($g_hCmbStopBeforeBattle) = 0 Then $g_iStopTime = $g_iStopTime * -1
			$g_iReturnTime = _GUICtrlComboBox_GetCurSel($g_hCmbReturnTime)

			$g_bTrainWarTroop = GUICtrlRead($g_hChkTrainWarTroop) = $GUI_CHECKED
			$g_bUseQuickTrainWar = GUICtrlRead($g_hChkUseQuickTrainWar) = $GUI_CHECKED
			$g_aChkArmyWar[0] = GUICtrlRead($g_ahChkArmyWar[0]) = $GUI_CHECKED
			$g_aChkArmyWar[1] = GUICtrlRead($g_ahChkArmyWar[1]) = $GUI_CHECKED
			$g_aChkArmyWar[2] = GUICtrlRead($g_ahChkArmyWar[2]) = $GUI_CHECKED
			For $i = 0 To $eTroopCount - 1
				$g_aiWarCompTroops[$i] = GUICtrlRead($g_ahTxtTrainWarTroopCount[$i])
			Next
			For $j = 0 To $eSpellCount - 1
				$g_aiWarCompSpells[$j] = GUICtrlRead($g_ahTxtTrainWarSpellCount[$j])
			Next

			$g_bRequestCCForWar = GUICtrlRead($g_hChkRequestCCForWar) = $GUI_CHECKED
			$g_sTxtRequestCCForWar = GUICtrlRead($g_hTxtRequestCCForWar)

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