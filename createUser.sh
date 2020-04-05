#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 17:11
# Filename      : createUser.sh
# Description   : 
##############################################################################

read -p "profix: " profix
if [ -z $profix ]
then
  echo "don't input empty"
  exit
fi

read -p "how many user you want to creat: " num
expr $num + 1 &> /dev/null
if [ $? -ne 0 ]
then
  echo "please input intager"
  exit
fi

for i in $(seq 1 $num)
do
  id ${profix}${i} &> /dev/null
  if [ $? -ne 0 ]
  then
    echo "User ${profix}${i} not found,will create"
    useradd ${profix}${i}
    pass=$(echo $RANDOM |md5sum|cut -c1-8)
    echo $pass|passwd --stdin ${profix}${i} &> /dev/null
  else
    echo "User ${profix}${i} is exist"
  fi
done
