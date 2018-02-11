#o::
WinSet, Alwaysontop, , A

WinGet, ExStyle, ExStyle, A
if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST
{
  WinSet, Transparent, 204, A
}
else
{
  WinSet, Transparent, 255, A
}
return