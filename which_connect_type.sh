#!/usr/bin/bash
 
redf=$(tput setaf 1)
redb=$(tput setab 1)
yellowf=$(tput setaf 3)
yellowb=$(tput setab 3)
bluef=$(tput setaf 4)
blueb=$(tput setab 4)
reset=$(tput op)
 
lsusb -tv
 
for type in $(find /sys/devices -name 'connect_type'); do
  state=$(cat $type)
  [ "$state" = "hardwired" ] && color=$yellowb
  [ "$state" = "hotplug" ] && color=$blueb
  [ "$state" = "unknown" ] && color=$redf
  echo "$type - ${color}${state}${reset}"
done
