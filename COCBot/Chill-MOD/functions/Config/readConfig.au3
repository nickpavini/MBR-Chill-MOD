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