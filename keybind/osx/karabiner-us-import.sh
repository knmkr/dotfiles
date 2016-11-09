#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.app_excel_emacs_bindings 1
/bin/echo -n .
$cli set remap.app_excel_f2_to_ctrlu 1
/bin/echo -n .
$cli set remap.jis_commandL2commandL_eisuu 1
/bin/echo -n .
$cli set remap.jis_commandR2commandR_kana 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
/bin/echo
