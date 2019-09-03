; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control MOD Tab Humanization
; Description ...: This file is used for Chill MOD GUI functions of Humanization Tab will be here.
; Author ........: Fahid.Mahmood
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func chkUseBotHumanization()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		$g_bUseBotHumanization = True
		For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		cmbStandardReplay()
		cmbWarReplay()
	Else
		$g_bUseBotHumanization = False
		For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf
EndFunc   ;==>chkUseBotHumanization

Func chkUseAltRClick()
	If GUICtrlRead($g_hChkUseAltRClick) = $GUI_CHECKED Then
		Local $UserChoice = MsgBox(4 + 48, "Warning !!!", GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_01", "Full random click is a good feature to be as less BOT-Like as possible because it makes ALL BOT clicks random...") & _
				@CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_02", "The crazy @RoroTiti use it all the time an he says there is no problem with it... BUT, it still an experimental feature which may cause unpredictable problems...") & _
				@CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_03", "So, do you want to use it ? :)") & @CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_04", "PS : No support will be provided to you if you use this function..."))
		If $UserChoice = 6 Then
			$g_bUseAltRClick = True
		Else
			$g_bUseAltRClick = False
			GUICtrlSetState($g_hChkUseAltRClick, $GUI_UNCHECKED)
		EndIf
	Else
		$g_bUseAltRClick = False
	EndIf
EndFunc   ;==>chkUseAltRClick

Func chkCollectAchievements()
	If GUICtrlRead($g_hChkCollectAchievements) = $GUI_CHECKED Then
		$g_bCollectAchievements = True
	Else
		$g_bCollectAchievements = False
	EndIf
EndFunc   ;==>chkCollectAchievements

Func chkLookAtRedNotifications()
	If GUICtrlRead($g_hChkLookAtRedNotifications) = $GUI_CHECKED Then
		$g_bLookAtRedNotifications = True
	Else
		$g_bLookAtRedNotifications = False
	EndIf
EndFunc   ;==>chkLookAtRedNotifications

Func cmbStandardReplay()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		If (_GUICtrlComboBox_GetCurSel($g_acmbPriority[3]) > 0) Or (_GUICtrlComboBox_GetCurSel($g_acmbPriority[4]) > 0) Then
			For $i = $g_hLabel7 To $g_acmbPause[0]
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Else
			For $i = $g_hLabel7 To $g_acmbPause[0]
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
		EndIf
	EndIf
EndFunc   ;==>cmbStandardReplay

Func cmbWarReplay()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($g_acmbPriority[10]) > 0 Then
			For $i = $g_hLabel13 To $g_acmbPause[1]
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Else
			For $i = $g_hLabel13 To $g_acmbPause[1]
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
		EndIf
	EndIf
EndFunc   ;==>cmbWarReplay
