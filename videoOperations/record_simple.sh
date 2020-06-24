#!/bin/sh

# rec.sh
	# Record a video rush from the pi camera

# Changelog
# 2016/05/21 Creation
# 2016/07/15 Add the $second to specify the time in second and not in millisecond

# Usage
	# rec.sh "name" "fps" "time in second" "resolutions" "exposure mode" "metering"
	# ./scripts/camera/rec.sh testFullHD 30 30 FULLHD auto matrix

#### Variables ####
path=/home/pi/

date=$(date +"%Y-%m-%d-%H%M%S")

outputDir="$path/raspivid"
filename="$date-$1"
if [ ! -d $outputDir ] # If $outputDir does not exist
then # Create it!
	sudo mkdir -p $outputDir
fi
second=$(($3 * 1000))
echo $second

# Set resolution
if [ $4 = "FULLHD" ]
	then
		w="1920"
		h="1080"
elif [ $4 = "HD" ]
	then
		w="1280"
		h="720"
elif [ $4 = "SD" ]
	then
		w="640"
		h="480"
fi

#### Program ####

# Record

raspivid -rot 180 -w $w -h $h -fps $2 -o $outputDir/$filename.h264 -t $second --exposure $5 --metering $6 -pf hight -lev 4.2 -v -n

# Wrap into a mp4 file
#MP4Box -fps $2 -add $outputDir/$filename.h264 $outputDir/$filename.mp4
MP4Box -add $outputDir/$filename.h264 $outputDir/$filename.mp4


# Drop the h264 file
rm -v $outputDir/$filename.h264


#### End ####
exit 0
