; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control MOD Tab Debug
; Description ...: This file is used for Chill MOD GUI functions of Debug tab will be here.
; Author ........: Fahid.Mahmood
; Modified ......: Chilly-Chill
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func btnTestBotHumanization()
	SetLog("Test Bot Humanization Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasUseBotHumanization = $g_bUseBotHumanization
	;For Debug Purpose set run state to true temporarily
	$g_bRunState = True
	$g_bUseBotHumanization = True
	_GUICtrlTab_ClickTab($g_hTabMain, 0)
	BotHumanization()

	;Reset to orignal state
	$g_bRunState = $wasRunState
	$g_bUseBotHumanization = $wasUseBotHumanization

	SetLog("Test Bot Humanization Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestBotHumanization

Func btnTestStopForWar()
	SetLog("Test Stop For War Started", $COLOR_DEBUG)

	Local $wasRunState = $g_bRunState
	Local $wasFirstStart = $g_bFirstStart
	Local $wasStopForWar = $g_bStopForWar
	;For Debug Purpose set run state to true temporarily
	$g_bRunState = True
	$g_bStopForWar = True
	$g_bFirstStart = True
	_GUICtrlTab_ClickTab($g_hTabMain, 0)
	CheckStopForWar()

	;Reset to orignal state
	$g_bStopForWar = $wasStopForWar
	$g_bFirstStart = $wasFirstStart
	$g_bRunState = $wasRunState

	SetLog("Test Stop For War Ended", $COLOR_DEBUG)

EndFunc   ;==>btnTestStopForWar