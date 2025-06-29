#SingleInstance Force
#Requires AutoHotkey v2.0+

; === Configuration ===
global message := "WTB"
global afk := false
global paused := false

; === Utilities ===
centeredToolTip(text, duration := 1000) {
    ToolTip(text, A_ScreenWidth / 2, A_ScreenHeight / 2)
    SetTimer(() => ToolTip(), -duration)
}

; === Main Paste Loop ===
pasteLoop() {
    global afk, paused, message

    loop {
        if !afk
            break
        if paused {
            Sleep(1000)
            continue
        }

        ; Prepare
        KeyWait("Control")
        KeyWait("Alt")
        KeyWait("Tab")
        KeyWait("Space")
        KeyWait("Enter")
        KeyWait("Esc")
        KeyWait("BS")
        KeyWait("Shift")

        BlockInput(True)
        active_id := WinGetID("A")
        MouseGetPos(&mousex, &mousey)
        WinActivate("ahk_exe Warframe.x64.exe")
        Sleep(20)

        ; Send message
        SendInput(message)
        Sleep(50)
        Send("{Enter}")
        Sleep(50)
        Send("{t}")
        Sleep(50)
        Send("{Backspace}")
        Sleep(50)

        ; Restore
        WinActivate("ahk_id " . active_id)
        MouseMove(mousex, mousey)
        BlockInput(False)

        ; Wait for 2 minutes, 5 seconds
        Sleep(125000)
    }
}

; === Hotkeys ===

^r::Reload  ; Ctrl+R to reload the script

^j::  ; Ctrl+J to start/stop the paste loop
{
    global afk
    afk := !afk
    if afk {
        centeredToolTip("Script enabled!", 2000)
        pasteLoop()
    } else {
        centeredToolTip("Script stopped!", 2000)
    }
}

^p::  ; Ctrl+P to pause/resume the paste loop
{
    global paused
    paused := !paused
    centeredToolTip(paused ? "Paused" : "Resumed", 2000)
}

^m::  ; Ctrl+M to update the message
{
    global message
    msg := InputBox("Enter a new message to use:", "Update Message")
    if msg.Result = "OK" && msg.Value != ""
    {
        message := msg.Value
        centeredToolTip("Message updated!", 2000)
    }
}
