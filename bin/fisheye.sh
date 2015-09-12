#!/bin/bash
# De-fisheyes a picture. Expects to work with a fullsize tiff version
# exported from the D800. Other sizes and formats won't work
#
# Use:
#
# fisheye.sh DIW_5445.tiff
#
# leaves the new file in /tmp/fisheye

INPUTFILE=$1
FILENAME=$(basename $INPUTFILE)
FILEBASENAME=${FILENAME%\.*}
TEMPFILE=/tmp/fisheye/${FILEBASENAME}_Hug
OUTPUTFILE=${TEMPFILE}.jpg

/Applications/Hugin/Hugin.app/Contents/Resources/HuginStitchProject.app/Contents/MacOS/nona  -z LZW  -r ldr -m TIFF_m -o $TEMPFILE -i 0 /Users/iain/Code/fisheye/DIW_5445.pto $INPUTFILE

/Applications/Hugin/Hugin.app/Contents/Resources/HuginStitchProject.app/Contents/MacOS/enblend --compression=90 -f8997x6105+847+511 -o $OUTPUTFILE -- ${TEMPFILE}0000.tif

/usr/local/bin/exiftool -TagsFromFile $INPUTFILE -f $OUTPUTFILE
