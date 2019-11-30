#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 19:19
# Filename      : printArrayB6.sh
# Description   : 
##############################################################################

array=(I am oldboy teacher welcome to training class)

for i in ${array[*]}
do
  if [ ${#i} -gt 6 ]
  then
    echo $i
  fi
done
