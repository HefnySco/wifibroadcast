#!/bin/bash

set -v

####
#### WARNING!!!
#### This script is depricated and **not supported** by author!
#### I leave it only for reference for **developers**.
#### Use python services instead.
####

WLAN=$1
#BAND="5G"
BAND="2G"

CHANNEL2G=$2
#CHANNEL2G="6"
CHANNEL5G=$2
#CHANNEL5G="149"


ifconfig $WLAN down
iw dev $WLAN set monitor otherbss
iw reg set BO
ifconfig $WLAN up

case $BAND in
  "5G")
      echo "Setting $WLAN to channel $CHANNEL5G"
      ./make_monitor_mode.sh $WLAN $CHANNEL5G
      ;;
  "2G")
      echo "Setting $WLAN to channel $CHANNEL2G"
      ./make_monitor_mode.sh $WLAN $CHANNEL2G
      ;;
   *)
      echo "Select 2G or 5G band"
      exit -1;
      ;;
esac


# No UI, video only
pushd ..
./wfb_rx -p 1 -u 5600 -K gs.key $WLANS
popd
