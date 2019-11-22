; #FUNCTION# ====================================================================================================================
; Name ..........: saveConfig_MOD
; Description ...: Saves all of the GUI values to the config.ini and building.ini files
; Syntax ........: saveConfig_MOD
; Parameters ....: NA
; Return values .: NA
; Author ........: Chilly-Chill (04-2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SaveConfig_MOD()
	ApplyConfig_MOD(GetApplyConfigSaveAction())

	; <><><><> Village / Misc - War Preparation <><><><> (Demen)
	_Ini_Add("war preparation", "Enable", $g_bStopForWar ? 1 : 0)
	_Ini_Add("war preparation", "Stop Time", $g_iStopTime)
	_Ini_Add("war preparation", "Return Time", $g_iReturnTime)
	_Ini_Add("war preparation", "Train War Troop", $g_bTrainWarTroop ? 1 : 0)
	_Ini_Add("war preparation", "QuickTrain War Troop", $g_bUseQuickTrainWar ? 1 : 0)
	_Ini_Add("war preparation", "QuickTrain War Army1", $g_aChkArmyWar[0] ? 1 : 0)
	_Ini_Add("war preparation", "QuickTrain War Army2", $g_aChkArmyWar[1] ? 1 : 0)
	_Ini_Add("war preparation", "QuickTrain War Army3", $g_aChkArmyWar[2] ? 1 : 0)

	For $i = 0 To $eTroopCount - 1
		_Ini_Add("war preparation", $g_asTroopShortNames[$i], $g_aiWarCompTroops[$i])
	Next
	For $j = 0 To $eSpellCount - 1
		_Ini_Add("war preparation", $g_asSpellShortNames[$j], $g_aiWarCompSpells[$j])
	Next

	_Ini_Add("war preparation", "RequestCC War", $g_bRequestCCForWar ? 1 : 0)
	_Ini_Add("war preparation", "RequestCC War Text", $g_sTxtRequestCCForWar)

	; Humanization
	_Ini_Add("Bot Humanization", "chkUseBotHumanization", $g_bUseBotHumanization ? True : False)
	_Ini_Add("Bot Humanization", "chkUseAltRClick", $g_bUseAltRClick ? True : False)
	_Ini_Add("Bot Humanization", "chkCollectAchievements", $g_bCollectAchievements ? True : False)
	_Ini_Add("Bot Humanization", "chkLookAtRedNotifications", $g_bLookAtRedNotifications ? True : False)
	For $i = 0 To 12
		_Ini_Add("Bot Humanization", "cmbPriority[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPriority[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbMaxSpeed[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbMaxSpeed[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbPause[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPause[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "humanMessage[" & $i & "]", GUICtrlRead($g_ahumanMessage[$i]))
	Next
	_Ini_Add("Bot Humanization", "cmbMaxActionsNumber", _GUICtrlComboBox_GetCurSel($g_hCmbMaxActionsNumber))
	_Ini_Add("Bot Humanization", "challengeMessage", GUICtrlRead($g_hChallengeMessage))

	; BB Suggested Upgrades
	_Ini_Add("other", "ChkBBIgnoreWalls", $g_bChkBBIgnoreWalls)

	; Daily Discounts
	For $i=0 To $g_iDDCount-1
		_Ini_Add("other", "ChkDD_Deals" & String($i), $g_abChkDD_Deals[$i] = True ? 1 : 0)
	Next
	_Ini_Add("other", "DD_DealsSet", $g_bDD_DealsSet = True ? 1 : 0)
EndFunc