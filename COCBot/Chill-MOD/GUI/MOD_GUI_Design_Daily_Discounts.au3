; #FUNCTION# ====================================================================================================================
; Name ..........: MOD GUI Design Daily Discounts
; Description ...: Design sub gui for daily discounts
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Chilly-Chill 2019
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CreateDailyDiscountGUI()
	$g_hGUI_DailyDiscounts = _GUICreate(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "GUI_DailyDiscounts", "Village Trader Daily Discounts"), 410, 310, -1, -1, $WS_BORDER, $WS_EX_CONTROLPARENT)

	GUICtrlCreateGroup( "Gem Deals", 10, 10, 386, 225 )
		$g_ahChkDD_Deals[$g_eDDPotionTrain] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionTrain", "Training Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionTrain]) & " gems)"), 25, 40, -1, -1)
			; GUICtrlCreatePic( @ScriptDir & "\COCBot\images\DailyDiscounts\TrainPotion-12x12.bmp", 175, 40, -1, -1) ; Not working right now
		$g_ahChkDD_Deals[$g_eDDPotionClock] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionClock", "Clock Tower Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionClock]) & " gems)"), 25, 60, -1, -1)
 		$g_ahChkDD_Deals[$g_eDDPotionResource] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionResource", "Resource Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionResource]) & " gems)"), 25, 80, -1, -1)
		$g_ahChkDD_Deals[$g_eDDPotionBuilder] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionBuilder", "Builder Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionBuilder]) & " gems)"), 25, 100, -1, -1)
		$g_ahChkDD_Deals[$g_eDDPotionPower] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionPower", "Power Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionPower]) & " gems)"), 25, 120, -1, -1)
 		$g_ahChkDD_Deals[$g_eDDPotionHero] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDPotionHero", "Hero Potion" & "(" & String($g_aiDD_DealsCosts[$g_eDDPotionHero]) & " gems)"), 25, 140, -1, -1)
 		$g_ahChkDD_Deals[$g_eDDWallRing5] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDWallRing5", "Wall Ring x5" & "(" & String($g_aiDD_DealsCosts[$g_eDDWallRing5]) & " gems)"), 25, 160, -1, -1)
 		$g_ahChkDD_Deals[$g_eDDWallRing10] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "$g_hChkDDWallRing10", "Wall Ring x10" & "(" & String($g_aiDD_DealsCosts[$g_eDDWallRing10]) & " gems)"), 25, 180, -1, -1)
 		$g_ahChkDD_Deals[$g_eDDShovel] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDShovel", "Shovel x1" & "(" & String($g_aiDD_DealsCosts[$g_eDDShovel]) & " gems)"), 25, 200, -1, -1)

		$g_ahChkDD_Deals[$g_eDDBookHeros] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDBookHeros", "Book of Heros" & "(" & String($g_aiDD_DealsCosts[$g_eDDBookHeros]) & " gems)"), 225, 40, -1, -1)
		$g_ahChkDD_Deals[$g_eDDBookFighting] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDBookFighting", "Book of Fighting" & "(" & String($g_aiDD_DealsCosts[$g_eDDBookFighting]) & " gems)"), 225, 60, -1, -1)
		$g_ahChkDD_Deals[$g_eDDBookSpells] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDBookSpells", "Book of Spells" & "(" & String($g_aiDD_DealsCosts[$g_eDDBookSpells]) & " gems)"), 225, 80, -1, -1)
		$g_ahChkDD_Deals[$g_eDDBookBuilding] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDBookBuilding", "Book of Building" & "(" & String($g_aiDD_DealsCosts[$g_eDDBookBuilding]) & " gems)"), 225, 100, -1, -1)
		$g_ahChkDD_Deals[$g_eDDRuneGold] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDRuneGold", "Rune of Gold" & "(" & String($g_aiDD_DealsCosts[$g_eDDRuneGold]) & " gems)"), 225, 120, -1, -1)
		$g_ahChkDD_Deals[$g_eDDRuneElixir] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDRuneElixir", "Rune of Elixir" & "(" & String($g_aiDD_DealsCosts[$g_eDDRuneElixir]) & " gems)"), 225, 140, -1, -1)
		$g_ahChkDD_Deals[$g_eDDRuneDarkElixir] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDRuneDarkElixir", "Rune of Dark Elixir" & "(" & String($g_aiDD_DealsCosts[$g_eDDRuneDarkElixir]) & " gems)"), 225, 160, -1, -1)
		$g_ahChkDD_Deals[$g_eDDRuneBBGold] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDRuneBBGold", "Rune of BB Gold" & "(" & String($g_aiDD_DealsCosts[$g_eDDRuneBBGold]) & " gems)"), 225, 180, -1, -1)
		$g_ahChkDD_Deals[$g_eDDRuneBBElixir] = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "ChkDDRuneBBElixir", "Rune of BB Elixir" & "(" & String($g_aiDD_DealsCosts[$g_eDDRuneBBElixir]) & " gems)"), 225, 200, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_hBtnDDApply = GUICtrlCreateButton(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDApply", "Apply ✔"), 237, 245, -1, -1)
		GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDApply_info", "Set the gem deals you would like to be purchased on your behalf."))
		GUICtrlSetOnEvent(-1, "btnDDApply")

	$g_hBtnDDCancel = GUICtrlCreateButton(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDCancel", "Cancel ❌"), 312, 245, -1, -1)
		GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDCancel_info", "Exit without setting any gem deals to be purchased."))
		GUICtrlSetOnEvent(-1, "btnDDCancel")

	$g_hBtnDDClear = GUICtrlCreateButton(GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDClear", "Clear All"), 40, 245, -1, -1)
		GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design Child Village - Misc", "BtnDDClear_info", "Clear selected deals."))
		GUICtrlSetOnEvent(-1, "btnDDClear")
EndFunc