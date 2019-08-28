; #FUNCTION# ====================================================================================================================
; Name ..........: CheckStopForWar
; Description ...: T
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Demen
; Modified ......: Chilly-Chill (08/2019)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Func CheckStopForWar()

	Local $asResetTimer = ["", "", "", "", "", "", "", ""], $abResetBoolean[8] = [False, False, False, False, False, False, False, False]
	Static $sTimeToRecheck = "", $bTimeToStop = False ; single account mode
	Static $asTimeToRecheck[8] = ["", "", "", "", "", "", "", ""], $abTimeToStop[8] = [False, False, False, False, False, False, False, False] ; switch account mode
	Static $asTimeToReturn[8] = ["", "", "", "", "", "", "", ""]
	Static $abStopForWar[8] = [False, False, False, False, False, False, False, False]
	Static $abTrainWarTroop[8] = [False, False, False, False, False, False, False, False]

	If $g_bFirstStart Then ; reset statics
		$sTimeToRecheck = ""
		$bTimeToStop = False
	EndIf

	If ProfileSwitchAccountEnabled() Then
		If $g_bFirstStart Then ; reset statics all accounts
			$asTimeToRecheck = $asResetTimer
			$asTimeToReturn = $asResetTimer
			$abTimeToStop = $abResetBoolean
			$abStopForWar = $abResetBoolean
			$abTrainWarTroop = $abResetBoolean
		EndIf

		; Load Timer of Current Account
		$sTimeToRecheck = $asTimeToRecheck[$g_iCurAccount]
		$bTimeToStop = $abTimeToStop[$g_iCurAccount]

		; Circulate all accounts to turn Active if reaching TimeToReturn / Idle if reaching TimeToStop and Not need to train war troop
		$abStopForWar[$g_iCurAccount] = $g_bStopForWar
		$abTrainWarTroop[$g_iCurAccount] = $g_bTrainWarTroop
		For $i = 0 To $g_iTotalAcc
			If $i = $g_iCurAccount Or Not $abStopForWar[$i] Then ContinueLoop ; bypass Current account Or Feature disable
			If _DateIsValid($asTimeToReturn[$i]) Then
				If _DateDiff("n", _NowCalc(), $asTimeToReturn[$i]) <= 0 Then
					SetLog("Account [" & $i + 1 & "] should back to farm now.", $COLOR_INFO)
					If GUICtrlRead($g_ahChkAccount[$i]) = $GUI_UNCHECKED Then
						GUICtrlSetState($g_ahChkAccount[$i], $GUI_CHECKED)
						chkAccount($i)
						SaveConfig_600_35_2() ; Save config profile after changing botting type
						ReadConfig_600_35_2() ; Update variables
						UpdateMultiStats()
						SetLog("Acc [" & $i + 1 & "] turned ON")
						SetSwitchAccLog("   Acc. " & $i + 1 & " now Active for farm", $COLOR_ACTION)
					EndIf
				EndIf
			EndIf

			If Not $abTimeToStop[$i] Or $abTrainWarTroop[$i] Then ContinueLoop ; bypass if Not yet time to stop Or Need train war troop
			If _DateIsValid($asTimeToRecheck[$i]) Then
				If _DateDiff("n", _NowCalc(), $asTimeToRecheck[$i]) <= 0 Then
					SetLog("Account [" & $i + 1 & "] should stop for war now.", $COLOR_INFO)
					If GUICtrlRead($g_ahChkAccount[$i]) = $GUI_CHECKED Then
						GUICtrlSetState($g_ahChkAccount[$i], $GUI_UNCHECKED)
						chkAccount($i)
						SaveConfig_600_35_2() ; Save config profile after changing botting type
						ReadConfig_600_35_2() ; Update variables
						UpdateMultiStats()
						SetLog("Acc [" & $i + 1 & "] turned OFF")
						SetSwitchAccLog("   Acc. " & $i + 1 & " now Idle for war", $COLOR_ACTION)
					EndIf
				EndIf
			EndIf
		Next
	EndIf

	If Not $g_bStopForWar Then Return

	If _DateIsValid($sTimeToRecheck) Then
		If _DateDiff("n", _NowCalc(), $sTimeToRecheck) > 0 Then Return
		If $bTimeToStop Then SetLog("Should be time to stop for war now. Let's have a look", $COLOR_INFO)
	EndIf

	Local $bCurrentWar = False, $sBattleEndTime = "", $bInWar, $iSleepTime = -1
	$bCurrentWar = CheckWarTime($sBattleEndTime, $bInWar)
	If @error Or Not _DateIsValid($sBattleEndTime) Then Return

	If Not $bCurrentWar Then
		$sTimeToRecheck = _DateAdd("h", 6, _NowCalc())
		SetLog("Will come back to check in 6 hours", $COLOR_INFO)
	Else
		If Not $bInWar Then
			$sTimeToRecheck = $sBattleEndTime
			SetLog("Will come back to check after current war finish: " & $sTimeToRecheck, $COLOR_INFO)
		Else

			Local $iBattleEndTime = _DateDiff("h", _NowCalc(), $sBattleEndTime) ; in hours
			If $g_bDebugSetlog Then SetDebugLog("$iBattleEndTime: " & Round($iBattleEndTime, 2) & " hours")

			Local $iTimerToStop = $iBattleEndTime - 24 + Number($g_iStopTime)
			If $g_bDebugSetlog Then SetDebugLog("$iTimerToStop: " & Round($iTimerToStop, 2) & " hours")

			If $iTimerToStop > 0 Then
				$sTimeToRecheck = _DateAdd("h", $iTimerToStop, _NowCalc())
				SetLog("Will stop for war preparation in " & Int($iTimerToStop) & "h " & Mod($iTimerToStop * 60, 60) & "m", $COLOR_INFO)
				$bTimeToStop = True
			Else
				$sTimeToRecheck = "" ; remove timer
				$bTimeToStop = False

				$iSleepTime = $iBattleEndTime - $g_iReturnTime
				If $iSleepTime < 1 Then
					SetLog("It's time to stop for war. But stop time window is too tight, just skip and continue", $COLOR_INFO)
					SetLog("Will come back to check in 6 hours", $COLOR_INFO)
					$sTimeToRecheck = _DateAdd("h", 6, _NowCalc())
				EndIf
			EndIf
		EndIf
	EndIf

	If ProfileSwitchAccountEnabled() Then ; Save Timer of Current Account
		$asTimeToRecheck[$g_iCurAccount] = $sTimeToRecheck
		$abTimeToStop[$g_iCurAccount] = $bTimeToStop
		If $iSleepTime >= 1 Then $asTimeToReturn[$g_iCurAccount] = _DateAdd("h", $iSleepTime, _NowCalc())
	EndIf

	If $iSleepTime >= 1 Then
		SetLog("Stop and prepare for war now", $COLOR_INFO)
		StopAndPrepareForWar($iSleepTime) ; quit function here
	EndIf

