#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 17:12
# Filename      : ulimit.sh
# Description   : 
##############################################################################

while :
do
  read -p "input a num in 1-4: " num
  case $num in
    1) echo "输入了 1"
#      break
      ;;
    2) echo "输入了 2"
#      break
      ;;
    3) echo "输入了 3"
#      break
      ;;
    4) echo "输入了 4"
#      break
      ;;
    *) echo "你输入的是nmb啊"
      break
      ;;
  esac
done
