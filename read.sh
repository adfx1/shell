#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-26 19:35
# Filename      : read.sh
# Description   : 
##############################################################################

read -p "please input some text: " text
textLength=${#text}
if [[ $textLength == 4 ]]
then
  echo "okay,you are so smart!"
else
  echo "sorry,my boy..."
fi
