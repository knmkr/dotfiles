#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.jis_enthumble 1
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set remap.commandL2optionL 1
/bin/echo -n .
$cli set remap.controlJ2return 1
/bin/echo -n .
$cli set remap.jis_kana2optionL_kana 1
/bin/echo -n .
/bin/echo
