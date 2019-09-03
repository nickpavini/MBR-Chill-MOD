; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design MOD - Humanization.au3
; Description ...: This file creates the "Humanization" Tab Under "MOD" Tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Fahid.Mahmood
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
Global $g_hChkUseBotHumanization = 0, $g_hChkUseAltRClick = 0, $g_acmbPriority = 0, $g_hChallengeMessage = 0, $g_ahumanMessage
Global $g_hLabel1 = 0, $g_hLabel2 = 0, $g_hLabel3 = 0, $g_hLabel4 = 0
Global $g_hLabel5 = 0, $g_hLabel6 = 0, $g_hLabel7 = 0, $g_hLabel8 = 0
Global $g_hLabel9 = 0, $g_hLabel10 = 0, $g_hLabel11 = 0, $g_hLabel12 = 0
Global $g_hLabel14 = 0, $g_hLabel15 = 0, $g_hLabel16 = 0, $g_hLabel13 = 0
Global $g_hLabel17 = 0, $g_hLabel18 = 0, $g_hLabel20 = 0
Global $g_hChkCollectAchievements = 0, $g_hChkLookAtRedNotifications = 0, $g_hCmbMaxActionsNumber = 0
Global $g_acmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbMaxSpeed[2] = [0, 0]
Global $g_acmbPause[2] = [0, 0]
Global $g_ahumanMessage[2] = ["", ""]

Func CreateHumanizationTab()
	Local $x = 25, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Group_01", "Settings"), $x - 20, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab3)

	$y += 17
	$g_hChkUseBotHumanization = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseBotHumanization", "Enable Bot Humanization"), 20, $y, 137, 17)
	GUICtrlSetOnEvent(-1, "chkUseBotHumanization")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkUseAltRClick = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick", "Make ALL BOT clicks random"), 274, $y, 162, 17)
	GUICtrlSetOnEvent(-1, "chkUseAltRClick")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$x -= 15
	$y += 30
	GUICtrlCreateIcon($g_sLibIconPath, $eIcnChat, $x, $y + 5, 32, 32)
	$g_hLabel1 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_01", "Read the Clan Chat"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[0] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", $g_sFrequenceChain), GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", "Never"))
	$g_hLabel2 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_02", "Read the Global Chat"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1), GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel4 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_04", "Say..."), $x + 40, $y + 30, 31, 17)
	$g_ahumanMessage[0] = GUICtrlCreateInput(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "HumanMessage_01", "Hello !"), $x + 75, $y + 25, 121, 21)
	$g_hLabel3 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_03", "Or"), $x + 205, $y + 30, 15, 17)
	$g_ahumanMessage[1] = GUICtrlCreateInput(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "HumanMessage_02", "Re !"), $x + 225, $y + 25, 121, 21)
	$g_acmbPriority[2] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1), GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel20 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_20", "Launch Challenges with message"), $x + 40, $y + 55, 170, 17)
	$g_hChallengeMessage = GUICtrlCreateInput(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "ChallengeMessage", "Can you beat my village?"), $x + 205, $y + 50, 141, 21)
	$g_acmbPriority[12] = GUICtrlCreateCombo("", $x + 355, $y + 50, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1), GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))

	$y += 81

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnRepeat, $x, $y + 5, 32, 32)
	$g_hLabel5 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_05", "Watch Defenses"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[3] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel6 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_06", "Watch Attacks"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[4] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel7 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_07", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[0] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel8 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_08", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[0] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnClan, $x, $y + 5, 32, 32)
	$g_hLabel9 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_09", "Look at War log"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[5] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel10 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_10", "Visit Clanmates"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[6] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel11 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_11", "Look at Best Players"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[7] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel12 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_12", "Look at Best Clans"), $x + 240, $y + 30, 110, 17)
	$g_acmbPriority[8] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnTarget, $x, $y + 5, 32, 32)
	$g_hLabel14 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_14", "Look at Current War"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[9] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel16 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_16", "Watch Replays"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[10] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	GUICtrlSetOnEvent(-1, "cmbWarReplay")
	$g_hLabel13 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_13", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel15 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_15", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[1] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnSettings, $x, $y + 5, 32, 32)
	$g_hLabel17 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_17", "Do nothing"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[11] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptions", -1),  GetTranslatedFileIni("MOD GUI Design - BotHumanization", "LblHumanizationOptionNever", -1))
	$g_hLabel18 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_18", "Max Actions by Loop"), $x + 240, $y + 5, 103, 17)
	$g_hCmbMaxActionsNumber = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5", "2")

	$y += 25

	$g_hChkCollectAchievements = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkCollectAchievements", "Collect achievements automatically"), $x + 40, $y, 182, 17)
	GUICtrlSetOnEvent(-1, "chkCollectAchievements")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkLookAtRedNotifications = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkLookAtRedNotifications", "Look at red/purple flags on buttons"), $x + 240, $y, 187, 17)
	GUICtrlSetOnEvent(-1, "chkLookAtRedNotifications")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
		GUICtrlSetState($i, $GUI_DISABLE)
	Next

	chkUseBotHumanization()

EndFunc   ;==>TabHumanizationGUI