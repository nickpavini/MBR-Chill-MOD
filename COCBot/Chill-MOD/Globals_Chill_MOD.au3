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

; BB Suggested Upgrades
Global $g_hChkBBIgnoreWalls = 0
Global $g_bChkBBIgnoreWalls = 0

; Stop for war - War Preparation Demen
Global $g_bStopForWar
Global $g_iStopTime, $g_iReturnTime
Global $g_bTrainWarTroop, $g_bUseQuickTrainWar, $g_aChkArmyWar[3], $g_aiWarCompTroops[$eTroopCount], $g_aiWarCompSpells[$eSpellCount]
Global $g_bRequestCCForWar,	$g_sTxtRequestCCForWar

; Daily Discounts
Global $g_iDDCount = 18
Global $g_hGUI_DailyDiscounts = 0
Global $g_hBtnDailyDiscounts = 0
Global $g_ahChkDD_Deals[$g_iDDCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_abChkDD_Deals[$g_iDDCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_aiDD_DealsCosts[$g_iDDCount] = [25, 75, 115, 285, 300, 300, 500, 1000, 500, 500, 925, 925, 925, 1500, 1500, 3000, 1500, 1500]
Global $g_eDDPotionTrain = 0, $g_eDDPotionClock = 1, $g_eDDPotionResource = 2, $g_eDDPotionBuilder = 3, _
		$g_eDDPotionPower = 4, $g_eDDPotionHero = 5, $g_eDDWallRing5 = 6, $g_eDDWallRing10 = 7, $g_eDDShovel = 8, $g_eDDBookHeros = 9, _
		$g_eDDBookFighting = 10, $g_eDDBookSpells = 11, $g_eDDBookBuilding = 12, $g_eDDRuneGold = 13, $g_eDDRuneElixir = 14, $g_eDDRuneDarkElixir = 15, _
		$g_eDDRuneBBGold = 16, $g_eDDRuneBBElixir = 17
Global $g_hBtnDDCancel = 0, $g_hBtnDDApply = 0, $g_hBtnDDClear = 0
Global $g_bDD_DealsSet = 0

; Humanization
Global $g_iacmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_iacmbMaxSpeed[2] = [1, 1]
Global $g_iacmbPause[2] = [0, 0]
Global $g_iahumanMessage[2] = ["Hello !", "Hello !"]
Global $g_iTxtChallengeMessage = "Can you beat my village?"

Global $g_iMinimumPriority, $g_iMaxActionsNumber, $g_iActionToDo
Global $g_aSetActionPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $g_sFrequenceChain = "Never|Sometimes|Frequently|Often|Very Often"
Global $g_sReplayChain = "1|2|4"
Global $g_bUseBotHumanization = False, $g_bUseAltRClick = False, $g_iCmbMaxActionsNumber = 1, $g_bCollectAchievements = False, $g_bLookAtRedNotifications = False

Global $g_aReplayDuration[2] = [0, 0] ; An array, [0] = Minute | [1] = Seconds
Global $g_bOnReplayWindow, $g_iReplayToPause

Global $g_iLastLayout = 0