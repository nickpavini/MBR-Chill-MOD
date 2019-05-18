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

	; Builder Base Attack
	_Ini_Add("other", "ChkEnableBBAttack", $g_bChkEnableBBAttack)
	_Ini_Add("other", "ChkBBTrophyRange", $g_bChkBBTrophyRange)
	_Ini_Add("other", "TxtBBTrophyLowerLimit", $g_iTxtBBTrophyLowerLimit)
	_Ini_Add("other", "TxtBBTrophyUpperLimit", $g_iTxtBBTrophyUpperLimit)
	_Ini_Add("other", "ChkBBAttIfLootAvail", $g_bChkBBAttIfLootAvail)
	_Ini_Add("other", "ChkBBWaitForMachine", $g_bChkBBWaitForMachine)
	_Ini_Add("other", "iBBNextTroopDelay", $g_iBBNextTroopDelay)
	_Ini_Add("other", "iBBSameTroopDelay", $g_iBBSameTroopDelay)

	; Builder Base Drop Order
	_Ini_Add("other", "bBBDropOrderSet", $g_bBBDropOrderSet)
	_Ini_Add("other", "sBBDropOrder", $g_sBBDropOrder)

	; BB Suggested Upgrades
	_Ini_Add("other", "ChkBBIgnoreWalls", $g_bChkBBIgnoreWalls)
EndFunc