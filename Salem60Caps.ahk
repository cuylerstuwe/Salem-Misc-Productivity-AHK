; Latest version: Added Caps+Space as Numpad0

; TODO: Other numpad-specific scancodes w/ caps (i.e., Caps + 1,2,3 as Numpad /,*,-)

LShift & Capslock::
SetCapsLockState, % (State:=!State) ? "on" : "alwaysoff"
Return

g_artificalControlAlreadySent := false
g_realControlPressed := false
g_AbortSendEsc := false
g_CapsShifted := false

~LControl::
if(g_CapsShifted and g_artificialControlAlreadySent) {
	g_realControlPressed := true
}
Return

~LControl Up::
	g_realControlPressed := false
Return

#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
g_DoNotAbortSendEsc := true
g_CapsShifted := true
Send {LControl Down}
g_artificalControlAlreadySent := true
KeyWait, CapsLock
g_CapsShifted := false
Send {LControl Up}
OutputDebug, %A_PriorKey%
if ( A_PriorKey = "CapsLock")
{
	if(g_DoNotAbortSendEsc){
		Send {Esc}
	}
}
return

DoRegularBehavior(letter) {
	
	modifiers := ""
	processedLetter := letter
		
	if(GetKeyState("LControl", "P")) {
		modifiers = ^%modifiers%
	}
	if(GetKeyState("LAlt", "P")) {
		modifiers = !%modifiers%
	}
	
	if(GetKeyState("LShift", "P")) {
		StringUpper, processedLetter, processedLetter
	}
	
	if(letter = "space") {
		processedLetter := "{Space}"
	}
	
	fullQuery = %modifiers%%processedLetter%
	
	SendInput, %fullQuery%
}

DoNumpadOrRegularBehavior(letter, numpadString) {
	
	global g_DoNotAbortSendEsc
	global g_CapsShifted
	
	g_DoNotAbortSendEsc := false
	
	OutputDebug, NumpadShifted: %g_CapsShifted%
	
	if(g_CapsShifted) {
		Send {LControl Up}
		SendInput {%numpadString%}
	}
	else {
		DoRegularBehavior(letter)
	}
}

~*^b::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^r::
~*^t::
~*^u::
~*^v::
~*^y::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Return::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12::
    g_DoNotAbortSendEsc := false
    return

*q::
	DoNumpadOrRegularBehavior("q", "Numpad7")
	return

*w::
	DoNumpadOrRegularBehavior("w", "Numpad8")
	return
*e::
	DoNumpadOrRegularBehavior("e", "Numpad9")
	return
*a::
    DoNumpadOrRegularBehavior("a", "Numpad4")
	return

*s::
    DoNumpadOrRegularBehavior("s", "Numpad5")
	return

*d::
	DoNumpadOrRegularBehavior("d", "Numpad6")
	return

*z::
	DoNumpadOrRegularBehavior("z", "Numpad1")
	return

*x::
	DoNumpadOrRegularBehavior("x", "Numpad2")
	return

*c::
	DoNumpadOrRegularBehavior("c", "Numpad3")
	return
	
*Space::
	DoNumpadOrRegularBehavior("space", "Numpad0")