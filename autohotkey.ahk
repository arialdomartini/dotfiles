;; reverse the mouse wheel, emulating a Touch device 
WheelUp::
Send {WheelDown}
Return

WheelDown::
Send {WheelUp}
Return