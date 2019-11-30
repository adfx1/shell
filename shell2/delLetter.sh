#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 12:25
# Filename      : delLetter.sh
# Description   : 
##############################################################################

read -p "输入你要处理的文件的全路径：" file

sed -rie '6,10/[a-zA-Z]/s#(.*)##g' -ei "1,5{/[a-Z]/d}" $file
