LShift & Capslock::
SetCapsLockState, % (State:=!State) ? "on" : "alwaysoff"
Return

#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
g_DoNotAbortSendEsc := true
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
OutputDebug, %A_PriorKey%
if ( A_PriorKey = "CapsLock")
{
	if(g_DoNotAbortSendEsc){
		Send {Esc}
	}
}
return

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
~*^Space::
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
~*^q::
~*^w::
~*^e::
~*^a::
~*^s::
~*^d::
~*^z::
~*^x::
~*^c::
    g_DoNotAbortSendEsc := false
    return