#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 08:48
# Filename      : 9x9.sh
# Description   : 
##############################################################################

for (( i=1;i<=9;i++ ))
do
  for (( j=$i;j<=9;j++ ))
  do
    k=$(expr $i \* $j)
    echo -n -e "${i}*${j}=$k\t"
  done
  echo
done
