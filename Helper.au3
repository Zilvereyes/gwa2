#include <Array.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ColorConstants.au3>

#include "GWA2.au3"

; Path to the GWA2 library file
Global $sFilePath = @ScriptDir & "\GWA2.au3"

; Read the functions from the GWA2 library
Global $aFunctions = _ReadFunctions($sFilePath)
Global $aFunctionFullCode = _ReadFullFunctionCode($sFilePath)
Global $LBS_SORT, $LBS_NOTIFY

; Create the GUI
Global $hCodeGUI = 0
Global $hGUI = GUICreate("Function Finder", 600, 400)
Global $idCredits = GUICtrlCreateLabel("Created by MrJambix", 10, 380, 580, 20)
GUICtrlSetColor($idCredits, $CLR_BLACK)
Global $idInput = GUICtrlCreateInput("", 10, 10, 480, 20)
Global $idList = GUICtrlCreateList("", 10, 40, 580, 350, $LBS_SORT + $LBS_NOTIFY)
GUICtrlSetColor($idList, $CLR_BLACK)
Global $idSearchBtn = GUICtrlCreateButton("Search", 500, 10, 80, 20)
GUISetState(@SW_SHOW, $hGUI)

While 1
    $msg = GUIGetMsg()

    If $hCodeGUI <> 0 And WinActive($hCodeGUI) And $msg = $GUI_EVENT_CLOSE Then
        GUIDelete($hCodeGUI)
        $hCodeGUI = 0
        ContinueLoop
    EndIf

    Switch $msg
        Case $GUI_EVENT_CLOSE
            Exit

        Case $GUI_EVENT_PRIMARYDOWN
            If WinActive($hGUI) Then
                If $hCodeGUI <> 0 Then
                    GUIDelete($hCodeGUI)
                    $hCodeGUI = 0
                EndIf
            EndIf

        Case $idSearchBtn
            _FilterFunctions(GUICtrlRead($idInput))

        Case $idList
            If GUICtrlRead($idList) <> "" Then
                _ShowFunctionCode(GUICtrlRead($idList))
            EndIf
    EndSwitch
WEnd

Func _ReadFunctions($sPath)
    Local $aLines, $aResult = []
    If _FileReadToArray($sPath, $aLines) Then
        For $i = 1 To $aLines[0]
            If StringRegExp($aLines[$i], "Func\s+(\w+)") Then
                _ArrayAdd($aResult, StringRegExpReplace($aLines[$i], ".*Func\s+(\w+).*", "$1"))
            EndIf
        Next
    EndIf
    Return $aResult
EndFunc

Func _ReadFullFunctionCode($sPath)
    Local $aLines, $aResult = [], $sFuncCode = "", $bCollecting = False
    If _FileReadToArray($sPath, $aLines) Then
        For $i = 1 To $aLines[0]
            If StringRegExp($aLines[$i], "Func\s+(\w+)") Then
                If $bCollecting Then
                    _ArrayAdd($aResult, $sFuncCode)
                    $sFuncCode = ""
                EndIf
                $bCollecting = True
                $sFuncCode &= $aLines[$i] & @CRLF
            ElseIf $bCollecting Then
                $sFuncCode &= $aLines[$i] & @CRLF
                If StringRegExp($aLines[$i], "EndFunc") Then
                    $bCollecting = False
                    _ArrayAdd($aResult, $sFuncCode)
                    $sFuncCode = ""
                EndIf
            EndIf
        Next
    EndIf
    Return $aResult
EndFunc

Func _FilterFunctions($sSearch)
    GUICtrlSetData($idList, "")
    For $i = 0 To UBound($aFunctions) - 1
        If StringInStr($aFunctions[$i], $sSearch) Then
            GUICtrlSetData($idList, $aFunctions[$i])
        EndIf
    Next
EndFunc

Func _ShowFunctionCode($sFuncName)
    Local $sCode = ""
    For $i = 0 To UBound($aFunctions) - 1
        If $aFunctions[$i] == $sFuncName Then
            $sCode = $aFunctionFullCode[$i+1]
            ExitLoop
        EndIf
    Next
    If $sCode <> "" Then
        Local $aPos = WinGetPos($hGUI)
        Local $iNewX = $aPos[0] + $aPos[2]
        Local $iNewY = $aPos[1]

        If $hCodeGUI <> 0 Then
            GUIDelete($hCodeGUI)
            $hCodeGUI = 0
        EndIf

        $hCodeGUI = GUICreate("Function Code: " & $sFuncName, 600, 400, $iNewX, $iNewY)
        GUICtrlCreateEdit($sCode, 10, 10, 580, 380, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, $ES_AUTOVSCROLL))
        GUISetState(@SW_SHOW, $hCodeGUI)
    EndIf
EndFunc

