#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 15:33
# Filename      : killtest.sh
# Description   : 
##############################################################################

read -p "请输入你要关闭的进程关键词: " process
pid=($(ps aux |grep $process |awk '{print $2}'))
for i in ${pid[*]}
do
  pkill $i
done
