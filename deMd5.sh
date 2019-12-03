#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-12-03 11:32
# Filename      : deMd5.sh
# Description   : 
##############################################################################

check(){
  for num in $md5_num
  do
    result=$(grep $num $md5_file)
  done
}
md5_file=/tmp/random_md5.txt
md5_num=$0

if [ ! -f $md5_file ]
then
  >$md5_file
  for i in {0..32767}
  do
    echo "$(echo $i|md5sum) $i" >>$md5_file
  done
  check $md5_num $md5_file
else
  check $md5_num $md5_file
fi 
