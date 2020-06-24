#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

curl https://get.pimoroni.com/blinkt | bash
curl https://get.pimoroni.com/envirophat | bash

sudo pip3 install flask
sudo pip3 install pymysql
sudo pip3 install urllib3
sudo pip3 install requests
sudo pip3 install json
sudo pip3 install gpiozero

sudo apt-get install samba samba-common-bin
sudo smbpasswd -a pi
sudo /etc/init.d/samba restart

