; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design MOD - Debug.au3
; Description ...: This file creates the "Debug" Tab Under "MOD" Tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Fahid.Mahmood
; Modified ......: Chilly-Chill
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hBtnTestGlobalChatBot = 0, $g_hBtnTestClanChatBot = 0, $g_hBtnTestGoblinXP = 0, $g_hBtnTestDoubleTrain = 0
Global $g_hBtnTestBotHumanization = 0, $g_hBtnTestGTFO = 0, $g_hBtnTestStopForWar = 0, $g_hBtnTestCheckOneGem = 0, $g_hBtnCollectorsOutside = 0


Func CreateDebugTab()
	Local $x = 5, $y = 45 ;For Border
	Local $yNext = 30
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - MOD Debug", "Group_01", "MOD Debug"), $x, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab2)
	$x = 300
	$y += 17
	$g_hBtnTestBotHumanization = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - MOD Debug", "BtnTestBotHumanization", "Test Bot Humanization"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestBotHumanization")
	$y += $yNext
	$g_hBtnTestStopForWar = 0 = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - MOD Debug", "BtnTestStopForWar", "Test Stop For War"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestStopForWar")
EndFunc