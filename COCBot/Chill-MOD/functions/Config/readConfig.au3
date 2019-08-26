; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig_MOD
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig_MOD()
; Parameters ....: NA
; Return values .: NA
; Author ........: Chilly-Chill (05/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ReadConfig_MOD()
	; <><><><> Village / Misc - War Preparation <><><><> (Demen)
	IniReadS($g_bStopForWar, $g_sProfileConfigPath, "war preparation", "Enable", False, "Bool")
	IniReadS($g_iStopTime, $g_sProfileConfigPath, "war preparation", "Stop Time", 0, "Int")
	IniReadS($g_iReturnTime, $g_sProfileConfigPath, "war preparation", "Return Time", 0, "Int")
	IniReadS($g_bTrainWarTroop, $g_sProfileConfigPath, "war preparation", "Train War Troop", False, "Bool")
	IniReadS($g_bUseQuickTrainWar, $g_sProfileConfigPath, "war preparation", "QuickTrain War Troop", False, "Bool")
	IniReadS($g_aChkArmyWar[0], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army1", False, "Bool")
	IniReadS($g_aChkArmyWar[1], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army2", False, "Bool")
	IniReadS($g_aChkArmyWar[2], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army3", False, "Bool")

	For $i = 0 To $eTroopCount - 1
		IniReadS($g_aiWarCompTroops[$i], $g_sProfileConfigPath, "war preparation", $g_asTroopShortNames[$i], 0, "Int")
	Next
	For $j = 0 To $eSpellCount - 1
		IniReadS($g_aiWarCompSpells[$j], $g_sProfileConfigPath, "war preparation", $g_asSpellShortNames[$j], 0, "Int")
	Next

	IniReadS($g_bRequestCCForWar, $g_sProfileConfigPath, "war preparation", "RequestCC War", False, "Bool")
	$g_sTxtRequestCCForWar = IniRead($g_sProfileConfigPath, "war preparation", "RequestCC War Text", "War troop please")

	; Builder Base Attack
	IniReadS($g_bChkEnableBBAttack, $g_sProfileConfigPath, "other", "ChkEnableBBAttack", False, "Bool")
	IniReadS($g_bChkBBTrophyRange, $g_sProfileConfigPath, "other", "ChkBBTrophyRange", False, "Bool")
	IniReadS($g_iTxtBBTrophyLowerLimit, $g_sProfileConfigPath, "other", "TxtBBTrophyLowerLimit", 0, "int")
	IniReadS($g_iTxtBBTrophyUpperLimit, $g_sProfileConfigPath, "other", "TxtBBTrophyUpperLimit", 5000, "int")
	IniReadS($g_bChkBBAttIfLootAvail, $g_sProfileConfigPath, "other", "ChkBBAttIfLootAvail", False, "Bool")
	IniReadS($g_bChkBBWaitForMachine, $g_sProfileConfigPath, "other", "ChkBBWaitForMachine", False, "Bool")
	IniReadS($g_iBBNextTroopDelay, $g_sProfileConfigPath, "other", "iBBNextTroopDelay", $g_iBBNextTroopDelayDefault, "int")
	IniReadS($g_iBBSameTroopDelay, $g_sProfileConfigPath, "other", "iBBSameTroopDelay", $g_iBBSameTroopDelayDefault, "int")

	; Builder Base Drop Order
	IniReadS($g_bBBDropOrderSet, $g_sProfileConfigPath, "other", "bBBDropOrderSet", False, "Bool")
	$g_sBBDropOrder = IniRead($g_sProfileConfigPath, "other", "sBBDropOrder", $g_sBBDropOrderDefault)

	; BB Suggested Upgrades
	IniReadS($g_bChkBBIgnoreWalls, $g_sProfileConfigPath, "other", "ChkBBIgnoreWalls", False, "Bool")

	; Daily Discounts
	For $i=0 To $g_iDDCount-1
		IniReadS($g_abChkDD_Deals[$i], $g_sProfileConfigPath, "other", "ChkDD_Deals" & String($i), $g_abChkDD_Deals[$i], "Bool")
	Next
	IniReadS($g_bDD_DealsSet, $g_sProfileConfigPath, "other", "DD_DealsSet", $g_bDD_DealsSet, "Bool")
EndFunc