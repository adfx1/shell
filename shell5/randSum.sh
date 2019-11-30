#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 17:13
# Filename      : randSum.sh
# Description   : 
##############################################################################

sum=0
while :
do
  num=$(echo $[RANDOM%100+1])
  sum=$(echo $[$sum+$num])
  if [ $sum -gt 1000 ]
  then
    echo "sum is $sum"
    if [ $[$num%3] -eq 0 ]
    then
      echo "last num $num can be execute"
    else
      echo "last num $num can't be execute"
    fi
    break
  fi
done
