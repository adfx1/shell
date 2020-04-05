#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 17:32
# Filename      : tmpDirStatus.sh
# Description   : 
##############################################################################

touchTime=0
fileSize=0

for i in $(find /tmp/ -type f -size +4k -exec ls {} \;)
do
  if [ -f $i ]
  then
    fileSize=$(ls -lh $i |awk '{print $5}')
    touchTime=$(stat $i |awk -F "[ .]" '/^Modify/{print $2"-"$3}')  
    echo "FILE NAME : $i"
    echo "FILE SIZE IS: ${fileSize}"
    echo "CREATE TIME IS : ${touchTime}"
    echo "---------------------------------------"
  fi
done
