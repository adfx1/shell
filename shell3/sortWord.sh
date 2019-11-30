#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 21:28
# Filename      : word.sh
# Description   : 
##############################################################################

read -p "选择你想要的功能" wish
case $wish in
    1)
      echo "按照单词出现的频率降序排序"
      echo "---------------------------------"
      cat /root/txt |xargs -n1|sort|uniq -c|sort -rn -k1
      ;;
    2)
      echo "按照字母出现的顺序降序排序"
      cat /root/txt|egrep -o "[a-z]"|sort|uniq -c|sort -rn -k1
      ;;
esac
