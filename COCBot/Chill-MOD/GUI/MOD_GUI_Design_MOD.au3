; #FUNCTION# ====================================================================================================================
; Name ..........: MOD GUI Design MOD
; Description ...: This file creates the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Chilly-Chill
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

#include "MOD_GUI_Design_MOD-Humanization.au3"

Global $g_hGUI_MOD = 0
Global $g_hGUI_MOD_TAB = 0, $g_hGUI_MOD_TAB_HUMANIZATION = 0, $g_hGUI_MOD_TAB_WAR_PREPARATION = 0, $g_hGUI_MOD_TAB_DEBUG = 0

Func CreateMODTab()

	$g_hGUI_MOD = _GUICreate("", $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hFrmBotEx)

	GUISwitch($g_hGUI_MOD)
	$g_hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
	$g_hGUI_MOD_TAB_HUMANIZATION = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_10_STab_01", "Humanization"))
	CreateHumanizationTab()
	$g_hGUI_MOD_TAB_WAR_PREPARATION = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_10_STab_02", "War Preparation"))
	CreateMODWarPreparationSubTab()
	$g_hGUI_MOD_TAB_DEBUG = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_10_STab_03", "Mod Debug"))
	CreateDebugTab()

	GUICtrlCreateTabItem("")

EndFunc   ; CreateMODTab
