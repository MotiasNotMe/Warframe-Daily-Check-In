;;; Warframe Daily Check In. Auto login and auto claim rewards. Created by Motias. Translated by Deepl.
	
; --- Variables and directives
#Requires AutoHotkey 2
#Warn  
#SingleInstance
CoordMode "Pixel", "Window"

if WinExist("ahk_class Launcher") {
    WinKill("ahk_class Launcher")
    Sleep 200
}
if WinExist("ahk_class WarframePublicEvolutionGfxD3D11") {
    WinKill("ahk_class WarframePublicEvolutionGfxD3D11")
    Sleep 200
}
Sleep 200
Run "steam://rungameid/230410"
WinWaitActive("ahk_class Launcher") ; - Waiting for the launcher window.

; - Searching for the play button.
Loop {
    if (ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*10 Data\en\play.png")) {
	Click FoundX, FoundY
	Goto SearchReward
     }
     else
	Sleep 1000
}      

SearchReward: ; - Award Search.
Sleep 2000
WinWaitActive("ahk_class WarframePublicEvolutionGfxD3D11")
Sleep 200
Loop 12 {
    if (ImageSearch(&FoundX1, &FoundY1, 0, 0, A_ScreenWidth, A_ScreenHeight, "*90 Data/en/rewards.png")) {
	CoordMode "Mouse"
	SendMode "Event"
	Click Ceil(A_ScreenWidth * 0.74), Ceil(A_ScreenHeight * 0.73)
	Sleep 5000                        
	WinKill("ahk_class WarframePublicEvolutionGfxD3D11")
	Sleep 200
	Send "{Left}"
	Sleep 200
	Send "{Enter}"
	return
     }
     else
        Sleep 1000
}                   
MsgBox "Rewards already claimed"
Sleep 2000
Send "{Enter}"
WinKill("ahk_class WarframePublicEvolutionGfxD3D11")
Sleep 200
Send "{Left}"
Sleep 200
Send "{Enter}"
Exit
