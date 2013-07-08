;; reverse the mouse wheel, emulating a Touch device
WheelUp::
Send {WheelDown}
Return

WheelDown::
Send {WheelUp}
Return


;; use CAPS-LOCK as a CTRL key
capslock::ctrl
^p::send ^{up}


LCtrl::Return




; allow to type Italian accented letters on an Apple us-keyboard
; alt + Windows + Return     -> Switches between Italian and US keyboard
; alt + Windows + a          -> à
; alt + Windows + e          -> è
; alt + Windows + e +shift   -> é
; alt + Windows + i          -> ì
; alt + Windows + o          -> ò
; alt + Windows + u          -> ù

; See http://msdn.microsoft.com/en-us/library/dd318693%28v=vs.85%29.aspx
; for the language identifiers list.
it := DllCall("LoadKeyboardLayout", "Str", "00000410", "Int", 1)
en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)

#!Enter::
w := DllCall("GetForegroundWindow")
pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
l := DllCall("GetKeyboardLayout", "UInt", pid)
if (l = en)
{
    PostMessage 0x50, 0, %it%,, A
}
else
{
    PostMessage 0x50, 0, %en%,, A
}
return

+!#e::
Send,é
return

!#e::
Send,è
return

#!o::
Send,ò
return

#!u::
Send,ù
return

#!i::
Send,ì
return

#!a::
Send,à
return

