; #FUNCTION# ====================================================================================================================
; Name ..........: Chill MOD Functions
; Description ...: This file Includes several files in the current script.
; Syntax ........: #include
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
#include "functions\BuilderBase\PrepareAttackBB.au3"
#include "functions\BuilderBase\AttackBB.au3"
#include "functions\BuilderBase\GetAttackBarBB.au3"

; Daily Discounts
#include "functions\Village\DailyDiscounts.au3"

; moved to the end to avoid any global declare issues
#include "functions\Config\applyConfig.au3"
#include "functions\Config\readConfig.au3"
#include "functions\Config\saveConfig.au3"