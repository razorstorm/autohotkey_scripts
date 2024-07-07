; Capture Ctrl + Space
^+Space up::
{
    ; Store the active window's title
    activeWindow := WinActive("A")
 
    netflixWindowById := WinExist("ahk_id 5378172")
    netflixWindowByExe := WinExist("ahk_exe ApplicationFrameHost.exe")
    netflixWindowByTitle := WinExist("ahk_exact Netflix")   
    netflixWindowBySearch := GetUWPWindow("Netflix") ; find UWP window with title "Netflix"
    byNameList := WinGetList("Netflix")

    ; MsgBox(activeWindow)

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

    ; MsgBox("netflixWindowByExe: " .  netflixWindowByExe . " netflixWindowById: " . netflixWindowById . " netflixWindowBySearch: " . netflixWindowBySearch . " titleList: " . titleList . " netflixWindowByTitle: " . netflixWindowByTitle)


    if (netflixWindowBySearch)  ; Check if the Netflix app window exists
    {
        WinActivate()  ; Activates the window found
        Send("{Space}")  ; Sends a space key press to the active window

        Sleep(100)

        ; Restore focus to the original window
        if (WinExist("ahk_id " . activeWindow))
        {
            ; MsgBox("window found")
            WinActivate()  ; Activates the original window
        }
        else {
            ; MsgBox("window NOT found")
        }
    }
}


GetUWPWindow(WinTitle) {
    hwnd := 0
    loop {
        hwnd := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "ApplicationFrameWindow", "ptr", 0)
        if WinExist(hwnd) {
            child := DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "Windows.UI.Core.CoreWindow", "ptr", 0)
            if WinExist(WinTitle " ahk_id" child)
                return child
        }
    } until !hwnd
    return 0
}


return
