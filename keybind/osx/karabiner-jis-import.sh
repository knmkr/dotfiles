#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.jis_kana2commandR_kana 1
/bin/echo -n .
$cli set remap.commandL2optionL 1
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set remap.jis_eisuu2commandL_eisuu 1
/bin/echo -n .
/bin/echo
