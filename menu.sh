#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 16:51
# Filename      : menu.sh
# Description   : 
##############################################################################

echo "1. 我是憨憨"
echo "2. 你是憨憨"
echo "3. 都是憨憨"

read -p "选择一个憨憨: " hanhan
  case $hanhan in
    1) echo "你选择了自己"
      ;;
    2) echo "你选择了我"
      ;;
    3) echo "大家都是憨憨了"
      ;;
    *) echo "选择一个哦"
        break
      ;;
  esac
