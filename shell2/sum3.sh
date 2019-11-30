#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 15:10
# Filename      : sum3.sh
# Description   : 
##############################################################################

sum=0
for i in $(seq 1 100)
do
  if [ $[$i%3] -eq 0 ]
  then
    sum=$sum+$i;
  fi
done
echo "$[$sum]"