EndFunc   ;==>CheckStopForWar

Func IsWarMenu()
	Local $Result = _ColorCheck(_GetPixelColor(826, 34, True), "FFFFFF", 20)
	Return $Result
EndFunc   ;==>IsWarMenu

Func CheckWarTime(ByRef $sResult, ByRef $bResult) ; return [Success + $sResult = $sBattleEndTime, $bResult = $bInWar] OR Failure

	$sResult = ""
	Local $directory = @ScriptDir & "\COCBot\Chill-MOD\Images\WarPage"
	Local $bBattleDay_InWar = False, $sWarDay, $sTime

	If IsMainPage() Then
		$bBattleDay_InWar = _ColorCheck(_GetPixelColor(45, 500, True), "ED151D", 20) ; Red color in war button
		If $g_bDebugSetlog Then SetDebugLog("Checking battle notification, $bBattleDay_InWar = " & $bBattleDay_InWar)
		Click(40, 530) ; open war menu
		If _Sleep(1000) Then Return
	EndIf

	If IsWarMenu() Then
		If $bBattleDay_InWar Then
			$sWarDay = "Battle"
			$bResult = True
		Else
			$sWarDay = QuickMIS("N1", $directory, 360, 85, 360 + 145, 85 + 28, True) ; Prepare or Battle
			$bResult = Not(QuickMIS("BC1", $directory, 359, 127, 510, 154, True)); $bInWar.... Fixed (08/2019)
			If $g_bDebugSetlog Then SetDebugLog("$sResult QuickMIS N1/BC1: " & $sWarDay & "/ " & $bResult)
			If $sWarDay = "none" Then Return SetError(1, 0, "Error reading war day")
		EndIf

		If Not StringInStr($sWarDay, "Battle") And Not StringInStr($sWarDay, "Preparation") Then
			SetLog("Your Clan is not in active war yet.", $COLOR_INFO)
			Click(70, 680, 1, 500, "#0000") ; return home
			Return False

		Else
			$sTime = QuickMIS("OCR", $directory, 396, 65, 396 + 70, 70 + 20, True)
			If $g_bDebugSetlog Then SetDebugLog("$sResult QuickMIS OCR: " & ($bBattleDay_InWar ? $sWarDay & ", " : "") & $sTime)
			If $sTime = "none" Then Return SetError(1, 0, "Error reading war time")

			Local $iConvertedTime = ConvertOCRTime("War", $sTime, False)
			If $iConvertedTime = 0 Then Return SetError(1, 0, "Error converting war time")

			; set $sResult to be the date and time of war end
			If StringInStr($sWarDay, "Preparation") Then
				SetLog("Clan war is now in preparation. Battle will start in " & $sTime, $COLOR_INFO)
				$sResult = _DateAdd("n", $iConvertedTime + 24 * 60, _NowCalc()) ; $iBattleFinishTime
			ElseIf StringInStr($sWarDay, "Battle") Then
				SetLog("Clan war is now in battle day. Battle will finish in " & $sTime, $COLOR_INFO)
				$sResult = _DateAdd("n", $iConvertedTime, _NowCalc()) ; $iBattleFinishTime
			EndIf

			If Not _DateIsValid($sResult) Then Return SetError(1, 0, "Error converting battle finish time")

			SetLog("You are " & ($bResult ? "" : "not ") & "in war", $COLOR_INFO)

			Click(70, 680, 1, 500, "#0000") ; return home
			Return True
		EndIf

	Else
		SetLog("Error when trying to open War window.", $COLOR_WARNING)
		Return SetError(1, 0, "Error open War window")
		ClickP($aAway, 2, 0, "#0000") ;Click Away
	EndIf
