#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 10:12
# Filename      : getPoint.sh
# Description   : 
##############################################################################

for i in $(seq 30)
do
  for j in $(seq 2)
  do
    getNum=$(( $RANDOM%100+1))
    if [ $getNum -eq 88 ]
    then
      echo "Crongratulation!!! Player${i},We‘re Champion!!!"
      exit
    else
      echo "Sorry...Player${i}"
    fi
  done
done
