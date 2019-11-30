#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 09:55
# Filename      : guestnumber.sh
# Description   : 
##############################################################################

randNum=$( echo $(($RANDOM%100+1)) )
count=1
while true
do
  read -p "Please input a number(1-100): " num
  if [ $num -eq $randNum ]
  then
    echo "You're right!"
    echo "You try it ${count} times"
    break
  elif [ $num -gt $randNum ]
  then
    echo "Your number bigger than Random Number..."
  elif [ $num -lt $randNum ]
  then
    echo "Your number less than Random Number..."
  fi
  let count++
done
