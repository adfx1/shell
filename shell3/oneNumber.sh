#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 16:21
# Filename      : oneNumber.sh
# Description   : 
##############################################################################

read -p "输入需要处理的文档地址: " file_path

cat $file_path | while read line
do
  letter_number=$(echo $line|egrep "[0-9]" -o|wc -l)
  if [ $letter_number -eq 0 ]
  then
    echo $line
  fi
done
