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

	; Builder Base Drop Order
	IniReadS($g_bBBDropOrderSet, $g_sProfileConfigPath, "other", "bBBDropOrderSet", False, "Bool")
	$g_sBBDropOrder = IniRead($g_sProfileConfigPath, "other", "sBBDropOrder", $g_sBBDropOrderDefault)
EndFunc