#!/bin/sh

HOSTS4="gw katal newton radian farad tesla rad lux dbm neper ap-G ap-1-N ap-2-N ap-3-N"
HOSTS6="gw katal newton radian farad tesla rad lux dbm neper ap-G ap-1-N ap-2-N ap-3-N"
OUTPUT=`tempfile`

DEST=rad.22pf.org:web/s.22pf.org/host-status-radian

pinghost() {
    $1 $2 -w 1 -q -n > /dev/null 2>&1
    if [ "$?" = "0" ] ; then
        status="online"
    else
        status="offline"
    fi
}

echo -n > $OUTPUT

for i in $HOSTS4; do
    pinghost ping $i
    echo $i v4 $status >> $OUTPUT
done

for i in $HOSTS6; do
    pinghost ping6 $i
    echo $i v6 $status >> $OUTPUT
done

chmod 644 $OUTPUT
rsync -az --partial $OUTPUT $DEST
rm $OUTPUT
