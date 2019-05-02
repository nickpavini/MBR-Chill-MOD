; #FUNCTION# ====================================================================================================================
; Name ..........: Chill MOD Global Variables
; Description ...: This file Includes all global variables associated with Chill MOD
; Syntax ........: #include , Global
; Parameters ....: None
; Return values .: None
; Author ........: Chilly-Chill (05/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Builder Base Attack
Global $g_hChkEnableBBAttack = 0, $g_hChkBBTrophyRange = 0, $g_hTxtBBTrophyLowerLimit = 0, $g_hTxtBBTrophyUpperLimit = 0, $g_hChkBBAttIfLootAvail = 0, $g_hChkBBWaitForMachine = 0
Global $g_bChkEnableBBAttack = False, $g_bChkBBTrophyRange = False, $g_bChkBBAttIfLootAvail = False, $g_bChkBBWaitForMachine = False
Global $g_iTxtBBTrophyLowerLimit = 0, $g_iTxtBBTrophyUpperLimit = 5000
Global $g_bBBMachineReady = False
Global $g_aBBMachine = [0,0] ; x,y coordinates of where to click for Battle machine on attack bar
Global $g_iBBMachAbilityTime = 14000 ; in milliseconds, so 14 seconds between abilities
Global $g_iBBBattleStartedTimeout = 300000 ; time before we cancel the BB search