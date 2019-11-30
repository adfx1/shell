#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 17:14
# Filename      : ifdiff.sh
# Description   : 
##############################################################################

num1=$1
num2=$2

expr $num1 + $num2 &> /dev/null
if [ $? -ne 0 ]
then
  echo "please input 2 integer number"
  exit
fi

if [ $num1 -eq $num2 ]
then
  echo "$num1 equal $num2"
elif [ $num1 -lt $num2 ]
then
  echo "$num1 less than $num2"
else [ $num1 -gt $num2 ]
  echo "$num1 bigger than $num2"
fi
