;; Natural scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}

;; Disable Katakana-Hiragana
vkF2sc070::Return

;; OSX-like key bindings

;; Backslash on "ro" key to underscore
vkE2sc073::_

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
vk1dsc07b & q::Send !{F4}          ; Quit (cmd-q)
vk1Dsc07B & r::Send ^r
vk1Dsc07B & s::Send ^s
vk1Dsc07B & t::
	If GetKeyState("Shift")
		Send ^+t                       ; cmd+shift+t
	Else
  	Send ^t                        ; cmd+t
	Return
vk1Dsc07B & v::Send ^v
vk1Dsc07B & w::Send ^{F4}          ; Close window (cmd-w)
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

vk1Dsc07B & {::Send ^+{Tab}       ; Previous tab
vk1Dsc07B & }::Send ^{Tab}        ; Next tab

vk1Dsc07B & Tab::AltTab
; ShiftAltTab  ; FIXME

vk1Dsc07B & Up::WinMaximize A  ; #{Up}
; vk1Dsc07B & Down::
; vk1Dsc07B & Left::
; vk1Dsc07B & Right::

vk1Dsc07B & LButton::Send ^{LButton}

; TODO:
; Spotlight (cmd+shift+space) to # or #f

; TODO:
; Finder
; rename (Enter) to F2
; execute (cmd+down) to Enter

;; Henkan
vk1Csc079::Send {vk1Csc079}        ; Henkan
vk1Csc079 & <::Send ^{Home}        ; Go to top
vk1Csc079 & >::Send ^{End}         ; Go to bottom
; vk1Csc079 & `;::Send !`;

;; Emacs-like key bindings (except Cygwin)
#IfWinNotActive ahk_class mintty
  <^b::Send {Left}
  <^f::Send {Right}
  <^p::Send {Up}
  <^n::Send {Down}
  <^a::Send {Home}
  <^e::Send {End}
  <^j::Send {Enter}
  <^h::Send {BS}
  <^d::Send {Delete}
#IfWinNotActive

  kill_line()
  {
    Send {ShiftDown}{END}{ShiftUp}
    Sleep 50  ;[ms]
    Send ^x
    Return
  }

;  <^k::kill_line()  ; kill line
;  <^y::Send ^v      ; yank

;; Applications
SetTitleMatchMode 2  ; a window's title can contain WinTitle anywhere inside it to be a match

;; Cygwin
#IfWinActive ahk_class mintty
  vk1Dsc07B & c::Send ^{Ins}
  vk1Dsc07B & v::Send +{Ins}
  ; TODO: henkan to alt(meta)
#IfWinActive

;; Chrome
;; https://support.google.com/chrome/answer/157179?hl=en
#IfWinActive ahk_class Chrome_WidgetWin_1
  vk1Dsc07B & i::Send ^+J               ; open developer tools (cmd-option-i) to ^+J
  vk1Dsc07B & b::Send ^+B               ; show/hide bookmark bar (cmd-shift-b) to ^+B
  vk1Dsc07B & n::Send ^+N               ; open in secret mode (cmd-shift-n) to ^+N
  vk1Dsc07B & {::Send ^{PgUp}           ; Previous tab
  vk1Dsc07B & }::Send ^{PgDn}           ; Next tab
  ; vk1Dsc07B & Left::Send                ;
  ; vk1Dsc07B & Right::Send               ;
#IfWinActive

;; Eclipse
#IfWinActive ahk_class SWT_Window0
  vk1Dsc07B & {::Send ^{PgUp}           ; Previous tab
  vk1Dsc07B & }::Send ^{PgDn}           ; Next tab
  <^/::Send {F9}                        ; Undo
  <^.::Send {F10}                       ; Redo
  <^g::Send {Esc}
  <^[::Send {Esc}
  vk1Dsc07B & z::
    If GetKeyState("Shift","P")
      Send {F10}                   ; cmd+shift+z
    Else
      Send {F9}                    ; cmd+z
    Return
  vk1Dsc07B & x::Send ^w
  vk1Dsc07B & c::Send !w
  vk1Dsc07B & v::Send ^y

  vk1Csc079 & SC027::Send ^/       ; comment out (meta+;)
#IfWinActive

;; Explorer
#IfWinActive ahk_class CabinetWClass
  ;; Clover
  vk1Dsc07B & {::Send ^{PgUp}           ; Previous tab
  vk1Dsc07B & }::Send ^{PgDn}           ; Next tab
  vk1Dsc07B & b::Send ^+B               ; show/hide bookmark bar (cmd-shift-b) to ^+B

  ;; TortoiseGit
  ;; http://tortoisegit.org/docs/tortoisegit/tgit-automation.html
  vk1Csc079 & l::Run "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:log /path:.
  vk1Csc079 & d::Run "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:diff /path:.
  vk1Csc079 & c::Run "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:commit /path:.
  vk1Csc079 & p::Run "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:push /path:.
  vk1Csc079 & u::Run "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:pull /path:.
#IfWinActive

;; Sublime Text
#IfWinActive ahk_class PX_WINDOW_CLASS
  vk1Dsc07B & {::Send ^{PgUp}           ; Previous tab
  vk1Dsc07B & }::Send ^{PgDn}           ; Next tab
  vk1Csc079 & r::Send ^h                ; Replace
  vk1Csc079 & `;::Send ^/               ; Toggle comment region
#IfWinActive

;; Excel
#IfWinActive ahk_class XLMAIN
  vk1Csc079 & d::Send ^d                   ; fill down (Ctrl+D)
  vk1Csc079 & s::Send {ALTDOWN}e{ALTUP}is  ; fill a series (Alt+E, I, S)
#IfWinActive
