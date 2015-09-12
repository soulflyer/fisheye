#!/bin/bash
# Note that TEMPDIR is also hard coded in the import and export script
#

INSTALLDIR=/Users/iain/Code/fisheye
TEMPDIR=/tmp/fisheye
rm -r $TEMPDIR >/dev/null
mkdir $TEMPDIR
$INSTALLDIR/bin/export-selection >/dev/null
FILES=$(ls $TEMPDIR)
echo $FILES
for PICTURE in $FILES
do
    $INSTALLDIR/bin/fisheye.sh "$TEMPDIR/$PICTURE"
done
$INSTALLDIR/bin/import-pics
