#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-26 19:23
# Filename      : length.sh
# Description   : 
##############################################################################
for i in i am robot but friendly
do
  if [[ ${#i} -lt 4 ]];
  then
    echo $i;
  fi
done