EndFunc   ;==>CheckWarTime

Func StopAndPrepareForWar($iSleepTime)

	If $g_bTrainWarTroop Then
		SetLog("Let's remove all farming troops and train war troop", $COLOR_ACTION)

		; Loading variables
		$g_bDoubleTrain = True
		If $g_iTotalSpellValue = 0 Then $g_iTotalSpellValue = 11
		If $g_iTotalCampSpace = 0 Then $g_iTotalCampSpace = 280
		If $g_bUseQuickTrainWar Then
			$g_bQuickTrainEnable = True
			$g_bQuickTrainArmy = $g_aChkArmyWar
			For $i = 0 To $eTroopCount - 1
				$g_aiArmyCompTroops[$i] = 0
				If $i < $eSpellCount Then $g_aiArmyCompSpells[$i] = 0
			Next
			$g_aiArmyCompTroops[0] = 1 ; set troop training to be a single barbarian
			$g_aiArmyCompSpells[10] = 1 ; set spell training to be a single bat spell
			; removing current army
			OpenArmyOverview(False, "StopAndPrepareForWar()")
			If Not IsQueueEmpty("Troops", False, False) Then DeleteQueued("Troops")
			If Not IsQueueEmpty("Spells", False, False) Then DeleteQueued("Spells")
			If _Sleep(300) Then Return

			If Not OpenArmyTab(False, "StopAndPrepareForWar()") Then Return
			If _Sleep(300) Then Return
			Local $toTrainFake[2][2] = [["Barb", 1], ["BtSpell", 1]] ; if the user had a bat spell or barb, delete the left over
			local $toRemove = WhatToTrain(True)
			RemoveExtraTroops($toRemove) ; delete all troops except one barb and a bat spell
			getArmySpells(False, False, False, False)
			For $i = 0 To $eSpellCount - 1
				If $g_aiCurrentSpells[$i] = 0 Then
					$g_aiArmyCompSpells[$i] = 1 ; this is to by pass TotalSpellsToBrewInGUI() in TrainSystem
					ExitLoop
				EndIf
			Next
			RemoveExtraTroops($toTrainFake) ; delete the leftover barb and bat... easy trick to delete all troops
			ClickP($aAway, 2, 0, "#0346") ;Click Away
			If _Sleep(300) Then Return
			QuickTrain() ; train
		Else
			$g_aiArmyCompTroops = $g_aiWarCompTroops
			$g_aiArmyCompSpells = $g_aiWarCompSpells
			OpenArmyOverview(False, "StopAndPrepareForWar()") ; train
			DoubleTrain(True)
		EndIf

		If _Sleep(500) Then Return
	EndIf

	If $g_bRequestCCForWar Then
		$g_bRequestTroopsEnable = True
		$g_bDonationEnabled = True
		$g_bCanRequestCC = True
		$g_abRequestCCHours[@HOUR] = True
		$g_sRequestTroopsText = $g_sTxtRequestCCForWar
		$g_abRequestType[0] = True
		$g_abRequestType[1] = True
		For $i = 0 To 2
			$g_aiClanCastleTroopWaitType[$i] = 0 ; Barb for all 3 slots
			$g_aiClanCastleTroopWaitQty[$i] = 1 ; Q'ty = 0 for all 3 slots
		Next
		For $i = 0 To $eTroopCount - 1
			$g_aiCCTroopsExpected[$i] = 0 ; remove all troops
		Next
		$g_iCurrentCCSpells = $g_iTotalCCSpells
		$g_iClanCastleSpellsWaitFirst = 10 ; fake to cheat CompareCCSpellWithGUI()
		$g_iClanCastleSpellsWaitSecond = 6 ; fake to cheat CompareCCSpellWithGUI()

		SetLog("Let's request again for war", $COLOR_ACTION)
		RequestCC()
	EndIf

	SetLog("It's war time, let's take a break", $COLOR_ACTION)

	readConfig() ; release all war variables value for war troops & requestCC

	If ProfileSwitchAccountEnabled() Then
		If GUICtrlRead($g_ahChkAccount[$g_iCurAccount]) = $GUI_CHECKED Then
			Local $aActiveAccount = _ArrayFindAll($g_abAccountNo, True)
			If UBound($aActiveAccount) > 1 Then
				GUICtrlSetState($g_ahChkAccount[$g_iCurAccount], $GUI_UNCHECKED)
				chkAccount($g_iCurAccount)
				SaveConfig_600_35_2() ; Save config profile after changing botting type
				ReadConfig_600_35_2() ; Update variables
				UpdateMultiStats(False)
				SetLog("Acc [" & $g_iCurAccount + 1 & "] turned OFF and start over with another account")
				SetSwitchAccLog("   Acc. " & $g_iCurAccount + 1 & " now Idle for war", $COLOR_ACTION)

				For $i = 0 To UBound($aActiveAccount) - 1
					If $aActiveAccount[$i] <> $g_iCurAccount Then
						$g_iNextAccount = $aActiveAccount[$i]
						If $g_iGuiMode = 1 Then
							; normal GUI Mode
							_GUICtrlComboBox_SetCurSel($g_hCmbProfile, _GUICtrlComboBox_FindStringExact($g_hCmbProfile, $g_asProfileName[$g_iNextAccount]))
							cmbProfile()
							DisableGUI_AfterLoadNewProfile()
						Else
							; mini or headless GUI Mode
							saveConfig()
							$g_sProfileCurrentName = $g_asProfileName[$g_iNextAccount]
							LoadProfile(False)
						EndIf
						$g_bInitiateSwitchAcc = True
						ExitLoop
					EndIf
				Next

				runBot()
			ElseIf UBound($aActiveAccount) = 1 Then
				SetLog("This is the last active account for switching, close CoC anyway")
			EndIf
		EndIf
	EndIf

	UniversalCloseWaitOpenCoC($iSleepTime * 60 * 1000, "StopAndPrepareForWar", False, True) ; wake up & full restart

EndFunc   ;==>StopAndPrepareForWar