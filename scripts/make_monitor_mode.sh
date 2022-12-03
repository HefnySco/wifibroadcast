#!/bin/bash

# https://www.itdojo.com/courses-linux/linuxwifi/

set -x
sudo -v

echo "Wlan $1  channel $2"
sudo ifconfig $1 down
sudo iwconfig $1 wssid off
sudo iwconfig $1 power off
sudo iwconfig $1 mode Monitor
sudo ifconfig $1 up
#sudo iwconfig $1 channel $2 
#sudo iw dev wlan0 set channel 40 HT20|HT40+|HT40-|80MHz
sudo  iw dev $1 set channel $2 HT40+
sudo iwconfig $1
