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

			; Humanization
			GUICtrlSetState($g_hChkUseBotHumanization, $g_bUseBotHumanization ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkUseAltRClick, $g_bUseAltRClick ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkCollectAchievements, $g_bCollectAchievements ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hChkLookAtRedNotifications, $g_bLookAtRedNotifications ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkUseBotHumanization()
			For $i = 0 To 12
				_GUICtrlComboBox_SetCurSel($g_acmbPriority[$i], $g_iacmbPriority[$i])
			Next
			For $i = 0 To 1
				_GUICtrlComboBox_SetCurSel($g_acmbMaxSpeed[$i], $g_iacmbMaxSpeed[$i])
			Next
			For $i = 0 To 1
				_GUICtrlComboBox_SetCurSel($g_acmbPause[$i], $g_iacmbPause[$i])
			Next
			For $i = 0 To 1
				GUICtrlSetData($g_ahumanMessage[$i], $g_iahumanMessage[$i])
			Next
			_GUICtrlComboBox_SetCurSel($g_hCmbMaxActionsNumber, $g_iCmbMaxActionsNumber)
			GUICtrlSetData($g_hChallengeMessage, $g_iTxtChallengeMessage)
			cmbStandardReplay()
			cmbWarReplay()

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

			; Humanization
			$g_bUseBotHumanization = (GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED)
			$g_bUseAltRClick = (GUICtrlRead($g_hChkUseAltRClick) = $GUI_CHECKED)
			$g_bCollectAchievements = (GUICtrlRead($g_hChkCollectAchievements) = $GUI_CHECKED)
			$g_bLookAtRedNotifications = (GUICtrlRead($g_hChkLookAtRedNotifications) = $GUI_CHECKED)
			For $i = 0 To 12
				$g_iacmbPriority[$i] = _GUICtrlComboBox_GetCurSel($g_acmbPriority[$i])
			Next
			For $i = 0 To 1
				$g_iacmbMaxSpeed[$i] = _GUICtrlComboBox_GetCurSel($g_acmbMaxSpeed[$i])
			Next
			For $i = 0 To 1
				$g_iacmbPause[$i] = _GUICtrlComboBox_GetCurSel($g_acmbPause[$i])
			Next
			For $i = 0 To 1
				$g_iahumanMessage[$i] = GUICtrlRead($g_ahumanMessage[$i])
			Next
			$g_iCmbMaxActionsNumber = _GUICtrlComboBox_GetCurSel($g_iCmbMaxActionsNumber)
			$g_iTxtChallengeMessage = GUICtrlRead($g_hChallengeMessage)

			; BB Suggested Upgrades
			$g_bChkBBIgnoreWalls = (GUICtrlRead($g_hChkBBIgnoreWalls) = $GUI_CHECKED)
	EndSwitch
EndFunc