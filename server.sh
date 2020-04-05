#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 21:42
# Filename      : server.sh
# Description   : 
##############################################################################


#array[cpu_status]=0
#array[disk_status]=0
#array[mem_status]=0
#threshold=1
#while :
#do
#  array[mem_status]=$(free|awk 'NR==2{print $3/$2*100}')
#  array[disk_status]=$(df -h|awk '/\/$/{print $5}'|egrep -o "[0-9]+")
#  array[cpu_status]=$(iostat|awk 'NR==4{print $1}'|egrep -o "[0-9]+")
#  for i in ${array[*]}
#  do
#    if [ ${i} -gt $threshold ]
#    then
#      echo "$i 报警了"
#    fi
#  done
#done
cpu_status=0
disk_status=0
mem_status=0
threshold=50

while :
do
  cpu_status=$(iostat|awk 'NR==4{print $1*100}')
  disk_status=$(df -h|awk '/\/$/{print $5}'|egrep -o "[0-9]+")
  mem_status=$(free|awk 'NR==2{print $3/$2*100}')

  if [ ${cpu_status} -ge $threshold ]
  then
    echo "CPU 处于危险中!"
  fi
  
  if [ $disk_status -ge $threshold ]
  then
    echo "磁盘 处于危险中!"
  fi
  
  if [ ${mem_status%%.*} -ge $threshold ]
  then
    echo "内存 处于危险中!"
  fi
done
