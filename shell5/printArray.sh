#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 19:11
# Filename      : printArray.sh
# Description   : 
##############################################################################

array=(1 2 3 4 5 6)
for i in ${array[*]}
do
  echo $i
done
