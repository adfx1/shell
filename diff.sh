#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 11:55
# Filename      : diff.sh
# Description   : 
##############################################################################

expr $1 + $2 &> /dev/null
[ $? -eq 0 ] && echo "cacu begin" || echo "please input 2 integer"
[ $1 -eq $2 ] && echo "equal" ||  echo "try other number" 

number1=$1
number2=$2
[ $number1 -lt $number2 ] && echo "$number1 less than $number2" || echo "sorry,i don't know"

read -p "please input 2 number: " num1 num2
[ $num1 -gt $num2 ] && echo "okay,you're right" || echo "$num2 bigger than $num1"


