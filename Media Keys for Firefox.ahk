; Capture ctr + shift + Space
~^Space up::
{
    ; Store the active window's title
    activeWindow := WinActive("A")

    originalTitle := WinGetTitle("ahk_id " . activeWindow)
    ; MsgBox("Active Window Handle and title: " . activeWindow . originalTitle)  ; Debug message for window handle

    firefoxByName := WinExist("Side Window Firefox")
    firefoxByExe := WinExist("firefox.exe")

    if (firefoxByName || firefoxByExe)  ; Check if the Netflix app window exists
    {
        WinActivate()  ; Activates the window found
        ; Sleep(100)
        Send("{Space}")  ; Sends a space key press to the active window
    }

    ; Restore focus to the original window
    if (WinExist("ahk_id " . activeWindow))
    {
        WinActivate()  ; Activates the original window
    }
}
return
