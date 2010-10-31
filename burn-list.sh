#!/bin/bash

GENISO="genisoimage -D -r --joliet-long -graft-points -path-list $2"

blocks=`$GENISO --print-size --quiet`

$GENISO | wodim -vv fs=96m tsize=${blocks}s speed=$1 -ignsize -eject -
