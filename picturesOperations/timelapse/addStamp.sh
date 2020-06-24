#!/bin/bash

for file in stamp*.jpg ; do
	convert $file -pointsize 32 -fill red -annotate +15+25 %[exif:DateTimeOriginal] "stamp-${file}"
	echo "$file stamped"
done