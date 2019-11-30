#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 17:04
# Filename      : while.sh
# Description   : 
##############################################################################

echo '按下 <CTRL-D> 退出'
echo -n '输入1-4之间数字'
while read hanhan
do
newhanhan=$hanhan
case $newhanhan in
  1) echo "你选择了自己"
    break
  ┊ ;;
  2) echo "你选择了我"
    break
  ┊ ;;
  3) echo "大家都是憨憨了"
    break
  ┊ ;;
  *) echo "选择一个哦"
      break
  ┊ ;;
esac
done
