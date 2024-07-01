; Capture Ctrl + Space
^+Space up::
{
    ; Store the active window's title
    activeWindow := WinActive("A")
 
    netflixWindowById := WinExist("ahk_id 5378172")
    netflixWindow := WinExist("ahk_exe ApplicationFrameHost.exe")
    netflixWindowByTitle := WinExist("ahk_exact Netflix")   
    byNameList := WinGetList("Netflix")

    titleList := ""
    for index, value in byNameList
    {
        title := WinGetTitle(value)
        if (title == "Netflix") {
            netflixWindowByTitle := value
        }
        titleList .= value . "`n"  ; `n is the newline character
    }
    titleList .= "done"


    ; MsgBox("netflixWindow: "  netflixWindow " netflixWindowById: " netflixWindowById " titleList: " titleList " netflixWindowByTitle: " netflixWindowByTitle)

    if (netflixWindow || netflixWindowById)  ; Check if the Netflix app window exists
    {
        ; MsgBox("Discovered netflix app" )  ; Debug message for window handle

        WinActivate()  ; Activates the window found
        Send("{Space}")  ; Sends a space key press to the active window

        Sleep(100)

        ; Restore focus to the original window
        if (WinExist("ahk_id " . activeWindow))
        {
            WinActivate()  ; Activates the original window
        }
    }
}
return


; ; Capture Ctrl + Space
; ^Space::
; {
;     window := WinExist("ahk_id 5378172")  ; Replace 'yourApplication.exe' with the executable name of your target app
;     if (window)  ; Check if the window exists
;     {
;         ;MsgBox("Found")
;         ; ControlSend("{Space}", "ApplicationFrameInputSinkWindow1", "ahk_id " 5378172)
;         ; Send a space directly to the window found without activating it
;         ControlSend("{Space down}", "ApplicationFrameInputSinkWindow1", "ahk_id " 5378172)
;         Sleep(500)
;         ControlSend("{Space up}", "ApplicationFrameInputSinkWindow1" , "ahk_id " 5378172)
;     }
; }
; return