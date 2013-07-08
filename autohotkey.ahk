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




;; ctrl+e => Emacs
LCtrl & e::
if WinExist("ahk_class Emacs")
    WinActivate
else
    Run "C:\Users\user\emacs-24.3\bin\runemacs.exe"
return


;; ctrl+c => Chrome
LCtrl & c::
if WinExist("ahk_class Chrome_WidgetWin_0")
    WinActivate
else
	if WinExist("ahk_class Chrome_WidgetWin_1")
	    WinActivate
	else
		if WinExist("ahk_class Chrome_WidgetWin_2")
		    WinActivate
		else
		    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
return

;; ctrl+s => Skype
LCtrl & s::
if WinExist("ahk_class tSkMainForm")
    WinActivate
else
    Run "C:\Program Files (x86)\Skype\Phone\Skype.exe"
return

;; ctrl+j => Eclipse
LCtrl & j::
if WinExist("ahk_class SWT_Window0")
    WinActivate
else
    Run "C:\Program Files (x86)\eclipse\eclipse.exe"
return


;; ctrl+t => Cygwin
LCtrl & t::
if WinExist("ahk_class mintty")
    WinActivate
else
    Run "C:\cygwin\bin\mintty.exe"
return

