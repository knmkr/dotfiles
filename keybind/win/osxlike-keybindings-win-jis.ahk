;; Natural scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}


;; OSX-like key bindings
;; Muhenkan
vk1Dsc07B::Send {vk1Dsc07B}        ; Muhenkan
vk1Dsc07B & c::Send ^c
vk1Dsc07B & d::Send #d             ; Show desktop (win+d)
vk1Dsc07B & f::Send ^f
vk1Dsc07B & h::Send ^h
vk1Dsc07B & l::Send ^l
vk1Dsc07B & m::WinMinimize A       ; Minimize active window
vk1Dsc07B & n::Send ^n
vk1Dsc07B & o::Send ^o
vk1Dsc07B & p::Send ^p
vk1dsc07b & q::Send !{F4}          ; Quit
vk1Dsc07B & r::Send ^r
vk1Dsc07B & s::Send ^s
vk1Dsc07B & t::Send ^t
vk1Dsc07B & v::Send ^v
vk1Dsc07B & w::Send ^w
vk1Dsc07B & x::Send ^x
vk1Dsc07B & z::Send ^z
vk1Dsc07B & 1::Send ^1
vk1Dsc07B & 2::Send ^2
vk1Dsc07B & 3::Send ^3
vk1Dsc07B & 4::Send ^4
vk1Dsc07B & 5::Send ^5
vk1Dsc07B & 6::Send ^6
vk1Dsc07B & 7::Send ^7
vk1Dsc07B & 8::Send ^8
vk1Dsc07B & 9::Send ^9
vk1Dsc07B & 0::Send ^0

; TODO: cmd+shift+t
; vk1Dsc07B & t::Send ^+t

vk1Dsc07B & {::Send ^{PgUp}        ; Previous tab
vk1Dsc07B & }::Send ^{PgDn}        ; Next tab
; vk1Dsc07B & {::Send ^+{Tab}       ; Previous tab
; vk1Dsc07B & }::Send ^{Tab}        ; Next tab

vk1Dsc07B & Tab::AltTab
; vk1Dsc07B & Tab::ShiftAltTab      ; FIXME

vk1Dsc07B & LButton::Send ^{LButton}

; TODO:
; Spotlight (cmd+shift+space) to #f

; TODO:
; Finder
; rename (Enter) to F2
; execute (cmd+down) to Enter

;; Henkan
vk1Csc079::Send {vk1Csc079}        ; Henkan
vk1Csc079 & <::Send ^{Home}        ; Go to top
vk1Csc079 & >::Send ^{End}         ; Go to bottom
; vk1Csc079 & `;::Send !`;


;; Emacs-like key bindings
<^b::Send {Left}
<^f::Send {Right}
<^p::Send {Up}
<^n::Send {Down}
<^a::Send {Home}
<^e::Send {End}
<^j::Send {Enter}
<^h::Send {BS}
<^d::Send {Delete}

kill_line()
{
  Send {ShiftDown}{END}{ShiftUp}
  Sleep 50  ;[ms]
  Send ^x
  Return
}
<^k::kill_line()  ; kill line
<^y::Send ^v      ; yank


;; Applications
SetTitleMatchMode 2  ; a window's title can contain WinTitle anywhere inside it to be a match

;; Chrome
;; https://support.google.com/chrome/answer/157179?hl=en
#IfWinActive ahk_class Chrome_WidgetWin_1
  vk1Dsc07B & i::Send, ^+J               ; open developer tools (cmd-option-i) to ^+J
  vk1Dsc07B & b::Send, ^+B               ; show/hide bookmark bar (cmd-shift-b) to ^+B
  vk1Dsc07B & n::Send, ^+N               ; open in secret mode (cmd-shift-n) to ^+N
#IfWinActive
