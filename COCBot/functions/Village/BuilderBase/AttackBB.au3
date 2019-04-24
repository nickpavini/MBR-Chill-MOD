; #FUNCTION# ====================================================================================================================
; Name ..........: PrepareAttackBB
; Description ...: This file controls attacking preperation of the builders base
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Chilly-Chill (04-2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func AttackBB()
	local $aTL[10][2] = [ [22, 374], [59, 348], [102, 319], [137, 288], [176, 259], [209, 232], [239, 212], [270, 188], [307, 164], [347, 139] ]
	local $aTR[10][2] = [ [831, 368], [791, 334], [747, 306], [714, 277], [684, 252], [647, 227], [615, 203], [577, 177], [539, 149], [506, 123] ]
	local $iSide = Random(0, 1, 1) ; randomly choose top left or top right
	ClickP($aAway)
	SetLog("Going to attack.", $COLOR_BLUE)

	; check for troops, loot and Batlle Machine
	If Not PrepareAttackBB() Then Return
	SetDebugLog("PrepareAttackBB(): Success.")

	; search for a match
	If _Sleep(2000) Then Return
	local $aBBFindNow = [521, 308, 0xffc246, 30] ; search button
	If _CheckPixel($aBBFindNow, True) Then
		PureClick($aBBFindNow[0], $aBBFindNow[1])
	Else
		SetLog("Could not locate search button to go find an attack.", $COLOR_ERROR)
		Return
	EndIf

	; wait for the clouds to clear
	If Not CheckBattleStarted() Then Return
	If _Sleep($DELAYRESPOND) Then Return

	; Get troops on attack bar and their quantities
	local $aBBAttackBar = GetAttackBarBB()
	If _Sleep($DELAYRESPOND) Then Return

	; Deploy all troops
	local $bAttackBarEmpty = False
	while Not $bAttackBarEmpty
		For $i=0 To UBound($aBBAttackBar, 1) - 1
			PureClick($aBBAttackBar[$i][1], 660) ; select troop
			For $j=0 To $aBBAttackBar[$i][4] - 1
				local $iPoint = Random(0, 9, 1)
				If $iSide Then
					PureClick($aTR[$iPoint][0], $aTR[$iPoint][1])
				Else
					PureClick($aTL[$iPoint][0], $aTL[$iPoint][1])
				EndIf
				If _Sleep(250) Then Return ; slow down dropping of troops
			Next
			If _Sleep(1750) Then Return ; wait before next troop
		Next
		$aBBAttackBar = GetAttackBarBB(True)
		If $aBBAttackBar = "" Then $bAttackBarEmpty = True
	WEnd
	SetLog("All troops deployed")

	; Find Battle Machine
	local $aBMPos = GetMachinePos()

	; Deploy machine and continue with abilities until death
	If $g_bBBMachineReady And IsArray($aBMPos) Then
		local $bMachineAlive = True
		while $bMachineAlive
			; place hero and activate ability
			PureClickP($aBMPos)
			local $iPoint = Random(0, 9, 1)
			If $iSide Then
				PureClick($aTR[$iPoint][0], $aTR[$iPoint][1])
			Else
				PureClick($aTL[$iPoint][0], $aTL[$iPoint][1])
			EndIf
			If _Sleep(500) Then Return
			PureClickP($aBMPos)
			SetLog("Battle Machine Deployed.")
			If _Sleep($g_iBBMachAbilityTime) Then Return ; wait for machine to be available

			; give a bit of time to check if hero is dead because of the random lightning strikes through graphic
			local $timer = __TimerInit()
			$aBMPos = GetMachinePos()
			While __TimerDiff($timer) < 3000 And Not IsArray($aBMPos) ; give time to find
				$aBMPos = GetMachinePos()
				$i+=1
			WEnd

			If Not IsArray($aBMPos) Then
				$bMachineAlive = False
			EndIf
		WEnd
	EndIf

	; wait for end of battle
	SetLog("Waiting for end of battle.")
	If Not Okay() Then Return
	SetLog("Battle Ended.")
	If _Sleep(3000) Then Return

	; wait for ok after both attacks are finished
	SetLog("Waiting for opponent.")
	Okay()
	SetLog("Done. Attack was successful.")
	ZoomOut()
EndFunc

; need pics for the BB searching screen.. rn just waits 30 seconds and craps out so there is room for bugs
Func CheckBattleStarted()
	local $sSearchDiamond = GetDiamondFromRect("376,11,420,26")
	local $timer = __TimerInit()

	While 1
		local $aCoords = decodeSingleCoord(findImage("BBBattleStarted", $g_sImgBBBattleStarted, $sSearchDiamond, 1, True))
		If IsArray($aCoords) And UBound($aCoords) = 2 Then
			SetLog("Battle Started")
			Return True
		EndIf

		If __TimerDiff($timer) > $g_iBBBattleStartedTimeout Then
			SetLog("Battle did not start after " & String($g_iBBBattleStartedTimeout) & " seconds.")
			If $g_bDebugImageSave Then DebugImageSave("BBBattleStarted")
			Return False
		EndIf
	WEnd
EndFunc

Func GetMachinePos()
	If Not $g_bBBMachineReady Then Return

	local $sSearchDiamond = GetDiamondFromRect("0,630,860,732")
	local $aCoords = decodeSingleCoord(findImage("BBBattleMachinePos", $g_sImgBBBattleMachine, $sSearchDiamond, 1, True))

	If IsArray($aCoords) And UBound($aCoords) = 2 Then
		Return $aCoords
	Else
		If $g_bDebugImageSave Then DebugImageSave("BBBattleMachinePos")
	EndIf

	Return
EndFunc

Func Okay()
	local $timer = __TimerInit()

	While 1
		local $aCoords = decodeSingleCoord(findImage("OkayButton", $g_sImgOkButton, "FV", 1, True))
		If IsArray($aCoords) And UBound($aCoords) = 2 Then
			PureClickP($aCoords)
			Return True
		EndIf

		If __TimerDiff($timer) >= 120000 Then
			SetLog("Could not find button 'Okay'", $COLOR_ERROR)
			If $g_bDebugImageSave Then DebugImageSave("BBFindOkay")
			Return False
		EndIf

		If Mod(__TimerDiff($timer), 3000) Then
			If _Sleep($DELAYRESPOND) Then Return
		EndIf

	WEnd

	Return True
EndFunc