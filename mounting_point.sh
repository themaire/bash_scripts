#! /bin/bash

# Check parameters
if [ $# -eq 0 ]; then
  echo "No parameters used."
  ok=1
elif [[ "$1" = "" ]]
then
  echo "1st parameter : device to mount is missing."
  ok=1
elif [[ "$1" != "" && "$2" = "" ]]
then
  echo "2nd parameter is missing : mounting target folder name in '/mnt'."
  ok=1
else
  ok=0
fi

makeLn () {
  if [[ "$3" = "ln" ]]; then
        ln -s $1 "/home/pi/$2"
  fi
}

if [[ "$ok" -eq 0 ]]; then
  # Show informations
  echo "Want to mount device : $1"
  echo "Mounting point folder : $2"


  device=$1
  folder="/mnt/$2" 

  if [[ ! -d $folder ]] # If folder not exist yet.
  then
    sudo mkdir $folder && sudo chown pi:pi $folder
    if [[ -d $folder ]]
    then
      sudo mount $device $folder
      echo "Done"
      makeLn "$folder" $2 $3
      exit 0
    else
      exit 1
    fi
  else
  sudo mount $device $folder
  makeLn "$folder" $2 $3
  fi
else
  echo "Usage exemple:"
  echo "  mounting_point.sh /dev/sda1 hdd500"
  exit 1
fi
