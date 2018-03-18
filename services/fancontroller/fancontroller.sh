#!/usr/bin/env bash
low=1
mid=31
high=32

while true
do
  maxtemp="$(sudo hddtemp /dev/sg[1-6] | grep -Po '(\d{2}).C$' | colrm 3 | sort -rn | head -n 1)" 

  if [ $maxtemp -ge $low ]
  then
    ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x32
  fi

  if [ $maxtemp -ge $mid ]
  then
    ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x42
  fi

  if [ $maxtemp -ge $high ]
  then
     ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x64
  fi

  sleep 15
done
