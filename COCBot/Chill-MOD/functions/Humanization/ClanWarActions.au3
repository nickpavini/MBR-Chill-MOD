; #FUNCTION# ====================================================================================================================
; Name ..........: Bot Humanization
; Description ...: This file contains all functions of Bot Humanization feature - War Part
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 11/11/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2018
;                  MyBotRun is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......: ---
;================================================================================================================================

Func LookAtCurrentWar()
	Click(40, 530 + $g_iBottomOffsetY) ; open war menu
	randomSleep(5000)

	If IsWarMenu() Then
		Local $bWarType = QuickMIS("N1", $g_sImgHumanizationCurrentWar, 740, 320 + $g_iMidOffsetY, 835, 580 + $g_iMidOffsetY) ;October Update
		If $bWarType = "CurrentWar" Or $bWarType = "CurrentWarCwl" Then ;Check if it is Simple War Or Cwl War
			SetLog("Let's examine the " & $bWarType & " map...", $COLOR_ACTION1)
			Scroll(Random(2, 5, 1)) ; scroll enemy
			randomSleep(3000)

			If $bWarType = "CurrentWar" Then
				Local $LookAtHome = Random(0, 1, 1)
				If $LookAtHome = 1 Then
					SetLog("Looking at home territory...", $COLOR_ACTION1)
					Click(790, 370 + $g_iMidOffsetY) ; go to home territory
					Scroll(Random(2, 5, 1)) ; scroll home
					randomSleep(3000)
				EndIf
			EndIf

			SetLog("Open War details menu...", $COLOR_ACTION1)
			If $bWarType = "CurrentWar" Then Click(800, 670 + $g_iBottomOffsetY) ; go to war details
			If $bWarType = "CurrentWarCwl" Then Click(810, 570 + $g_iMidOffsetY) ; go to Cwl war details
			randomSleep(1500)

			If IsClanOverview() Then
				Local $FirstMenu = Random(1, 2, 1)
				Switch $FirstMenu
					Case 1
						SetLog("Looking at first tab...", $COLOR_ACTION1)
						Click(180, 80 + $g_iMidOffsetY) ; click first tab
					Case 2
						SetLog("Looking at second tab...", $COLOR_ACTION1)
						Click(360, 80 + $g_iMidOffsetY) ; click second tab
				EndSwitch
				randomSleep(1500)

				Scroll(Random(1, 3, 1)) ; scroll the tab

				Local $SecondMenu = Random(1, 2, 1)
				Switch $SecondMenu
					Case 1
						SetLog("Looking at third tab...", $COLOR_ACTION1)
						Click(530, 80 + $g_iMidOffsetY) ; click the third tab
					Case 2
						SetLog("Looking at fourth tab...", $COLOR_ACTION1)
						Click(700, 80 + $g_iMidOffsetY) ; click the fourth tab
				EndSwitch
				randomSleep(1500)

				Scroll(Random(2, 4, 1)) ; scroll the tab

				Click(830, 80 + $g_iMidOffsetY) ; close window
				randomSleep(1500)
				Click(70, 680 + $g_iBottomOffsetY) ; return home
			Else
				SetLog("Error when trying to open War Details window... skipping...", $COLOR_WARNING)
			EndIf
		Else
			SetLog("Your Clan is not in active war yet... skipping...", $COLOR_WARNING)
			randomSleep(1500)
			Click(70, 680 + $g_iBottomOffsetY) ; return home
		EndIf
	Else
		SetLog("Error when trying to open War window... skipping...", $COLOR_WARNING)
	EndIf
EndFunc   ;==>LookAtCurrentWar

Func WatchWarReplays()
	Click(40, 530 + $g_iBottomOffsetY) ; open war menu
	randomSleep(5000)
	Local $bWarType = QuickMIS("N1", $g_sImgHumanizationCurrentWar, 740, 320 + $g_iMidOffsetY, 835, 580 + $g_iMidOffsetY) ;October Update
	If (QuickMIS("BC1", $g_sImgHumanizationWarDetails, 740, 620 + $g_iBottomOffsetY, 850, 720 + $g_iBottomOffsetY) And $bWarType = "CurrentWar") Or $bWarType = "CurrentWarCwl" Then
		SetLog("Open War details menu...", $COLOR_ACTION1)
		If $bWarType = "CurrentWar" Then Click(800, 670 + $g_iBottomOffsetY) ; go to war details
		If $bWarType = "CurrentWarCwl" Then Click(810, 570 + $g_iMidOffsetY) ; go to Cwl war details
		randomSleep(1500)

		If IsClanOverview() Then
			SetLog("Looking at second tab...", $COLOR_ACTION1)
			Click(360, 80 + $g_iMidOffsetY) ; go to replays tab
			randomSleep(1500)

			If IsBestClans() Then
				Local $ReplayNumber = QuickMIS("Q1", $g_sImgHumanizationReplay, 780, 240 + $g_iMidOffsetY, 840, 670 + $g_iBottomOffsetY)

				If $ReplayNumber > 0 Then
					SetLog("There are " & $ReplayNumber & " replays to watch... We will choose one of them...", $COLOR_INFO)
					Local $ReplayToLaunch = Random(1, $ReplayNumber, 1)

					Click(810, 269 + 74 * ($ReplayToLaunch - 1) + $g_iMidOffsetY) ; click on the choosen replay

					WaitForReplayWindow()

					If IsReplayWindow() Then
						GetReplayDuration()
						randomSleep(1000)

						If IsReplayWindow() Then
							AccelerateReplay(0)
						EndIf

						randomSleep($g_aReplayDuration[1] / 3)

						If IsReplayWindow() Then
							DoAPauseDuringReplay(0)
						EndIf

						randomSleep($g_aReplayDuration[1] / 3)

						If IsReplayWindow() And $g_aReplayDuration[0] <> 0 Then
							DoAPauseDuringReplay(0)
						EndIf

						SetLog("Waiting for replay end...", $COLOR_ACTION)

						While IsReplayWindow()
							Sleep(2000)
						WEnd

						randomSleep(1000)
						Click(70, 680 + $g_iBottomOffsetY) ; return home
					EndIf
				Else
					SetLog("No replay to watch yet... skipping...", $COLOR_WARNING)
				EndIf
			Else
				SetLog("Error when trying to open Replays menu... skipping...", $COLOR_WARNING)
			EndIf
		Else
			SetLog("Error when trying to open War Details window... skipping...", $COLOR_WARNING)
		EndIf

		Click(830, 80 + $g_iMidOffsetY) ; close window
		randomSleep(3500)
		Click(70, 680 + $g_iBottomOffsetY) ; return home
	Else
		SetLog("Your Clan is not in active war yet... skipping...", $COLOR_WARNING)
		randomSleep(1500)
		Click(70, 680 + $g_iBottomOffsetY) ; return home
	EndIf
EndFunc   ;==>WatchWarReplays
