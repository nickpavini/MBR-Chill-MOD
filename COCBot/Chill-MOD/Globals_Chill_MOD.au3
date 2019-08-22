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
Global Const $g_iBBNextTroopDelayDefault = 2000,  $g_iBBSameTroopDelayDefault = 300 ; default delay times
Global $g_iBBNextTroopDelay = $g_iBBNextTroopDelayDefault,  $g_iBBSameTroopDelay = $g_iBBSameTroopDelayDefault; delay time between different and same troops
Global $g_iBBNextTroopDelayIncrement = 400,  $g_iBBSameTroopDelayIncrement = 60 ; used for math to calculate delays based on selection
Global $g_hCmbBBNextTroopDelay = 0, $g_hCmbBBSameTroopDelay = 0
Global $g_apTL[10][2] = [ [22, 374], [59, 348], [102, 319], [137, 288], [176, 259], [209, 232], [239, 212], [270, 188], [307, 164], [347, 139] ]
Global $g_apTR[10][2] = [ [831, 368], [791, 334], [747, 306], [714, 277], [684, 252], [647, 227], [615, 203], [577, 177], [539, 149], [506, 123] ]

; BB Drop Order
Global $g_hBtnBBDropOrder = 0
Global $g_hGUI_BBDropOrder = 0
Global $g_hChkBBCustomDropOrderEnable = 0
Global $g_hBtnBBDropOrderSet = 0, $g_hBtnBBRemoveDropOrder = 0, $g_hBtnBBClose = 0
Global $g_bBBDropOrderSet = False
Global Const $g_iBBTroopCount = 11
Global Const $g_sBBDropOrderDefault = "BoxerGiant|HogGlider|SuperPekka|DropShip|Witch|BabyDrag|WallBreaker|Barbarian|CannonCart|Archer|Minion"
Global $g_sBBDropOrder = $g_sBBDropOrderDefault
Global $g_ahCmbBBDropOrder[$g_iBBTroopCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

; BB Suggested Upgrades
Global $g_hChkBBIgnoreWalls = 0
Global $g_bChkBBIgnoreWalls = 0

; Daily Discounts
#Region
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
#EndRegion