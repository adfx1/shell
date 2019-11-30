#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 12:18
# Filename      : wordLess5.sh
# Description   : 
##############################################################################

say="I am lizhenya teacher I am 18"

for i in $(echo $say|xargs -n1)
do
  if [ ${#i} -lt 3 ]
  then
    echo "$i"
  fi
done
